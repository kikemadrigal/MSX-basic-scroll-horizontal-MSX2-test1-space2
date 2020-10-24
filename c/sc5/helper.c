void SetAdjust(signed char x, signed char y) // x and y must be between -7 and +6
{
    char vx,vy,value;
      vx=x;
      if (x<0)
        vx=16+x;
      vy=y;
      if (y<0)
        vy=16+y;
      value = (vy<<4) | vx ;
      Poke(0xFFF1,value);     // Reg 18 Save
      VDPwrite(18,value);
}
