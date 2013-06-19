#include "mruby.h"
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include "mruby/string.h"

static mrb_value
mrb_ipaddr_ntop(mrb_state *mrb, mrb_value klass)
{ 
  mrb_int af, n;
  char *addr, buf[50];

  mrb_get_args(mrb, "s", &addr, &n);
  if (n == 4) {
    af = AF_INET;
  } else if (n == 16) {
    af = AF_INET6;
  } else {
    mrb_raise(mrb, E_ARGUMENT_ERROR, "invalid address");
  }
  if (inet_ntop(af, addr, buf, sizeof(buf)) == NULL)
    mrb_raise(mrb, E_ARGUMENT_ERROR, "invalid address");
  return mrb_str_new_cstr(mrb, buf);
}

static mrb_value
mrb_ipaddr_pton(mrb_state *mrb, mrb_value klass)
{ 
  mrb_int af, n;
  mrb_value s;
  char *bp, buf[50];

  mrb_get_args(mrb, "is", &af, &bp, &n);
  if (n > sizeof(buf) - 1)
    mrb_raise(mrb, E_ARGUMENT_ERROR, "invalid address");
  memcpy(buf, bp, n);
  buf[n] = '\0';

  if (af == AF_INET) {
    struct in_addr in;
    if (inet_pton(AF_INET, buf, (void *)&in.s_addr) != 1) {
      mrb_raise(mrb, E_ARGUMENT_ERROR, "invalid address");
    }
    s = mrb_str_new(mrb, (char *)&in.s_addr, 4);
  } else if (af == AF_INET6) {
    struct in6_addr in6;
    if (inet_pton(AF_INET6, buf, (void *)&in6.s6_addr) != 1) {
      mrb_raise(mrb, E_ARGUMENT_ERROR, "invalid address");
    }
    s = mrb_str_new(mrb, (char *)&in6.s6_addr, 16);
  } else
    mrb_raise(mrb, E_ARGUMENT_ERROR, "unsupported address family");

  return s;
}

void
mrb_mruby_ipaddr_gem_init(mrb_state *mrb)
{
  struct RClass *c;

  c = mrb_define_class(mrb, "IPAddr", mrb->object_class);
  mrb_define_class_method(mrb, c, "_pton", mrb_ipaddr_pton, MRB_ARGS_REQ(1));
  mrb_define_class_method(mrb, c, "ntop", mrb_ipaddr_ntop, MRB_ARGS_REQ(1));
}

void
mrb_mruby_ipaddr_gem_final(mrb_state *mrb)
{
}
