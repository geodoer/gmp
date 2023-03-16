#include <gmp.h>

// 示例：计算10000!
int main(int argc, const char *argv[])
{
  //定义3个多精度整数（multiple precision integer）变量
  mpz_t z_i, z_s, z_o;

  //初始化
  mpz_init_set_str(z_i, "1", 10);
  mpz_init_set_str(z_s, "1", 10);
  mpz_init_set_str(z_o, "1", 10);
  /*int mpz_init_set_str(mpz_t rop, char* str, int base)
   @rop:  多精度整数变量
   @str:  字符串
   @base: 十进制
   */

  //循环10000次，并进行乘法和加法
  for (int i = 0; i < 10000; i++)
  {
    mpz_mul(z_s, z_s, z_i);
    /*void mpz_mul(mpz_t rop, mpz_t op1, mpz_t op2)
      即：rop = op1 * op2
     */
    
    mpz_add(z_i, z_i, z_o);
    /*void mpz_add(mpz_t rop, mpz_t op1, mpz_t op2);
      即：rop = op1 + op2
     */
  }

  //按大整数的格式来输出结果
  gmp_printf("%Zd\n", z_s);

  //释放空间
  mpz_clear(z_i);
  mpz_clear(z_s);
  mpz_clear(z_o);

  getchar();
  return 0;
}