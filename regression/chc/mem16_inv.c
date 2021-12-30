#include <stdlib.h>
int nondet_int();

int main()
{
  size_t L = nondet_int();
  long *x = malloc(sizeof(long)*L);
  long *y = malloc(sizeof(long)*L);
  long *z = malloc(sizeof(long)*L);
  for (size_t i = 0; i < L; i++)
  {
    z[i] = (x[i] > 0 ? x[i] : -x[i]);
    long tmp = (y[i] > 0 ? y[i] : -y[i]);
    if (z[i] < tmp) z[i] = tmp;
  }

  size_t i = nondet_int();
  if (i < L)
  {
    assert(z[i] >= x[i]);
    assert(z[i] >= y[i]);
  }
  return 0;
}