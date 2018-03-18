#=========================
CYCLIC EXAMPLES -- affine
=========================#
function zhang_1(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 5
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      1000*x5-200*x4*x5+80*x5^3,
      1900*x5+400*x2*x5-1000*x4*x5+60*x4^2*x5-160*x3*x5^2+400*x5^3,
      -550*x5+200*x2*x5+60*x3^2*x5+510*x4*x5-40*x2*x4*x5-170*x4^2*x5+18*x4^3*x5-200*x1*x5^2+20*x3*x5^2-60*x3*x4*x5^2-128*x5^3+72*x2*x5^3+60*x4*x5^3,
      100*x3*x5+200*x5^2-100*x4*x5^2+32*x5^4,
      -1000*x1*x5+500*x3*x5-20*x3*x4*x5+760*x5^2+360*x2*x5^2-700*x4*x5^2+36*x4^2*x5^2-96*x3*x5^3+240*x5^4,
      3200*x3+51200*x2*x3+115200*x1*x4+35200*x3*x4-38400*x3*x4^2+41600*x5+89600*x2*x5-43520*x3^2*x5-40000*x4*x5-138240*x2*x4*x5-39040*x4^2*x5+35840*x4^3*x5-138240*x1*x5^2-72960*x3*x5^2+138240*x3*x4*x5^2+13440*x5^3+81920*x2*x5^3+57600*x4*x5^3-76800*x4^2*x5^3-51200*x3*x5^4-12800*x5^5+38400*x4*x5^5-5120*x5^7,
      -2750-1600*x2+64000*x2^2+172800*x1*x3+72000*x3^2+12400*x4+160000*x2*x4-103680*x3^2*x4+28480*x4^2-130560*x2*x4^2-59520*x4^3+23040*x4^4+57600*x1*x5+77280*x3*x5-222720*x2*x3*x5-314880*x1*x4*x5-353280*x3*x4*x5+280320*x3*x4^2*x5+21440*x5^2-136960*x2*x5^2+134144*x3^2*x5^2-136160*x4*x5^2+315648*x2*x4*x5^2+278208*x4^2*x5^2-158208*x4^3*x5^2+112128*x1*x5^3+168192*x3*x5^3-319488*x3*x4*x5^3+45312*x5^4-85504*x2*x5^4-177920*x4*x5^4+168960*x4^2*x5^4+67840*x3*x5^5+28160*x5^6-57600*x4*x5^6+6144*x5^8,
      -836*x1+1024*x1*x2+10240*x1*x2^2-x3+21504*x1^2*x3+11520*x1*x3^2-864*x1*x4+16640*x1*x2*x4-15360*x1*x3^2*x4+7808*x1*x4^2-16384*x1*x2*x4^2-8960*x1*x4^3+3072*x1*x4^4+x5-3584*x1^2*x5+9856*x1*x3*x5-34816*x1*x2*x3*x5-38912*x1^2*x4*x5-49152*x1*x3*x4*x5+39936*x1*x3*x4^2*x5+2496*x1*x5^2-15872*x1*x2*x5^2+21504*x1*x3^2*x5^2-18816*x1*x4*x5^2+46080*x1*x2*x4*x5^2+39168*x1*x4^2*x5^2-22528*x1*x4^3*x5^2+18432*x1^2*x5^3+23808*x1*x3*x5^3-49152*x1*x3*x4*x5^3+5504*x1*x5^4-14336*x1*x2*x5^4-25344*x1*x4*x5^4+25600*x1*x4^2*x5^4+11264*x1*x3*x5^5+4096*x1*x5^6-9216*x1*x4*x5^6+1024*x1*x5^8,
      -15+7680*x1^2-856*x2+1024*x2^2+10240*x2^3-4352*x1*x3+37888*x1*x2*x3+11520*x2*x3^2+17*x4+18432*x1^2*x4-864*x2*x4+16640*x2^2*x4+20480*x1*x3*x4-15360*x2*x3^2*x4+7808*x2*x4^2-16384*x2^2*x4^2-12288*x1*x3*x4^2-8960*x2*x4^3+3072*x2*x4^4-2496*x1*x5+8192*x1*x2*x5+9856*x2*x3*x5-34816*x2^2*x3*x5-13312*x1*x3^2*x5+13312*x1*x4*x5-67584*x1*x2*x4*x5-49152*x2*x3*x4*x5-22016*x1*x4^2*x5+39936*x2*x3*x4^2*x5+10240*x1*x4^3*x5-17408*x1^2*x5^2+2496*x2*x5^2-15872*x2^2*x5^2-19712*x1*x3*x5^2+21504*x2*x3^2*x5^2-18816*x2*x4*x5^2+46080*x2^2*x4*x5^2+33792*x1*x3*x4*x5^2+39168*x2*x4^2*x5^2-22528*x2*x4^3*x5^2-5504*x1*x5^3+31744*x1*x2*x5^3+23808*x2*x3*x5^3+21248*x1*x4*x5^3-49152*x2*x3*x4*x5^3-18432*x1*x4^2*x5^3+5504*x2*x5^4-14336*x2^2*x5^4-10240*x1*x3*x5^4-25344*x2*x4*x5^4+25600*x2*x4^2*x5^4-4096*x1*x5^5+11264*x2*x3*x5^5+8192*x1*x4*x5^5+4096*x2*x5^6-9216*x2*x4*x5^6-1024*x1*x5^7+1024*x2*x5^8,
      -696*x3-3328*x2*x3+26624*x2^2*x3+27648*x1*x3^2+11520*x3^3-7808*x1*x4+31744*x1*x2*x4-864*x3*x4+37120*x2*x3*x4-15360*x3^3*x4+8960*x1*x4^2+7808*x3*x4^2-28672*x2*x3*x4^2-3072*x1*x4^3-8960*x3*x4^3+3072*x3*x4^4-106*x5+16384*x1^2*x5-2496*x2*x5+11776*x2^2*x5+12032*x1*x3*x5+9856*x3^2*x5-48128*x2*x3^2*x5+13312*x2*x4*x5-28672*x2^2*x4*x5-59392*x1*x3*x4*x5-49152*x3^2*x4*x5-22016*x2*x4^2*x5+39936*x3^2*x4^2*x5+10240*x2*x4^3*x5+5504*x1*x5^2-29696*x1*x2*x5^2+2496*x3*x5^2-35584*x2*x3*x5^2+21504*x3^3*x5^2-17152*x1*x4*x5^2-18816*x3*x4*x5^2+79872*x2*x3*x4*x5^2+12288*x1*x4^2*x5^2+39168*x3*x4^2*x5^2-22528*x3*x4^3*x5^2-5504*x2*x5^3+13312*x2^2*x5^3+27648*x1*x3*x5^3+23808*x3^2*x5^3+21248*x2*x4*x5^3-49152*x3^2*x4*x5^3-18432*x2*x4^2*x5^3+4096*x1*x5^4+5504*x3*x5^4-24576*x2*x3*x5^4-7168*x1*x4*x5^4-25344*x3*x4*x5^4+25600*x3*x4^2*x5^4-4096*x2*x5^5+11264*x3^2*x5^5+8192*x2*x4*x5^5+1024*x1*x5^6+4096*x3*x5^6-9216*x3*x4*x5^6-1024*x2*x5^7+1024*x3*x5^8,
      1375/2+400*x2-16000*x2^2-43200*x1*x3-18160*x3^2-2560*x2*x3^2-3375*x4-40160*x2*x4+6400*x2^2*x4+11520*x1*x3*x4+31360*x3^2*x4-5880*x4^2+48640*x2*x4^2-8448*x3^2*x4^2+17728*x4^3-13056*x2*x4^3-11712*x4^4+2304*x4^5+20800*x1*x5-12800*x1*x2*x5-12440*x3*x5+79360*x2*x3*x5+3328*x3^3*x5+81920*x1*x4*x5+94496*x3*x4*x5-20992*x2*x3*x4*x5-29184*x1*x4^2*x5-110016*x3*x4^2*x5+27392*x3*x4^3*x5-2672*x5^2+41536*x2*x5^2+4608*x2^2*x5^2+4352*x1*x3*x5^2-44224*x3^2*x5^2+31672*x4*x5^2-126528*x2*x4*x5^2+7680*x3^2*x4*x5^2-88496*x4^2*x5^2+36096*x2*x4^2*x5^2+75328*x4^3*x5^2-16896*x4^4*x5^2-45440*x1*x5^3-50272*x3*x5^3-4096*x2*x3*x5^3+13824*x1*x4*x5^3+124672*x3*x4*x5^3-32256*x3*x4^2*x5^3-11200*x5^4+37760*x2*x5^4+2560*x3^2*x5^4+59232*x4*x5^4-11008*x2*x4*x5^4-77120*x4^2*x5^4+19200*x4^3*x5^4-26560*x3*x5^5+6400*x3*x4*x5^5-9600*x5^6+25280*x4*x5^6-6912*x4^2*x5^6+256*x3*x5^7-2560*x5^8+768*x4*x5^8,
      250-15360*x1^2+960*x2-7680*x2^2-3840*x1*x3-4352*x3^2+22528*x2*x3^2-1316*x4-6784*x2*x4+23552*x2^2*x4+49152*x1*x3*x4+32000*x3^2*x4-864*x4^2+25600*x2*x4^2-27648*x3^2*x4^2+7808*x4^3-19456*x2*x4^3-8960*x4^4+3072*x4^5-5504*x1*x5+27648*x1*x2*x5-2496*x3*x5+27392*x2*x3*x5-13312*x3^3*x5+9472*x1*x4*x5+23168*x3*x4*x5-83968*x2*x3*x4*x5-46080*x1*x4^2*x5-71168*x3*x4^2*x5+50176*x3*x4^3*x5+5504*x2*x5^2-12288*x2^2*x5^2-25600*x1*x3*x5^2-19712*x3^2*x5^2+2496*x4*x5^2-33024*x2*x4*x5^2+55296*x3^2*x4*x5^2-18816*x4^2*x5^2+58368*x2*x4^2*x5^2+39168*x4^3*x5^2-22528*x4^4*x5^2-4096*x1*x5^3-5504*x3*x5^3+22528*x2*x3*x5^3+24576*x1*x4*x5^3+45056*x3*x4*x5^3-67584*x3*x4^2*x5^3+4096*x2*x5^4-10240*x3^2*x5^4+5504*x4*x5^4-21504*x2*x4*x5^4-25344*x4^2*x5^4+25600*x4^3*x5^4-1024*x1*x5^5-4096*x3*x5^5+19456*x3*x4*x5^5+1024*x2*x5^6+4096*x4*x5^6-9216*x4^2*x5^6-1024*x3*x5^7+1024*x4*x5^8,
      7040*x1-25600*x1*x2-1440*x3-19200*x2*x3+6144*x3^3-1280*x1*x4-12160*x3*x4+38912*x2*x3*x4+21504*x1*x4^2+29440*x3*x4^2-15360*x3*x4^3-316*x5-4480*x2*x5+21504*x2^2*x5+45056*x1*x3*x5+27136*x3^2*x5-3360*x4*x5+41472*x2*x4*x5-49152*x3^2*x4*x5+21120*x4^2*x5-52224*x2*x4^2*x5-30976*x4^3*x5+13312*x4^4*x5+512*x1*x5^2+15360*x3*x5^2-55296*x2*x3*x5^2-61440*x1*x4*x5^2-86016*x3*x4*x5^2+86016*x3*x4^2*x5^2+2496*x5^3-19968*x2*x5^3+30720*x3^2*x5^3-24320*x4*x5^3+65536*x2*x4*x5^3+60416*x4^2*x5^3-40960*x4^3*x5^3+19456*x1*x5^4+27904*x3*x5^4-66560*x3*x4*x5^4+5504*x5^5-15360*x2*x5^5-29440*x4*x5^5+33792*x4^2*x5^5+12288*x3*x5^6+4096*x5^7-10240*x4*x5^7+1024*x5^9,
      800*x3+12800*x2*x3+28800*x1*x4+8800*x3*x4-9600*x3*x4^2-18860*x5+3840*x2*x5+35840*x2^2*x5+30720*x1*x3*x5+25600*x3^2*x5+43600*x4*x5+39680*x2*x4*x5-39936*x3^2*x4*x5-23456*x4^2*x5-56832*x2*x4^2*x5-10240*x4^3*x5+9216*x4^4*x5-11520*x1*x5^2+19456*x3*x5^2-95744*x2*x3*x5^2-116736*x1*x4*x5^2-124288*x3*x4*x5^2+116736*x3*x4^2*x5^2-12512*x5^3-49152*x2*x5^3+58368*x3^2*x5^3-17344*x4*x5^3+144384*x2*x4*x5^3+95232*x4^2*x5^3-67584*x4^3*x5^3+55296*x1*x5^4+67328*x3*x5^4-144384*x3*x4*x5^4+9728*x5^5-44032*x2*x5^5-68480*x4*x5^5+76800*x4^2*x5^5+33280*x3*x5^6+11520*x5^7-27648*x4*x5^7+3072*x5^9
    )
  R, id
end

function cyclic_4(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 4
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+x2+x3+x4,
      x1*x2+x2*x3+x1*x4+x3*x4,
      x1*x2*x3+x1*x2*x4+x1*x3*x4+x2*x3*x4,
      x1*x2*x3*x4-1
    )
  R, id
end

function cyclic_5(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 5
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+x2+x3+x4+x5,
      x1*x2+x2*x3+x3*x4+x1*x5+x4*x5,
      x1*x2*x3+x2*x3*x4+x1*x2*x5+x1*x4*x5+x3*x4*x5,
      x1*x2*x3*x4+x1*x2*x3*x5+x1*x2*x4*x5+x1*x3*x4*x5+x2*x3*x4*x5,
      x1*x2*x3*x4*x5-1
    )
  R, id
end

function cyclic_6(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 6
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+x2+x3+x4+x5+x6,
      x1*x2+x2*x3+x3*x4+x4*x5+x1*x6+x5*x6,
      x1*x2*x3+x2*x3*x4+x3*x4*x5+x1*x2*x6+x1*x5*x6+x4*x5*x6,
      x1*x2*x3*x4+x2*x3*x4*x5+x1*x2*x3*x6+x1*x2*x5*x6+x1*x4*x5*x6+x3*x4*x5*x6,
      x1*x2*x3*x4*x5+x1*x2*x3*x4*x6+x1*x2*x3*x5*x6+x1*x2*x4*x5*x6+x1*x3*x4*x5*x6+x2*x3*x4*x5*x6,
      x1*x2*x3*x4*x5*x6-1
    )
  R, id
end

function cyclic_7(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 7
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+x2+x3+x4+x5+x6+x7,
      x1*x2+x2*x3+x3*x4+x4*x5+x5*x6+x1*x7+x6*x7,
      x1*x2*x3+x2*x3*x4+x3*x4*x5+x4*x5*x6+x1*x2*x7+x1*x6*x7+x5*x6*x7,
      x1*x2*x3*x4+x2*x3*x4*x5+x3*x4*x5*x6+x1*x2*x3*x7+x1*x2*x6*x7+x1*x5*x6*x7+x4*x5*x6*x7,
      x1*x2*x3*x4*x5+x2*x3*x4*x5*x6+x1*x2*x3*x4*x7+x1*x2*x3*x6*x7+x1*x2*x5*x6*x7+x1*x4*x5*x6*x7+x3*x4*x5*x6*x7,
      x1*x2*x3*x4*x5*x6+x1*x2*x3*x4*x5*x7+x1*x2*x3*x4*x6*x7+x1*x2*x3*x5*x6*x7+x1*x2*x4*x5*x6*x7+x1*x3*x4*x5*x6*x7+x2*x3*x4*x5*x6*x7,
      x1*x2*x3*x4*x5*x6*x7-1
    )
  R, id
end

function cyclic_8(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 8
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+x2+x3+x4+x5+x6+x7+x8, x1*x2+x2*x3+x3*x4+x4*x5+x5*x6+x6*x7+x1*x8+x7*x8,
      x1*x2*x3+x2*x3*x4+x3*x4*x5+x4*x5*x6+x5*x6*x7+x1*x2*x8+x1*x7*x8+x6*x7*x8,
      x1*x2*x3*x4+x2*x3*x4*x5+x3*x4*x5*x6+x4*x5*x6*x7+x1*x2*x3*x8+x1*x2*x7*x8+x1*x6*x7*x8+x5*x6*x7*x8,
      x1*x2*x3*x4*x5+x2*x3*x4*x5*x6+x3*x4*x5*x6*x7+x1*x2*x3*x4*x8+x1*x2*x3*x7*x8+x1*x2*x6*x7*x8+x1*x5*x6*x7*x8+x4*x5*x6*x7*x8,
      x1*x2*x3*x4*x5*x6+x2*x3*x4*x5*x6*x7+x1*x2*x3*x4*x5*x8+x1*x2*x3*x4*x7*x8+x1*x2*x3*x6*x7*x8+x1*x2*x5*x6*x7*x8+x1*x4*x5*x6*x7*x8+x3*x4*x5*x6*x7*x8,
      x1*x2*x3*x4*x5*x6*x7+x1*x2*x3*x4*x5*x6*x8+x1*x2*x3*x4*x5*x7*x8+x1*x2*x3*x4*x6*x7*x8+x1*x2*x3*x5*x6*x7*x8+x1*x2*x4*x5*x6*x7*x8+x1*x3*x4*x5*x6*x7*x8+x2*x3*x4*x5*x6*x7*x8,
      x1*x2*x3*x4*x5*x6*x7*x8-1
      )
  R, id
end

function cyclic_9(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 9
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+x2+x3+x4+x5+x6+x7+x8+x9,
      x1*x2+x2*x3+x3*x4+x4*x5+x5*x6+x6*x7+x7*x8+x1*x9+x8*x9,
      x1*x2*x3+x2*x3*x4+x3*x4*x5+x4*x5*x6+x5*x6*x7+x6*x7*x8+x1*x2*x9+x1*x8*x9+x7*x8*x9,
      x1*x2*x3*x4+x2*x3*x4*x5+x3*x4*x5*x6+x4*x5*x6*x7+x5*x6*x7*x8+x1*x2*x3*x9+x1*x2*x8*x9+x1*x7*x8*x9+x6*x7*x8*x9,
      x1*x2*x3*x4*x5+x2*x3*x4*x5*x6+x3*x4*x5*x6*x7+x4*x5*x6*x7*x8+x1*x2*x3*x4*x9+x1*x2*x3*x8*x9+x1*x2*x7*x8*x9+x1*x6*x7*x8*x9+x5*x6*x7*x8*x9,
      x1*x2*x3*x4*x5*x6+x2*x3*x4*x5*x6*x7+x3*x4*x5*x6*x7*x8+x1*x2*x3*x4*x5*x9+x1*x2*x3*x4*x8*x9+x1*x2*x3*x7*x8*x9+x1*x2*x6*x7*x8*x9+x1*x5*x6*x7*x8*x9+x4*x5*x6*x7*x8*x9,
      x1*x2*x3*x4*x5*x6*x7+x2*x3*x4*x5*x6*x7*x8+x1*x2*x3*x4*x5*x6*x9+x1*x2*x3*x4*x5*x8*x9+x1*x2*x3*x4*x7*x8*x9+x1*x2*x3*x6*x7*x8*x9+x1*x2*x5*x6*x7*x8*x9+x1*x4*x5*x6*x7*x8*x9+x3*x4*x5*x6*x7*x8*x9,
      x1*x2*x3*x4*x5*x6*x7*x8+x1*x2*x3*x4*x5*x6*x7*x9+x1*x2*x3*x4*x5*x6*x8*x9+x1*x2*x3*x4*x5*x7*x8*x9+x1*x2*x3*x4*x6*x7*x8*x9+x1*x2*x3*x5*x6*x7*x8*x9+x1*x2*x4*x5*x6*x7*x8*x9+x1*x3*x4*x5*x6*x7*x8*x9+x2*x3*x4*x5*x6*x7*x8*x9,
      x1*x2*x3*x4*x5*x6*x7*x8*x9-1
      )
  R, id
end

function cyclic_10(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 10
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+x2+x3+x4+x5+x6+x7+x8+x9+x10,
      x1*x2+x2*x3+x3*x4+x4*x5+x5*x6+x6*x7+x7*x8+x8*x9+x1*x10+x9*x10,
      x1*x2*x3+x2*x3*x4+x3*x4*x5+x4*x5*x6+x5*x6*x7+x6*x7*x8+x7*x8*x9+x1*x2*x10+x1*x9*x10+x8*x9*x10,
      x1*x2*x3*x4+x2*x3*x4*x5+x3*x4*x5*x6+x4*x5*x6*x7+x5*x6*x7*x8+x6*x7*x8*x9+x1*x2*x3*x10+x1*x2*x9*x10+x1*x8*x9*x10+x7*x8*x9*x10,
      x1*x2*x3*x4*x5+x2*x3*x4*x5*x6+x3*x4*x5*x6*x7+x4*x5*x6*x7*x8+x5*x6*x7*x8*x9+x1*x2*x3*x4*x10+x1*x2*x3*x9*x10+x1*x2*x8*x9*x10+x1*x7*x8*x9*x10+x6*x7*x8*x9*x10,
      x1*x2*x3*x4*x5*x6+x2*x3*x4*x5*x6*x7+x3*x4*x5*x6*x7*x8+x4*x5*x6*x7*x8*x9+x1*x2*x3*x4*x5*x10+x1*x2*x3*x4*x9*x10+x1*x2*x3*x8*x9*x10+x1*x2*x7*x8*x9*x10+x1*x6*x7*x8*x9*x10+x5*x6*x7*x8*x9*x10,
      x1*x2*x3*x4*x5*x6*x7+x2*x3*x4*x5*x6*x7*x8+x3*x4*x5*x6*x7*x8*x9+x1*x2*x3*x4*x5*x6*x10+x1*x2*x3*x4*x5*x9*x10+x1*x2*x3*x4*x8*x9*x10+x1*x2*x3*x7*x8*x9*x10+x1*x2*x6*x7*x8*x9*x10+x1*x5*x6*x7*x8*x9*x10+x4*x5*x6*x7*x8*x9*x10,
      x1*x2*x3*x4*x5*x6*x7*x8+x2*x3*x4*x5*x6*x7*x8*x9+x1*x2*x3*x4*x5*x6*x7*x10+x1*x2*x3*x4*x5*x6*x9*x10+x1*x2*x3*x4*x5*x8*x9*x10+x1*x2*x3*x4*x7*x8*x9*x10+x1*x2*x3*x6*x7*x8*x9*x10+x1*x2*x5*x6*x7*x8*x9*x10+x1*x4*x5*x6*x7*x8*x9*x10+x3*x4*x5*x6*x7*x8*x9*x10,
      x1*x2*x3*x4*x5*x6*x7*x8*x9+x1*x2*x3*x4*x5*x6*x7*x8*x10+x1*x2*x3*x4*x5*x6*x7*x9*x10+x1*x2*x3*x4*x5*x6*x8*x9*x10+x1*x2*x3*x4*x5*x7*x8*x9*x10+x1*x2*x3*x4*x6*x7*x8*x9*x10+x1*x2*x3*x5*x6*x7*x8*x9*x10+x1*x2*x4*x5*x6*x7*x8*x9*x10+x1*x3*x4*x5*x6*x7*x8*x9*x10+x2*x3*x4*x5*x6*x7*x8*x9*x10,
      x1*x2*x3*x4*x5*x6*x7*x8*x9*x10-1
      )
  R, id
end

function cyclic_11(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 11
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11,
      x1*x2+x2*x3+x3*x4+x4*x5+x5*x6+x6*x7+x7*x8+x8*x9+x9*x10+x1*x11+x10*x11,
      x1*x2*x3+x2*x3*x4+x3*x4*x5+x4*x5*x6+x5*x6*x7+x6*x7*x8+x7*x8*x9+x8*x9*x10+x1*x2*x11+x1*x10*x11+x9*x10*x11,
      x1*x2*x3*x4+x2*x3*x4*x5+x3*x4*x5*x6+x4*x5*x6*x7+x5*x6*x7*x8+x6*x7*x8*x9+x7*x8*x9*x10+x1*x2*x3*x11+x1*x2*x10*x11+x1*x9*x10*x11+x8*x9*x10*x11,
      x1*x2*x3*x4*x5+x2*x3*x4*x5*x6+x3*x4*x5*x6*x7+x4*x5*x6*x7*x8+x5*x6*x7*x8*x9+x6*x7*x8*x9*x10+x1*x2*x3*x4*x11+x1*x2*x3*x10*x11+x1*x2*x9*x10*x11+x1*x8*x9*x10*x11+x7*x8*x9*x10*x11,
      x1*x2*x3*x4*x5*x6+x2*x3*x4*x5*x6*x7+x3*x4*x5*x6*x7*x8+x4*x5*x6*x7*x8*x9+x5*x6*x7*x8*x9*x10+x1*x2*x3*x4*x5*x11+x1*x2*x3*x4*x10*x11+x1*x2*x3*x9*x10*x11+x1*x2*x8*x9*x10*x11+x1*x7*x8*x9*x10*x11+x6*x7*x8*x9*x10*x11,
      x1*x2*x3*x4*x5*x6*x7+x2*x3*x4*x5*x6*x7*x8+x3*x4*x5*x6*x7*x8*x9+x4*x5*x6*x7*x8*x9*x10+x1*x2*x3*x4*x5*x6*x11+x1*x2*x3*x4*x5*x10*x11+x1*x2*x3*x4*x9*x10*x11+x1*x2*x3*x8*x9*x10*x11+x1*x2*x7*x8*x9*x10*x11+x1*x6*x7*x8*x9*x10*x11+x5*x6*x7*x8*x9*x10*x11,
      x1*x2*x3*x4*x5*x6*x7*x8+x2*x3*x4*x5*x6*x7*x8*x9+x3*x4*x5*x6*x7*x8*x9*x10+x1*x2*x3*x4*x5*x6*x7*x11+x1*x2*x3*x4*x5*x6*x10*x11+x1*x2*x3*x4*x5*x9*x10*x11+x1*x2*x3*x4*x8*x9*x10*x11+x1*x2*x3*x7*x8*x9*x10*x11+x1*x2*x6*x7*x8*x9*x10*x11+x1*x5*x6*x7*x8*x9*x10*x11+x4*x5*x6*x7*x8*x9*x10*x11,
      x1*x2*x3*x4*x5*x6*x7*x8*x9+x2*x3*x4*x5*x6*x7*x8*x9*x10+x1*x2*x3*x4*x5*x6*x7*x8*x11+x1*x2*x3*x4*x5*x6*x7*x10*x11+x1*x2*x3*x4*x5*x6*x9*x10*x11+x1*x2*x3*x4*x5*x8*x9*x10*x11+x1*x2*x3*x4*x7*x8*x9*x10*x11+x1*x2*x3*x6*x7*x8*x9*x10*x11+x1*x2*x5*x6*x7*x8*x9*x10*x11+x1*x4*x5*x6*x7*x8*x9*x10*x11+x3*x4*x5*x6*x7*x8*x9*x10*x11,
      x1*x2*x3*x4*x5*x6*x7*x8*x9*x10+x1*x2*x3*x4*x5*x6*x7*x8*x9*x11+x1*x2*x3*x4*x5*x6*x7*x8*x10*x11+x1*x2*x3*x4*x5*x6*x7*x9*x10*x11+x1*x2*x3*x4*x5*x6*x8*x9*x10*x11+x1*x2*x3*x4*x5*x7*x8*x9*x10*x11+x1*x2*x3*x4*x6*x7*x8*x9*x10*x11+x1*x2*x3*x5*x6*x7*x8*x9*x10*x11+x1*x2*x4*x5*x6*x7*x8*x9*x10*x11+x1*x3*x4*x5*x6*x7*x8*x9*x10*x11+x2*x3*x4*x5*x6*x7*x8*x9*x10*x11,
      x1*x2*x3*x4*x5*x6*x7*x8*x9*x10*x11-1
      )
  R, id
end
#=========================
KATSURA EXAMPLES -- affine
=========================#
function katsura_4(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 4
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4-x2,
      x2^2+2*x1*x3+2*x2*x4-x3
      )
  R, id
end

function katsura_5(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 5
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4+2*x5-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5-x2,
      x2^2+2*x1*x3+2*x2*x4+2*x3*x5-x3,
      2*x2*x3+2*x1*x4+2*x2*x5-x4
      )
  R, id
end

function katsura_6(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 6
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4+2*x5+2*x6-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6-x2,
      x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6-x3,
      2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6-x4,
      x3^2+2*x2*x4+2*x1*x5+2*x2*x6-x5
      )
  R, id
end

function katsura_7(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 7
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6+2*x6*x7-x2,
      x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6+2*x5*x7-x3,
      2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6+2*x4*x7-x4,
      x3^2+2*x2*x4+2*x1*x5+2*x2*x6+2*x3*x7-x5,
      2*x3*x4+2*x2*x5+2*x1*x6+2*x2*x7-x6
      )
  R, id
end

function katsura_8(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 8
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7+2*x8-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2+2*x8^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6+2*x6*x7+2*x7*x8-x2,
      x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6+2*x5*x7+2*x6*x8-x3,
      2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6+2*x4*x7+2*x5*x8-x4,
      x3^2+2*x2*x4+2*x1*x5+2*x2*x6+2*x3*x7+2*x4*x8-x5,
      2*x3*x4+2*x2*x5+2*x1*x6+2*x2*x7+2*x3*x8-x6,
      x4^2+2*x3*x5+2*x2*x6+2*x1*x7+2*x2*x8-x7
      )
  R, id
end

function katsura_9(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 9
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7+2*x8+2*x9-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2+2*x8^2+2*x9^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6+2*x6*x7+2*x7*x8+2*x8*x9-x2,
      x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6+2*x5*x7+2*x6*x8+2*x7*x9-x3,
      2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6+2*x4*x7+2*x5*x8+2*x6*x9-x4,
      x3^2+2*x2*x4+2*x1*x5+2*x2*x6+2*x3*x7+2*x4*x8+2*x5*x9-x5,
      2*x3*x4+2*x2*x5+2*x1*x6+2*x2*x7+2*x3*x8+2*x4*x9-x6,
      x4^2+2*x3*x5+2*x2*x6+2*x1*x7+2*x2*x8+2*x3*x9-x7,
      2*x4*x5+2*x3*x6+2*x2*x7+2*x1*x8+2*x2*x9-x8
      )
  R, id
end

function katsura_10(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 10
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
    x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7+2*x8+2*x9+2*x10-1,
    x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2+2*x8^2+2*x9^2+2*x10^2-x1,
    2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6+2*x6*x7+2*x7*x8+2*x8*x9+2*x9*x10-x2,
    x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6+2*x5*x7+2*x6*x8+2*x7*x9+2*x8*x10-x3,
    2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6+2*x4*x7+2*x5*x8+2*x6*x9+2*x7*x10-x4,
    x3^2+2*x2*x4+2*x1*x5+2*x2*x6+2*x3*x7+2*x4*x8+2*x5*x9+2*x6*x10-x5,
    2*x3*x4+2*x2*x5+2*x1*x6+2*x2*x7+2*x3*x8+2*x4*x9+2*x5*x10-x6,
    x4^2+2*x3*x5+2*x2*x6+2*x1*x7+2*x2*x8+2*x3*x9+2*x4*x10-x7,
    2*x4*x5+2*x3*x6+2*x2*x7+2*x1*x8+2*x2*x9+2*x3*x10-x8,
    x5^2+2*x4*x6+2*x3*x7+2*x2*x8+2*x1*x9+2*x2*x10-x9
      )
  R, id
end

function katsura_11(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 11
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7+2*x8+2*x9+2*x10+2*x11-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2+2*x8^2+2*x9^2+2*x10^2+2*x11^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6+2*x6*x7+2*x7*x8+2*x8*x9+2*x9*x10+2*x10*x11-x2,
      x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6+2*x5*x7+2*x6*x8+2*x7*x9+2*x8*x10+2*x9*x11-x3,
      2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6+2*x4*x7+2*x5*x8+2*x6*x9+2*x7*x10+2*x8*x11-x4,
      x3^2+2*x2*x4+2*x1*x5+2*x2*x6+2*x3*x7+2*x4*x8+2*x5*x9+2*x6*x10+2*x7*x11-x5,
      2*x3*x4+2*x2*x5+2*x1*x6+2*x2*x7+2*x3*x8+2*x4*x9+2*x5*x10+2*x6*x11-x6,
      x4^2+2*x3*x5+2*x2*x6+2*x1*x7+2*x2*x8+2*x3*x9+2*x4*x10+2*x5*x11-x7,
      2*x4*x5+2*x3*x6+2*x2*x7+2*x1*x8+2*x2*x9+2*x3*x10+2*x4*x11-x8,
      x5^2+2*x4*x6+2*x3*x7+2*x2*x8+2*x1*x9+2*x2*x10+2*x3*x11-x9,
      2*x5*x6+2*x4*x7+2*x3*x8+2*x2*x9+2*x1*x10+2*x2*x11-x10
      )
  R, id
end

function katsura_12(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 12
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7+2*x8+2*x9+2*x10+2*x11+2*x12-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2+2*x8^2+2*x9^2+2*x10^2+2*x11^2+2*x12^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6+2*x6*x7+2*x7*x8+2*x8*x9+2*x9*x10+2*x10*x11+2*x11*x12-x2,
      x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6+2*x5*x7+2*x6*x8+2*x7*x9+2*x8*x10+2*x9*x11+2*x10*x12-x3,
      2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6+2*x4*x7+2*x5*x8+2*x6*x9+2*x7*x10+2*x8*x11+2*x9*x12-x4,
      x3^2+2*x2*x4+2*x1*x5+2*x2*x6+2*x3*x7+2*x4*x8+2*x5*x9+2*x6*x10+2*x7*x11+2*x8*x12-x5,
      2*x3*x4+2*x2*x5+2*x1*x6+2*x2*x7+2*x3*x8+2*x4*x9+2*x5*x10+2*x6*x11+2*x7*x12-x6,
      x4^2+2*x3*x5+2*x2*x6+2*x1*x7+2*x2*x8+2*x3*x9+2*x4*x10+2*x5*x11+2*x6*x12-x7,
      2*x4*x5+2*x3*x6+2*x2*x7+2*x1*x8+2*x2*x9+2*x3*x10+2*x4*x11+2*x5*x12-x8,
      x5^2+2*x4*x6+2*x3*x7+2*x2*x8+2*x1*x9+2*x2*x10+2*x3*x11+2*x4*x12-x9,
      2*x5*x6+2*x4*x7+2*x3*x8+2*x2*x9+2*x1*x10+2*x2*x11+2*x3*x12-x10,
      x6^2+2*x5*x7+2*x4*x8+2*x3*x9+2*x2*x10+2*x1*x11+2*x2*x12-x11
      )
  R, id
end

function katsura_13(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 13
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7+2*x8+2*x9+2*x10+2*x11+2*x12+2*x13-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2+2*x8^2+2*x9^2+2*x10^2+2*x11^2+2*x12^2+2*x13^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6+2*x6*x7+2*x7*x8+2*x8*x9+2*x9*x10+2*x10*x11+2*x11*x12+2*x12*x13-x2,
      x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6+2*x5*x7+2*x6*x8+2*x7*x9+2*x8*x10+2*x9*x11+2*x10*x12+2*x11*x13-x3,
      2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6+2*x4*x7+2*x5*x8+2*x6*x9+2*x7*x10+2*x8*x11+2*x9*x12+2*x10*x13-x4,
      x3^2+2*x2*x4+2*x1*x5+2*x2*x6+2*x3*x7+2*x4*x8+2*x5*x9+2*x6*x10+2*x7*x11+2*x8*x12+2*x9*x13-x5,
      2*x3*x4+2*x2*x5+2*x1*x6+2*x2*x7+2*x3*x8+2*x4*x9+2*x5*x10+2*x6*x11+2*x7*x12+2*x8*x13-x6,
      x4^2+2*x3*x5+2*x2*x6+2*x1*x7+2*x2*x8+2*x3*x9+2*x4*x10+2*x5*x11+2*x6*x12+2*x7*x13-x7,
      2*x4*x5+2*x3*x6+2*x2*x7+2*x1*x8+2*x2*x9+2*x3*x10+2*x4*x11+2*x5*x12+2*x6*x13-x8,
      x5^2+2*x4*x6+2*x3*x7+2*x2*x8+2*x1*x9+2*x2*x10+2*x3*x11+2*x4*x12+2*x5*x13-x9,
      2*x5*x6+2*x4*x7+2*x3*x8+2*x2*x9+2*x1*x10+2*x2*x11+2*x3*x12+2*x4*x13-x10,
      x6^2+2*x5*x7+2*x4*x8+2*x3*x9+2*x2*x10+2*x1*x11+2*x2*x12+2*x3*x13-x11,
      2*x6*x7+2*x5*x8+2*x4*x9+2*x3*x10+2*x2*x11+2*x1*x12+2*x2*x13-x12
      )
  R, id
end

function katsura_14(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 14
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7+2*x8+2*x9+2*x10+2*x11+2*x12+2*x13+2*x14-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2+2*x8^2+2*x9^2+2*x10^2+2*x11^2+2*x12^2+2*x13^2+2*x14^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6+2*x6*x7+2*x7*x8+2*x8*x9+2*x9*x10+2*x10*x11+2*x11*x12+2*x12*x13+2*x13*x14-x2,
      x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6+2*x5*x7+2*x6*x8+2*x7*x9+2*x8*x10+2*x9*x11+2*x10*x12+2*x11*x13+2*x12*x14-x3,
      2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6+2*x4*x7+2*x5*x8+2*x6*x9+2*x7*x10+2*x8*x11+2*x9*x12+2*x10*x13+2*x11*x14-x4,
      x3^2+2*x2*x4+2*x1*x5+2*x2*x6+2*x3*x7+2*x4*x8+2*x5*x9+2*x6*x10+2*x7*x11+2*x8*x12+2*x9*x13+2*x10*x14-x5,
      2*x3*x4+2*x2*x5+2*x1*x6+2*x2*x7+2*x3*x8+2*x4*x9+2*x5*x10+2*x6*x11+2*x7*x12+2*x8*x13+2*x9*x14-x6,
      x4^2+2*x3*x5+2*x2*x6+2*x1*x7+2*x2*x8+2*x3*x9+2*x4*x10+2*x5*x11+2*x6*x12+2*x7*x13+2*x8*x14-x7,
      2*x4*x5+2*x3*x6+2*x2*x7+2*x1*x8+2*x2*x9+2*x3*x10+2*x4*x11+2*x5*x12+2*x6*x13+2*x7*x14-x8,
      x5^2+2*x4*x6+2*x3*x7+2*x2*x8+2*x1*x9+2*x2*x10+2*x3*x11+2*x4*x12+2*x5*x13+2*x6*x14-x9,
      2*x5*x6+2*x4*x7+2*x3*x8+2*x2*x9+2*x1*x10+2*x2*x11+2*x3*x12+2*x4*x13+2*x5*x14-x10,
      x6^2+2*x5*x7+2*x4*x8+2*x3*x9+2*x2*x10+2*x1*x11+2*x2*x12+2*x3*x13+2*x4*x14-x11,
      2*x6*x7+2*x5*x8+2*x4*x9+2*x3*x10+2*x2*x11+2*x1*x12+2*x2*x13+2*x3*x14-x12,
      x7^2+2*x6*x8+2*x5*x9+2*x4*x10+2*x3*x11+2*x2*x12+2*x1*x13+2*x2*x14-x13
      )
  R, id
end

function katsura_15(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 15
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7+2*x8+2*x9+2*x10+2*x11+2*x12+2*x13+2*x14+2*x15-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2+2*x8^2+2*x9^2+2*x10^2+2*x11^2+2*x12^2+2*x13^2+2*x14^2+2*x15^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6+2*x6*x7+2*x7*x8+2*x8*x9+2*x9*x10+2*x10*x11+2*x11*x12+2*x12*x13+2*x13*x14+2*x14*x15-x2,
      x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6+2*x5*x7+2*x6*x8+2*x7*x9+2*x8*x10+2*x9*x11+2*x10*x12+2*x11*x13+2*x12*x14+2*x13*x15-x3,
      2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6+2*x4*x7+2*x5*x8+2*x6*x9+2*x7*x10+2*x8*x11+2*x9*x12+2*x10*x13+2*x11*x14+2*x12*x15-x4,
      x3^2+2*x2*x4+2*x1*x5+2*x2*x6+2*x3*x7+2*x4*x8+2*x5*x9+2*x6*x10+2*x7*x11+2*x8*x12+2*x9*x13+2*x10*x14+2*x11*x15-x5,
      2*x3*x4+2*x2*x5+2*x1*x6+2*x2*x7+2*x3*x8+2*x4*x9+2*x5*x10+2*x6*x11+2*x7*x12+2*x8*x13+2*x9*x14+2*x10*x15-x6,
      x4^2+2*x3*x5+2*x2*x6+2*x1*x7+2*x2*x8+2*x3*x9+2*x4*x10+2*x5*x11+2*x6*x12+2*x7*x13+2*x8*x14+2*x9*x15-x7,
      2*x4*x5+2*x3*x6+2*x2*x7+2*x1*x8+2*x2*x9+2*x3*x10+2*x4*x11+2*x5*x12+2*x6*x13+2*x7*x14+2*x8*x15-x8,
      x5^2+2*x4*x6+2*x3*x7+2*x2*x8+2*x1*x9+2*x2*x10+2*x3*x11+2*x4*x12+2*x5*x13+2*x6*x14+2*x7*x15-x9,
      2*x5*x6+2*x4*x7+2*x3*x8+2*x2*x9+2*x1*x10+2*x2*x11+2*x3*x12+2*x4*x13+2*x5*x14+2*x6*x15-x10,
      x6^2+2*x5*x7+2*x4*x8+2*x3*x9+2*x2*x10+2*x1*x11+2*x2*x12+2*x3*x13+2*x4*x14+2*x5*x15-x11,
      2*x6*x7+2*x5*x8+2*x4*x9+2*x3*x10+2*x2*x11+2*x1*x12+2*x2*x13+2*x3*x14+2*x4*x15-x12,
      x7^2+2*x6*x8+2*x5*x9+2*x4*x10+2*x3*x11+2*x2*x12+2*x1*x13+2*x2*x14+2*x3*x15-x13,
      2*x7*x8+2*x6*x9+2*x5*x10+2*x4*x11+2*x3*x12+2*x2*x13+2*x1*x14+2*x2*x15-x14
      )
  R, id
end

function katsura_16(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 16
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
			x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7+2*x8+2*x9+2*x10+2*x11+2*x12+2*x13+2*x14+2*x15+2*x16-1,
			x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2+2*x8^2+2*x9^2+2*x10^2+2*x11^2+2*x12^2+2*x13^2+2*x14^2+2*x15^2+2*x16^2-x1,
			2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6+2*x6*x7+2*x7*x8+2*x8*x9+2*x9*x10+2*x10*x11+2*x11*x12+2*x12*x13+2*x13*x14+2*x14*x15+2*x15*x16-x2,
			x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6+2*x5*x7+2*x6*x8+2*x7*x9+2*x8*x10+2*x9*x11+2*x10*x12+2*x11*x13+2*x12*x14+2*x13*x15+2*x14*x16-x3,
			2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6+2*x4*x7+2*x5*x8+2*x6*x9+2*x7*x10+2*x8*x11+2*x9*x12+2*x10*x13+2*x11*x14+2*x12*x15+2*x13*x16-x4,
			x3^2+2*x2*x4+2*x1*x5+2*x2*x6+2*x3*x7+2*x4*x8+2*x5*x9+2*x6*x10+2*x7*x11+2*x8*x12+2*x9*x13+2*x10*x14+2*x11*x15+2*x12*x16-x5,
			2*x3*x4+2*x2*x5+2*x1*x6+2*x2*x7+2*x3*x8+2*x4*x9+2*x5*x10+2*x6*x11+2*x7*x12+2*x8*x13+2*x9*x14+2*x10*x15+2*x11*x16-x6,
			x4^2+2*x3*x5+2*x2*x6+2*x1*x7+2*x2*x8+2*x3*x9+2*x4*x10+2*x5*x11+2*x6*x12+2*x7*x13+2*x8*x14+2*x9*x15+2*x10*x16-x7,
			2*x4*x5+2*x3*x6+2*x2*x7+2*x1*x8+2*x2*x9+2*x3*x10+2*x4*x11+2*x5*x12+2*x6*x13+2*x7*x14+2*x8*x15+2*x9*x16-x8,
			x5^2+2*x4*x6+2*x3*x7+2*x2*x8+2*x1*x9+2*x2*x10+2*x3*x11+2*x4*x12+2*x5*x13+2*x6*x14+2*x7*x15+2*x8*x16-x9,
			2*x5*x6+2*x4*x7+2*x3*x8+2*x2*x9+2*x1*x10+2*x2*x11+2*x3*x12+2*x4*x13+2*x5*x14+2*x6*x15+2*x7*x16-x10,
			x6^2+2*x5*x7+2*x4*x8+2*x3*x9+2*x2*x10+2*x1*x11+2*x2*x12+2*x3*x13+2*x4*x14+2*x5*x15+2*x6*x16-x11,
			2*x6*x7+2*x5*x8+2*x4*x9+2*x3*x10+2*x2*x11+2*x1*x12+2*x2*x13+2*x3*x14+2*x4*x15+2*x5*x16-x12,
			x7^2+2*x6*x8+2*x5*x9+2*x4*x10+2*x3*x11+2*x2*x12+2*x1*x13+2*x2*x14+2*x3*x15+2*x4*x16-x13,
			2*x7*x8+2*x6*x9+2*x5*x10+2*x4*x11+2*x3*x12+2*x2*x13+2*x1*x14+2*x2*x15+2*x3*x16-x14,
			x8^2+2*x7*x9+2*x6*x10+2*x5*x11+2*x4*x12+2*x3*x13+2*x2*x14+2*x1*x15+2*x2*x16-x15
			)
  R, id
end

function katsura_17(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 17
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7+2*x8+2*x9+2*x10+2*x11+2*x12+2*x13+2*x14+2*x15+2*x16+2*x17-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2+2*x8^2+2*x9^2+2*x10^2+2*x11^2+2*x12^2+2*x13^2+2*x14^2+2*x15^2+2*x16^2+2*x17^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6+2*x6*x7+2*x7*x8+2*x8*x9+2*x9*x10+2*x10*x11+2*x11*x12+2*x12*x13+2*x13*x14+2*x14*x15+2*x15*x16+2*x16*x17-x2,
      x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6+2*x5*x7+2*x6*x8+2*x7*x9+2*x8*x10+2*x9*x11+2*x10*x12+2*x11*x13+2*x12*x14+2*x13*x15+2*x14*x16+2*x15*x17-x3,
      2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6+2*x4*x7+2*x5*x8+2*x6*x9+2*x7*x10+2*x8*x11+2*x9*x12+2*x10*x13+2*x11*x14+2*x12*x15+2*x13*x16+2*x14*x17-x4,
      x3^2+2*x2*x4+2*x1*x5+2*x2*x6+2*x3*x7+2*x4*x8+2*x5*x9+2*x6*x10+2*x7*x11+2*x8*x12+2*x9*x13+2*x10*x14+2*x11*x15+2*x12*x16+2*x13*x17-x5,
      2*x3*x4+2*x2*x5+2*x1*x6+2*x2*x7+2*x3*x8+2*x4*x9+2*x5*x10+2*x6*x11+2*x7*x12+2*x8*x13+2*x9*x14+2*x10*x15+2*x11*x16+2*x12*x17-x6,
      x4^2+2*x3*x5+2*x2*x6+2*x1*x7+2*x2*x8+2*x3*x9+2*x4*x10+2*x5*x11+2*x6*x12+2*x7*x13+2*x8*x14+2*x9*x15+2*x10*x16+2*x11*x17-x7,
      2*x4*x5+2*x3*x6+2*x2*x7+2*x1*x8+2*x2*x9+2*x3*x10+2*x4*x11+2*x5*x12+2*x6*x13+2*x7*x14+2*x8*x15+2*x9*x16+2*x10*x17-x8,
      x5^2+2*x4*x6+2*x3*x7+2*x2*x8+2*x1*x9+2*x2*x10+2*x3*x11+2*x4*x12+2*x5*x13+2*x6*x14+2*x7*x15+2*x8*x16+2*x9*x17-x9,
      2*x5*x6+2*x4*x7+2*x3*x8+2*x2*x9+2*x1*x10+2*x2*x11+2*x3*x12+2*x4*x13+2*x5*x14+2*x6*x15+2*x7*x16+2*x8*x17-x10,
      x6^2+2*x5*x7+2*x4*x8+2*x3*x9+2*x2*x10+2*x1*x11+2*x2*x12+2*x3*x13+2*x4*x14+2*x5*x15+2*x6*x16+2*x7*x17-x11,
      2*x6*x7+2*x5*x8+2*x4*x9+2*x3*x10+2*x2*x11+2*x1*x12+2*x2*x13+2*x3*x14+2*x4*x15+2*x5*x16+2*x6*x17-x12,
      x7^2+2*x6*x8+2*x5*x9+2*x4*x10+2*x3*x11+2*x2*x12+2*x1*x13+2*x2*x14+2*x3*x15+2*x4*x16+2*x5*x17-x13,
      2*x7*x8+2*x6*x9+2*x5*x10+2*x4*x11+2*x3*x12+2*x2*x13+2*x1*x14+2*x2*x15+2*x3*x16+2*x4*x17-x14,
      x8^2+2*x7*x9+2*x6*x10+2*x5*x11+2*x4*x12+2*x3*x13+2*x2*x14+2*x1*x15+2*x2*x16+2*x3*x17-x15,
      2*x8*x9+2*x7*x10+2*x6*x11+2*x5*x12+2*x4*x13+2*x3*x14+2*x2*x15+2*x1*x16+2*x2*x17-x16
			)
  R, id
end

function katsura_18(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 18
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7+2*x8+2*x9+2*x10+2*x11+2*x12+2*x13+2*x14+2*x15+2*x16+2*x17+2*x18-1,
      x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2+2*x8^2+2*x9^2+2*x10^2+2*x11^2+2*x12^2+2*x13^2+2*x14^2+2*x15^2+2*x16^2+2*x17^2+2*x18^2-x1,
      2*x1*x2+2*x2*x3+2*x3*x4+2*x4*x5+2*x5*x6+2*x6*x7+2*x7*x8+2*x8*x9+2*x9*x10+2*x10*x11+2*x11*x12+2*x12*x13+2*x13*x14+2*x14*x15+2*x15*x16+2*x16*x17+2*x17*x18-x2,
      x2^2+2*x1*x3+2*x2*x4+2*x3*x5+2*x4*x6+2*x5*x7+2*x6*x8+2*x7*x9+2*x8*x10+2*x9*x11+2*x10*x12+2*x11*x13+2*x12*x14+2*x13*x15+2*x14*x16+2*x15*x17+2*x16*x18-x3,
      2*x2*x3+2*x1*x4+2*x2*x5+2*x3*x6+2*x4*x7+2*x5*x8+2*x6*x9+2*x7*x10+2*x8*x11+2*x9*x12+2*x10*x13+2*x11*x14+2*x12*x15+2*x13*x16+2*x14*x17+2*x15*x18-x4,
      x3^2+2*x2*x4+2*x1*x5+2*x2*x6+2*x3*x7+2*x4*x8+2*x5*x9+2*x6*x10+2*x7*x11+2*x8*x12+2*x9*x13+2*x10*x14+2*x11*x15+2*x12*x16+2*x13*x17+2*x14*x18-x5,
      2*x3*x4+2*x2*x5+2*x1*x6+2*x2*x7+2*x3*x8+2*x4*x9+2*x5*x10+2*x6*x11+2*x7*x12+2*x8*x13+2*x9*x14+2*x10*x15+2*x11*x16+2*x12*x17+2*x13*x18-x6,
      x4^2+2*x3*x5+2*x2*x6+2*x1*x7+2*x2*x8+2*x3*x9+2*x4*x10+2*x5*x11+2*x6*x12+2*x7*x13+2*x8*x14+2*x9*x15+2*x10*x16+2*x11*x17+2*x12*x18-x7,
      2*x4*x5+2*x3*x6+2*x2*x7+2*x1*x8+2*x2*x9+2*x3*x10+2*x4*x11+2*x5*x12+2*x6*x13+2*x7*x14+2*x8*x15+2*x9*x16+2*x10*x17+2*x11*x18-x8,
      x5^2+2*x4*x6+2*x3*x7+2*x2*x8+2*x1*x9+2*x2*x10+2*x3*x11+2*x4*x12+2*x5*x13+2*x6*x14+2*x7*x15+2*x8*x16+2*x9*x17+2*x10*x18-x9,
      2*x5*x6+2*x4*x7+2*x3*x8+2*x2*x9+2*x1*x10+2*x2*x11+2*x3*x12+2*x4*x13+2*x5*x14+2*x6*x15+2*x7*x16+2*x8*x17+2*x9*x18-x10,
      x6^2+2*x5*x7+2*x4*x8+2*x3*x9+2*x2*x10+2*x1*x11+2*x2*x12+2*x3*x13+2*x4*x14+2*x5*x15+2*x6*x16+2*x7*x17+2*x8*x18-x11,
      2*x6*x7+2*x5*x8+2*x4*x9+2*x3*x10+2*x2*x11+2*x1*x12+2*x2*x13+2*x3*x14+2*x4*x15+2*x5*x16+2*x6*x17+2*x7*x18-x12,
      x7^2+2*x6*x8+2*x5*x9+2*x4*x10+2*x3*x11+2*x2*x12+2*x1*x13+2*x2*x14+2*x3*x15+2*x4*x16+2*x5*x17+2*x6*x18-x13,
      2*x7*x8+2*x6*x9+2*x5*x10+2*x4*x11+2*x3*x12+2*x2*x13+2*x1*x14+2*x2*x15+2*x3*x16+2*x4*x17+2*x5*x18-x14,
      x8^2+2*x7*x9+2*x6*x10+2*x5*x11+2*x4*x12+2*x3*x13+2*x2*x14+2*x1*x15+2*x2*x16+2*x3*x17+2*x4*x18-x15,
      2*x8*x9+2*x7*x10+2*x6*x11+2*x5*x12+2*x4*x13+2*x3*x14+2*x2*x15+2*x1*x16+2*x2*x17+2*x3*x18-x16,
      x9^2+2*x8*x10+2*x7*x11+2*x6*x12+2*x5*x13+2*x4*x14+2*x3*x15+2*x2*x16+2*x1*x17+2*x2*x18-x17
			)
  R, id
end

function mayr_42(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 51
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      -x10*x51+x4*x49,
      x3*x48-x51*x9,
      x2*x47-x51*x8,
      x1*x46-x51*x7,
      x4*x44-x49*x9,
      x3*x43-x48*x8,
      x2*x42-x47*x7,
      x1*x41-x46*x6,
      x39*x4-x49*x9,
      x3*x38-x48*x8,
      x2*x37-x47*x7,
      x1*x36-x46*x6,
      x34*x9-x49*x9,
      x34*x4-x5*x51,
      x33*x8-x48*x8,
      x3*x33-x4*x51,
      x32*x7-x47*x7,
      x2*x32-x3*x51,
      x31*x6-x46*x6,
      x1*x31-x2*x51,
      x14*x39*x9-x29*x44*x9,
      x13*x38*x8-x28*x43*x8,
      x12*x37*x7-x27*x42*x7,
      x11*x36*x6-x26*x41*x6,
      x26^2*x46*x6-x51^3*x7,
      x11^2*x46*x6-x2*x51^3,
      x21^2*x41*x6-x46*x51^2*x6,
      x16^2*x36*x6-x46*x51^2*x6,
      x24*x30*x39*x50*x9-x29*x44*x50*x51*x9,
      x23*x29*x38*x49*x8-x28*x43*x49*x51*x8,
      x22*x28*x37*x48*x7-x27*x42*x48*x51*x7,
      x21*x27*x36*x47*x6-x26*x41*x47*x51*x6,
      x24*x25*x39*x45*x9-x29*x44*x45*x51*x9,
      x23*x24*x38*x44*x8-x28*x43*x44*x51*x8,
      x22*x23*x37*x43*x7-x27*x42*x43*x51*x7,
      x21*x22*x36*x42*x6-x26*x41*x42*x51*x6,
      x20*x24*x39*x40*x9-x29*x40*x44*x51*x9,
      x19*x23*x38*x39*x8-x28*x39*x43*x51*x8,
      x15*x24*x35*x39*x9-x29*x35*x44*x51*x9,
      x18*x22*x37*x38*x7-x27*x38*x42*x51*x7,
      x14*x23*x34*x38*x8-x28*x34*x43*x51*x8,
      x17*x21*x36*x37*x6-x26*x37*x41*x51*x6,
      x13*x22*x33*x37*x7-x27*x33*x42*x51*x7,
      x12*x21*x32*x36*x6-x26*x32*x41*x51*x6
      )
  R, id
end

function jason_210(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 8
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      x1^2*x3^4+x1*x2*x3^2*x5^2+x1*x2*x3*x4*x5*x7+x1*x2*x3*x4*x6*x8+x1*x2*x4^2*x6^2+x2^2*x4^4,
      x2^6,
      x1^6
      )
  R, id
end

function pearson_9(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n1  = 3
  n2  = 3
  n3  = 3
  n4  = 8
  n   = n1 + n2 + n3 + n4
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  ctr = 1
  for i = 1:n1
    vars[ctr] = "a$(i)"
    ctr = ctr + 1
  end
  for i = 1:n2
    vars[ctr] = "x$(i)"
    ctr = ctr + 1
  end
  for i = 1:n3
    vars[ctr] = "s$(i)"
    ctr = ctr + 1
  end
  for i = 1:n4
    vars[ctr] = "m$(i)"
    ctr = ctr + 1
  end
    if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      a1+a2+a3-1,
      a1*x1+a2*x2+a3*x3-m1,
      a1*x1^2+a2*x2^2+a3*x3^2+a1*s1+a2*s2+a3*s3-m2,
      a1*x1^3+a2*x2^3+a3*x3^3+3*a1*x1*s1+3*a2*x2*s2+3*a3*x3*s3-m3,
      a1*x1^4+a2*x2^4+a3*x3^4+6*a1*x1^2*s1+6*a2*x2^2*s2+6*a3*x3^2*s3+
      3*a1*s1^2+3*a2*s2^2+3*a3*s3^2-m4,
      a1*x1^5+a2*x2^5+a3*x3^5+10*a1*x1^3*s1+10*a2*x2^3*s2+10*a3*x3^3*s3+
      15*a1*x1*s1^2+15*a2*x2*s2^2+15*a3*x3*s3^2-m5,
      a1*x1^6+a2*x2^6+a3*x3^6+15*a1*x1^4*s1+15*a2*x2^4*s2+15*a3*x3^4*s3+
      45*a1*x1^2*s1^2+45*a2*x2^2*s2^2+45*a3*x3^2*s3^2+15*a1*s1^3+
      15*a2*s2^3+15*a3*s3^3-m6,
      a1*x1^7+a2*x2^7+a3*x3^7+21*a1*x1^5*s1+21*a2*x2^5*s2+21*a3*x3^5*s3+
      105*a1*x1^3*s1^2+105*a2*x2^3*s2^2+105*a3*x3^3*s3^2+105*a1*x1*s1^3+
      105*a2*x2*s2^3+105*a3*x3*s3^3-m7,
      a1*x1^8+a2*x2^8+a3*x3^8+28*a1*x1^6*s1+28*a2*x2^6*s2+28*a3*x3^6*s3+
      210*a1*x1^4*s1^2+210*a2*x2^4*s2^2+210*a3*x3^4*s3^2+420*a1*x1^2*s1^3+
      420*a2*x2^2*s2^3+420*a3*x3^2*s3^3+105*a1*s1^4+105*a2*s2^4+105*a3*s3^4-m8
      )
  R, id
end

function pearson_12(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n1  = 4
  n2  = 4
  n3  = 4
  n4  = 11
  n   = n1 + n2 + n3 + n4
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  ctr = 1
  for i = 1:n1
    vars[ctr] = "a$(i)"
    ctr = ctr + 1
  end
  for i = 1:n2
    vars[ctr] = "x$(i)"
    ctr = ctr + 1
  end
  for i = 1:n3
    vars[ctr] = "s$(i)"
    ctr = ctr + 1
  end
  for i = 1:n4
    vars[ctr] = "m$(i)"
    ctr = ctr + 1
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      a1+ a2+ a3+ a4- 1, a1*x1+ a2*x2+ a3*x3+ a4*x4- m1, a1*x1^2+ a2*x2^2+
      a3*x3^2+ a4*x4^2+ a1*s1+ a2*s2+ a3*s3+ a4*s4- m2, a1*x1^3+ a2*x2^3+
      a3*x3^3+ a4*x4^3+ 3*a1*x1*s1+ 3*a2*x2*s2+ 3*a3*x3*s3+ 3*a4*x4*s4- m3,
      a1*x1^4+ a2*x2^4+ a3*x3^4+ a4*x4^4+ 6*a1*x1^2*s1+ 6*a2*x2^2*s2+
      6*a3*x3^2*s3+ 6*a4*x4^2*s4+ 3*a1*s1^2+ 3*a2*s2^2+ 3*a3*s3^2+ 3*a4*s4^2-
      m4, a1*x1^5+ a2*x2^5+ a3*x3^5+ a4*x4^5+ 10*a1*x1^3*s1+ 10*a2*x2^3*s2+
      10*a3*x3^3*s3+ 10*a4*x4^3*s4+ 15*a1*x1*s1^2+ 15*a2*x2*s2^2+ 15*a3*x3*s3^2+
      15*a4*x4*s4^2- m5, a1*x1^6+ a2*x2^6+ a3*x3^6+ a4*x4^6+ 15*a1*x1^4*s1+
      15*a2*x2^4*s2+ 15*a3*x3^4*s3+ 15*a4*x4^4*s4+ 45*a1*x1^2*s1^2+
      45*a2*x2^2*s2^2+ 45*a3*x3^2*s3^2+ 45*a4*x4^2*s4^2+ 15*a1*s1^3+ 15*a2*s2^3+
      15*a3*s3^3+ 15*a4*s4^3- m6, a1*x1^7+ a2*x2^7+ a3*x3^7+ a4*x4^7+
      21*a1*x1^5*s1+ 21*a2*x2^5*s2+ 21*a3*x3^5*s3+ 21*a4*x4^5*s4+
      105*a1*x1^3*s1^2+ 105*a2*x2^3*s2^2+ 105*a3*x3^3*s3^2+ 105*a4*x4^3*s4^2+
      105*a1*x1*s1^3+ 105*a2*x2*s2^3+ 105*a3*x3*s3^3+ 105*a4*x4*s4^3- m7,
      a1*x1^8+ a2*x2^8+ a3*x3^8+ a4*x4^8+ 28*a1*x1^6*s1+ 28*a2*x2^6*s2+
      28*a3*x3^6*s3+ 28*a4*x4^6*s4+ 210*a1*x1^4*s1^2+ 210*a2*x2^4*s2^2+
      210*a3*x3^4*s3^2+ 210*a4*x4^4*s4^2+ 420*a1*x1^2*s1^3+ 420*a2*x2^2*s2^3+
      420*a3*x3^2*s3^3+ 420*a4*x4^2*s4^3+ 105*a1*s1^4+ 105*a2*s2^4+ 105*a3*s3^4+
      105*a4*s4^4- m8, a1*x1^9+ a2*x2^9+ a3*x3^9+ a4*x4^9+ 36*a1*x1^7*s1+
      36*a2*x2^7*s2+ 36*a3*x3^7*s3+ 36*a4*x4^7*s4+ 378*a1*x1^5*s1^2+
      378*a2*x2^5*s2^2+ 378*a3*x3^5*s3^2+ 378*a4*x4^5*s4^2+ 1260*a1*x1^3*s1^3+
      1260*a2*x2^3*s2^3+ 1260*a3*x3^3*s3^3+ 1260*a4*x4^3*s4^3+ 945*a1*x1*s1^4+
      945*a2*x2*s2^4+ 945*a3*x3*s3^4+ 945*a4*x4*s4^4- m9, a1*x1^10+ a2*x2^10+
      a3*x3^10+ a4*x4^10+ 45*a1*x1^8*s1+ 45*a2*x2^8*s2+ 45*a3*x3^8*s3+
      45*a4*x4^8*s4+ 630*a1*x1^6*s1^2+ 630*a2*x2^6*s2^2+ 630*a3*x3^6*s3^2+
      630*a4*x4^6*s4^2+ 3150*a1*x1^4*s1^3+ 3150*a2*x2^4*s2^3+ 3150*a3*x3^4*s3^3+
      3150*a4*x4^4*s4^3+ 4725*a1*x1^2*s1^4+ 4725*a2*x2^2*s2^4+ 4725*a3*x3^2*s3^4+
      4725*a4*x4^2*s4^4+ 945*a1*s1^5+ 945*a2*s2^5+ 945*a3*s3^5+ 945*a4*s4^5- m10,
      a1*x1^11+ a2*x2^11+ a3*x3^11+ a4*x4^11+ 55*a1*x1^9*s1+ 55*a2*x2^9*s2+
      55*a3*x3^9*s3+ 55*a4*x4^9*s4+ 990*a1*x1^7*s1^2+ 990*a2*x2^7*s2^2+
      990*a3*x3^7*s3^2+ 990*a4*x4^7*s4^2+ 6930*a1*x1^5*s1^3+ 6930*a2*x2^5*s2^3+
      6930*a3*x3^5*s3^3+ 6930*a4*x4^5*s4^3+ 17325*a1*x1^3*s1^4+ 17325*a2*x2^3*s2^4+
      17325*a3*x3^3*s3^4+ 17325*a4*x4^3*s4^4+ 10395*a1*x1*s1^5+ 10395*a2*x2*s2^5+
      10395*a3*x3*s3^5+ 10395*a4*x4*s4^5- m11
      )
  R, id
end

function bayes_148(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 32
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
    -x23*x32+x24*x31,
    -x22*x32+x24*x30,
    -x22*x31+x23*x30,
    -x21*x32+x24*x29,
    -x21*x31+x23*x29,
    -x21*x30+x22*x29,
    -x12*x32+x16*x28,
    -x19*x28+x20*x27,
    -x11*x31+x15*x27,
    -x18*x28+x20*x26,
    -x18*x27+x19*x26,
    -x10*x30+x14*x26,
    -x17*x28+x20*x25,
    -x17*x27+x19*x25,
    -x17*x26+x18*x25,
    -x9*x29+x13*x25,
    x20*x8-x24*x4,
    -x17*x20-x17*x24-2*x17*x28-x17*x32+x18*x19+x18*x23+2*x18*x27+x18*x31+
    x19*x22+x19*x30-x20*x21-x20*x29-x21*x24-x21*x28-2*x21*x32+x22*x23+
    x22*x27+2*x22*x31+x23*x26-x24*x25-x25*x28-x25*x32+x26*x27+x26*x31+
    x27*x30-x28*x29-x29*x32+x30*x31,
    x19*x7-x23*x3,
    x18*x6-x2*x22,
    -x1*x21+x17*x5
    )
  R, id
end

function gametwo_7(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 7
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "p$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
      3821*p2*p3*p4*p5*p6*p7- 7730*p2*p3*p4*p5*p6- 164*p2*p3*p4*p5*p7-
      2536*p2*p3*p4*p6*p7- 4321*p2*p3*p5*p6*p7- 2161*p2*p4*p5*p6*p7-
      2188*p3*p4*p5*p6*p7- 486*p2*p3*p4*p5+ 3491*p2*p3*p4*p6+ 4247*p2*p3*p5*p6+
      3528*p2*p4*p5*p6+ 2616*p3*p4*p5*p6- 101*p2*p3*p4*p7+ 1765*p2*p3*p5*p7+
      258*p2*p4*p5*p7- 378*p3*p4*p5*p7+ 1246*p2*p3*p6*p7+ 2320*p2*p4*p6*p7+
      1776*p3*p4*p6*p7+ 1715*p2*p5*p6*p7+ 728*p3*p5*p6*p7+ 842*p4*p5*p6*p7+
      69*p2*p3*p4- 1660*p2*p3*p5+ 1863*p2*p4*p5+ 1520*p3*p4*p5- 245*p2*p3*p6-
      804*p2*p4*p6- 2552*p3*p4*p6- 3152*p2*p5*p6+ 40*p3*p5*p6- 1213*p4*p5*p6+
      270*p2*p3*p7- 851*p2*p4*p7+ 327*p3*p4*p7- 1151*p2*p5*p7+ 1035*p3*p5*p7-
      161*p4*p5*p7- 230*p2*p6*p7- 294*p3*p6*p7- 973*p4*p6*p7- 264*p5*p6*p7+
      874*p2*p3- 2212*p2*p4+ 168*p3*p4+ 511*p2*p5- 918*p3*p5- 2017*p4*p5-
      76*p2*p6+ 465*p3*p6+ 1629*p4*p6+ 856*p5*p6- 54*p2*p7- 1355*p3*p7+
      227*p4*p7+ 77*p5*p7- 220*p6*p7- 696*p2+ 458*p3+ 486*p4+ 661*p5- 650*p6+
      671*p7- 439, - 6157*p1*p3*p4*p5*p6*p7+ 13318*p1*p3*p4*p5*p6+
      5928*p1*p3*p4*p5*p7+ 1904*p1*p3*p4*p6*p7+ 2109*p1*p3*p5*p6*p7+
      8475*p1*p4*p5*p6*p7+ 2878*p3*p4*p5*p6*p7- 8339*p1*p3*p4*p5-
      2800*p1*p3*p4*p6- 9649*p1*p3*p5*p6- 10964*p1*p4*p5*p6- 4481*p3*p4*p5*p6+
      251*p1*p3*p4*p7- 4245*p1*p3*p5*p7- 7707*p1*p4*p5*p7- 2448*p3*p4*p5*p7+
      1057*p1*p3*p6*p7- 3605*p1*p4*p6*p7+ 546*p3*p4*p6*p7- 3633*p1*p5*p6*p7-
      699*p3*p5*p6*p7- 4126*p4*p5*p6*p7- 730*p1*p3*p4+ 5519*p1*p3*p5+
      8168*p1*p4*p5+ 4366*p3*p4*p5+ 2847*p1*p3*p6+ 2058*p1*p4*p6- 1416*p3*p4*p6+
      8004*p1*p5*p6+ 4740*p3*p5*p6+ 5361*p4*p5*p6- 677*p1*p3*p7+ 1755*p1*p4*p7-
      760*p3*p4*p7+ 3384*p1*p5*p7+ 2038*p3*p5*p7+ 4119*p4*p5*p7+ 812*p1*p6*p7+
      11*p3*p6*p7+ 2022*p4*p6*p7+ 2642*p5*p6*p7+ 1276*p1*p3- 1723*p1*p4+ 121*p3*p4-
      6456*p1*p5- 3710*p3*p5- 4525*p4*p5- 2187*p1*p6- 1559*p3*p6- 848*p4*p6-
      4041*p5*p6- 83*p1*p7- 12*p3*p7- 1180*p4*p7- 2747*p5*p7- 1970*p6*p7+ 2575*p1-
      161*p3+ 2149*p4+ 4294*p5+ 1687*p6+ 958*p7- 1950, 182*p1*p2*p4*p5*p6*p7-
      2824*p1*p2*p4*p5*p6- 3513*p1*p2*p4*p5*p7- 3386*p1*p2*p4*p6*p7-
      2330*p1*p2*p5*p6*p7- 2838*p1*p4*p5*p6*p7+ 1294*p2*p4*p5*p6*p7+
      4764*p1*p2*p4*p5+ 1647*p1*p2*p4*p6+ 4221*p1*p2*p5*p6+ 814*p1*p4*p5*p6+
      2738*p2*p4*p5*p6+ 4057*p1*p2*p4*p7+ 2403*p1*p2*p5*p7+ 2552*p1*p4*p5*p7+
      471*p2*p4*p5*p7+ 448*p1*p2*p6*p7+ 2336*p1*p4*p6*p7+ 1617*p2*p4*p6*p7+
      2220*p1*p5*p6*p7- 1543*p2*p5*p6*p7+ 402*p4*p5*p6*p7- 5184*p1*p2*p4-
      3983*p1*p2*p5+ 44*p1*p4*p5- 1327*p2*p4*p5- 581*p1*p2*p6- 389*p1*p4*p6-
      2722*p2*p4*p6+ 443*p1*p5*p6- 2893*p2*p5*p6- 154*p4*p5*p6- 1277*p1*p2*p7-
      2018*p1*p4*p7- 509*p2*p4*p7- 1254*p1*p5*p7+ 602*p2*p5*p7- 464*p4*p5*p7-
      647*p1*p6*p7+ 922*p2*p6*p7- 1463*p4*p6*p7+ 729*p5*p6*p7+ 2665*p1*p2+
      591*p1*p4+ 981*p2*p4- 444*p1*p5+ 1818*p2*p5- 1985*p4*p5- 1818*p1*p6+
      197*p2*p6+ 1038*p4*p6+ 340*p5*p6+ 399*p1*p7- 835*p2*p7+ 787*p4*p7- 753*p5*p7-
      221*p6*p7+ 481*p1+ 260*p2+ 1713*p4+ 1219*p5+ 794*p6+ 762*p7- 1231,
      2923*p1*p2*p3*p5*p6*p7- 4328*p1*p2*p3*p5*p6- 3674*p1*p2*p3*p5*p7-
      3291*p1*p2*p3*p6*p7- 4955*p1*p2*p5*p6*p7- 8*p1*p3*p5*p6*p7-
      135*p2*p3*p5*p6*p7+ 7784*p1*p2*p3*p5+ 3471*p1*p2*p3*p6+ 1544*p1*p2*p5*p6+
      1607*p1*p3*p5*p6+ 1710*p2*p3*p5*p6+ 2434*p1*p2*p3*p7+ 1408*p1*p2*p5*p7-
      215*p1*p3*p5*p7+ 507*p2*p3*p5*p7+ 2208*p1*p2*p6*p7+ 1920*p1*p3*p6*p7-
      389*p2*p3*p6*p7+ 1304*p1*p5*p6*p7+ 2480*p2*p5*p6*p7+ 102*p3*p5*p6*p7-
      2683*p1*p2*p3- 3508*p1*p2*p5- 3505*p1*p3*p5- 2400*p2*p3*p5- 2236*p1*p2*p6-
      1727*p1*p3*p6- 1354*p2*p3*p6- 1022*p1*p5*p6- 2099*p2*p5*p6- 918*p3*p5*p6-
      495*p1*p2*p7- 109*p1*p3*p7+ 474*p2*p3*p7+ 268*p1*p5*p7+ 1084*p2*p5*p7-
      190*p3*p5*p7- 666*p1*p6*p7- 497*p2*p6*p7+ 615*p3*p6*p7- 912*p5*p6*p7+
      473*p1*p2+ 742*p1*p3+ 186*p2*p3+ 1021*p1*p5+ 2556*p2*p5+ 2312*p3*p5+
      1075*p1*p6+ 920*p2*p6+ 164*p3*p6+ 80*p5*p6- 199*p1*p7- 1270*p2*p7- 1050*p3*p7-
      724*p5*p7+ 136*p6*p7+ 740*p1- 474*p2+ 37*p3- 1056*p5+ 303*p6+ 833*p7+ 736,
      4990*p1*p2*p3*p4*p6*p7- 3067*p1*p2*p3*p4*p6- 1661*p1*p2*p3*p4*p7-
      4064*p1*p2*p3*p6*p7- 223*p1*p2*p4*p6*p7- 5229*p1*p3*p4*p6*p7-
      4636*p2*p3*p4*p6*p7+ 5720*p1*p2*p3*p4+ 4872*p1*p2*p3*p6+ 1643*p1*p2*p4*p6+
      4536*p1*p3*p4*p6+ 2451*p2*p3*p4*p6+ 1264*p1*p2*p3*p7+ 70*p1*p2*p4*p7+
      2213*p1*p3*p4*p7+ 1734*p2*p3*p4*p7+ 1698*p1*p2*p6*p7+ 3799*p1*p3*p6*p7+
      1622*p2*p3*p6*p7+ 901*p1*p4*p6*p7- 496*p2*p4*p6*p7+ 3782*p3*p4*p6*p7-
      5591*p1*p2*p3- 1303*p1*p2*p4- 6383*p1*p3*p4- 2332*p2*p3*p4- 3179*p1*p2*p6-
      6257*p1*p3*p6- 3654*p2*p3*p6- 1830*p1*p4*p6- 1473*p2*p4*p6- 3278*p3*p4*p6-
      1462*p1*p2*p7- 1495*p1*p3*p7- 468*p2*p3*p7- 400*p1*p4*p7+ 431*p2*p4*p7-
      1907*p3*p4*p7- 1547*p1*p6*p7- 214*p2*p6*p7- 1423*p3*p6*p7- 1625*p4*p6*p7+
      5708*p1*p2+ 3809*p1*p3+ 2053*p2*p3+ 2824*p1*p4+ 1122*p2*p4+ 3653*p3*p4+
      3658*p1*p6+ 3001*p2*p6+ 3890*p3*p6+ 2371*p4*p6+ 602*p1*p7+ 185*p2*p7+
      899*p3*p7+ 963*p4*p7+ 560*p6*p7- 4557*p1- 3536*p2- 1635*p3- 2552*p4- 2595*p6-
      207*p7+ 2740, - 1407*p1*p2*p3*p4*p5*p7+ 4444*p1*p2*p3*p4*p5+
      2350*p1*p2*p3*p4*p7+ 5424*p1*p2*p3*p5*p7- 2524*p1*p2*p4*p5*p7-
      985*p1*p3*p4*p5*p7- 431*p2*p3*p4*p5*p7- 2662*p1*p2*p3*p4- 5342*p1*p2*p3*p5-
      39*p1*p2*p4*p5- 2525*p1*p3*p4*p5- 2650*p2*p3*p4*p5- 3553*p1*p2*p3*p7-
      71*p1*p2*p4*p7- 3268*p1*p3*p4*p7- 1140*p2*p3*p4*p7- 702*p1*p2*p5*p7-
      924*p1*p3*p5*p7- 2198*p2*p3*p5*p7+ 4087*p1*p4*p5*p7+ 2709*p2*p4*p5*p7+
      587*p3*p4*p5*p7+ 968*p1*p2*p3- 150*p1*p2*p4+ 909*p1*p3*p4+ 4587*p2*p3*p4+
      929*p1*p2*p5+ 1804*p1*p3*p5+ 2226*p2*p3*p5- 916*p1*p4*p5+ 906*p2*p4*p5+
      2735*p3*p4*p5+ 1894*p1*p2*p7+ 2998*p1*p3*p7+ 1611*p2*p3*p7+ 304*p1*p4*p7-
      1601*p2*p4*p7+ 2066*p3*p4*p7- 1971*p1*p5*p7- 480*p2*p5*p7- 500*p3*p5*p7-
      2617*p4*p5*p7- 532*p1*p2+ 2016*p1*p3- 2574*p2*p3+ 529*p1*p4- 1251*p2*p4-
      2082*p3*p4+ 280*p1*p5- 852*p2*p5- 476*p3*p5- 340*p4*p5- 924*p1*p7+ 253*p2*p7-
      1090*p3*p7+ 170*p4*p7+ 1204*p5*p7- 869*p1+ 1394*p2- 264*p3+ 719*p4+ 219*p5-
      128*p7+ 506, - 901*p1*p2*p3*p4*p5*p6+ 1805*p1*p2*p3*p4*p5-
      1103*p1*p2*p3*p4*p6- 1746*p1*p2*p3*p5*p6- 1968*p1*p2*p4*p5*p6+
      3957*p1*p3*p4*p5*p6+ 1293*p2*p3*p4*p5*p6- 523*p1*p2*p3*p4- 2498*p1*p2*p3*p5+
      693*p1*p2*p4*p5- 2805*p1*p3*p4*p5- 722*p2*p3*p4*p5- 770*p1*p2*p3*p6+
      1088*p1*p2*p4*p6- 232*p1*p3*p4*p6+ 2657*p2*p3*p4*p6+ 3281*p1*p2*p5*p6-
      1066*p1*p3*p5*p6+ 240*p2*p3*p5*p6- 1174*p1*p4*p5*p6+ 1304*p2*p4*p5*p6-
      2070*p3*p4*p5*p6+ 2571*p1*p2*p3+ 115*p1*p2*p4+ 3899*p1*p3*p4- 4641*p2*p3*p4-
      752*p1*p2*p5+ 1531*p1*p3*p5+ 1178*p2*p3*p5+ 11*p1*p4*p5- 1144*p2*p4*p5-
      1701*p3*p4*p5+ 592*p1*p2*p6+ 1140*p1*p3*p6+ 130*p2*p3*p6+ 304*p1*p4*p6-
      2273*p2*p4*p6- 1224*p3*p4*p6- 2*p1*p5*p6- 1090*p2*p5*p6+ 585*p3*p5*p6+
      670*p4*p5*p6- 1867*p1*p2- 4780*p1*p3+ 1079*p2*p3- 2435*p1*p4+ 2901*p2*p4+
      2073*p3*p4+ 499*p1*p5+ 908*p2*p5+ 323*p3*p5+ 1631*p4*p5- 966*p1*p6- 315*p2*p6-
      481*p3*p6+ 759*p4*p6- 595*p5*p6+ 3233*p1- 1978*p2+ 729*p3- 1184*p4- 40*p5+
      446*p6+ 282
    )
  R, id
end

function yang_1(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 48
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "x$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
    x21*x45+ x22*x46+ x23*x47+ x24*x48, x17*x45+ x18*x46+ x19*x47+ x20*x48,
    x13*x45+ x14*x46+ x15*x47+ x16*x48, x10*x46+ x11*x47+ x12*x48+ x45*x9,
    x45*x5+ x46*x6+ x47*x7+ x48*x8, x1*x45+ x2*x46+ x3*x47+ x4*x48, x21*x41+
    x22*x42+ x23*x43+ x24*x44, x17*x41+ x18*x42+ x19*x43+ x20*x44, x13*x41+
    x14*x42+ x15*x43+ x16*x44, x10*x42+ x11*x43+ x12*x44+ x41*x9, x41*x5+
    x42*x6+ x43*x7+ x44*x8, x1*x41+ x2*x42+ x3*x43+ x4*x44, x21*x37+ x22*x38+
    x23*x39+ x24*x40, x17*x37+ x18*x38+ x19*x39+ x20*x40, x13*x37+ x14*x38+
    x15*x39+ x16*x40, x10*x38+ x11*x39+ x12*x40+ x37*x9, x37*x5+ x38*x6+ x39*x7+
    x40*x8, x1*x37+ x2*x38+ x3*x39+ x4*x40, x21*x33+ x22*x34+ x23*x35+ x24*x36,
    x17*x33+ x18*x34+ x19*x35+ x20*x36, x13*x33+ x14*x34+ x15*x35+ x16*x36,
    x10*x34+ x11*x35+ x12*x36+ x33*x9, x33*x5+ x34*x6+ x35*x7+ x36*x8, x1*x33+
    x2*x34+ x3*x35+ x36*x4, x21*x29+ x22*x30+ x23*x31+ x24*x32, x17*x29+
    x18*x30+ x19*x31+ x20*x32, x13*x29+ x14*x30+ x15*x31+ x16*x32, x10*x30+
    x11*x31+ x12*x32+ x29*x9, x29*x5+ x30*x6+ x31*x7+ x32*x8, x1*x29+ x2*x30+
    x3*x31+ x32*x4, x21*x25+ x22*x26+ x23*x27+ x24*x28, x17*x25+ x18*x26+
    x19*x27+ x20*x28, x13*x25+ x14*x26+ x15*x27+ x16*x28, x10*x26+ x11*x27+
    x12*x28+ x25*x9, x25*x5+ x26*x6+ x27*x7+ x28*x8, x1*x25+ x2*x26+ x27*x3+
    x28*x4, x33*x38*x43*x48- x33*x38*x44*x47- x33*x39*x42*x48+ x33*x39*x44*x46+
    x33*x40*x42*x47- x33*x40*x43*x46- x34*x37*x43*x48+ x34*x37*x44*x47+
    x34*x39*x41*x48- x34*x39*x44*x45- x34*x40*x41*x47+ x34*x40*x43*x45+
    x35*x37*x42*x48- x35*x37*x44*x46- x35*x38*x41*x48+ x35*x38*x44*x45+
    x35*x40*x41*x46- x35*x40*x42*x45- x36*x37*x42*x47+ x36*x37*x43*x46+
    x36*x38*x41*x47- x36*x38*x43*x45- x36*x39*x41*x46+ x36*x39*x42*x45,
    x29*x38*x43*x48- x29*x38*x44*x47- x29*x39*x42*x48+ x29*x39*x44*x46+
    x29*x40*x42*x47- x29*x40*x43*x46- x30*x37*x43*x48+ x30*x37*x44*x47+
    x30*x39*x41*x48- x30*x39*x44*x45- x30*x40*x41*x47+ x30*x40*x43*x45+
    x31*x37*x42*x48- x31*x37*x44*x46- x31*x38*x41*x48+ x31*x38*x44*x45+
    x31*x40*x41*x46- x31*x40*x42*x45- x32*x37*x42*x47+ x32*x37*x43*x46+
    x32*x38*x41*x47- x32*x38*x43*x45- x32*x39*x41*x46+ x32*x39*x42*x45,
    x25*x38*x43*x48- x25*x38*x44*x47- x25*x39*x42*x48+ x25*x39*x44*x46+
    x25*x40*x42*x47- x25*x40*x43*x46- x26*x37*x43*x48+ x26*x37*x44*x47+
    x26*x39*x41*x48- x26*x39*x44*x45- x26*x40*x41*x47+ x26*x40*x43*x45+
    x27*x37*x42*x48- x27*x37*x44*x46- x27*x38*x41*x48+ x27*x38*x44*x45+
    x27*x40*x41*x46- x27*x40*x42*x45- x28*x37*x42*x47+ x28*x37*x43*x46+
    x28*x38*x41*x47- x28*x38*x43*x45- x28*x39*x41*x46+ x28*x39*x42*x45,
    x29*x34*x43*x48- x29*x34*x44*x47- x29*x35*x42*x48+ x29*x35*x44*x46+
    x29*x36*x42*x47- x29*x36*x43*x46- x30*x33*x43*x48+ x30*x33*x44*x47+
    x30*x35*x41*x48- x30*x35*x44*x45- x30*x36*x41*x47+ x30*x36*x43*x45+
    x31*x33*x42*x48- x31*x33*x44*x46- x31*x34*x41*x48+ x31*x34*x44*x45+
    x31*x36*x41*x46- x31*x36*x42*x45- x32*x33*x42*x47+ x32*x33*x43*x46+
    x32*x34*x41*x47- x32*x34*x43*x45- x32*x35*x41*x46+ x32*x35*x42*x45,
    x25*x34*x43*x48- x25*x34*x44*x47- x25*x35*x42*x48+ x25*x35*x44*x46+
    x25*x36*x42*x47- x25*x36*x43*x46- x26*x33*x43*x48+ x26*x33*x44*x47+
    x26*x35*x41*x48- x26*x35*x44*x45- x26*x36*x41*x47+ x26*x36*x43*x45+
    x27*x33*x42*x48- x27*x33*x44*x46- x27*x34*x41*x48+ x27*x34*x44*x45+
    x27*x36*x41*x46- x27*x36*x42*x45- x28*x33*x42*x47+ x28*x33*x43*x46+
    x28*x34*x41*x47- x28*x34*x43*x45- x28*x35*x41*x46+ x28*x35*x42*x45,
    x25*x30*x43*x48- x25*x30*x44*x47- x25*x31*x42*x48+ x25*x31*x44*x46+
    x25*x32*x42*x47- x25*x32*x43*x46- x26*x29*x43*x48+ x26*x29*x44*x47+
    x26*x31*x41*x48- x26*x31*x44*x45- x26*x32*x41*x47+ x26*x32*x43*x45+
    x27*x29*x42*x48- x27*x29*x44*x46- x27*x30*x41*x48+ x27*x30*x44*x45+
    x27*x32*x41*x46- x27*x32*x42*x45- x28*x29*x42*x47+ x28*x29*x43*x46+
    x28*x30*x41*x47- x28*x30*x43*x45- x28*x31*x41*x46+ x28*x31*x42*x45,
    x29*x34*x39*x48- x29*x34*x40*x47- x29*x35*x38*x48+ x29*x35*x40*x46+
    x29*x36*x38*x47- x29*x36*x39*x46- x30*x33*x39*x48+ x30*x33*x40*x47+
    x30*x35*x37*x48- x30*x35*x40*x45- x30*x36*x37*x47+ x30*x36*x39*x45+
    x31*x33*x38*x48- x31*x33*x40*x46- x31*x34*x37*x48+ x31*x34*x40*x45+
    x31*x36*x37*x46- x31*x36*x38*x45- x32*x33*x38*x47+ x32*x33*x39*x46+
    x32*x34*x37*x47- x32*x34*x39*x45- x32*x35*x37*x46+ x32*x35*x38*x45,
    x25*x34*x39*x48- x25*x34*x40*x47- x25*x35*x38*x48+ x25*x35*x40*x46+
    x25*x36*x38*x47- x25*x36*x39*x46- x26*x33*x39*x48+ x26*x33*x40*x47+
    x26*x35*x37*x48- x26*x35*x40*x45- x26*x36*x37*x47+ x26*x36*x39*x45+
    x27*x33*x38*x48- x27*x33*x40*x46- x27*x34*x37*x48+ x27*x34*x40*x45+
    x27*x36*x37*x46- x27*x36*x38*x45- x28*x33*x38*x47+ x28*x33*x39*x46+
    x28*x34*x37*x47- x28*x34*x39*x45- x28*x35*x37*x46+ x28*x35*x38*x45,
    x25*x30*x39*x48- x25*x30*x40*x47- x25*x31*x38*x48+ x25*x31*x40*x46+
    x25*x32*x38*x47- x25*x32*x39*x46- x26*x29*x39*x48+ x26*x29*x40*x47+
    x26*x31*x37*x48- x26*x31*x40*x45- x26*x32*x37*x47+ x26*x32*x39*x45+
    x27*x29*x38*x48- x27*x29*x40*x46- x27*x30*x37*x48+ x27*x30*x40*x45+
    x27*x32*x37*x46- x27*x32*x38*x45- x28*x29*x38*x47+ x28*x29*x39*x46+
    x28*x30*x37*x47- x28*x30*x39*x45- x28*x31*x37*x46+ x28*x31*x38*x45,
    x25*x30*x35*x48- x25*x30*x36*x47- x25*x31*x34*x48+ x25*x31*x36*x46+
    x25*x32*x34*x47- x25*x32*x35*x46- x26*x29*x35*x48+ x26*x29*x36*x47+
    x26*x31*x33*x48- x26*x31*x36*x45- x26*x32*x33*x47+ x26*x32*x35*x45+
    x27*x29*x34*x48- x27*x29*x36*x46- x27*x30*x33*x48+ x27*x30*x36*x45+
    x27*x32*x33*x46- x27*x32*x34*x45- x28*x29*x34*x47+ x28*x29*x35*x46+
    x28*x30*x33*x47- x28*x30*x35*x45- x28*x31*x33*x46+ x28*x31*x34*x45,
    x29*x34*x39*x44- x29*x34*x40*x43- x29*x35*x38*x44+ x29*x35*x40*x42+
    x29*x36*x38*x43- x29*x36*x39*x42- x30*x33*x39*x44+ x30*x33*x40*x43+
    x30*x35*x37*x44- x30*x35*x40*x41- x30*x36*x37*x43+ x30*x36*x39*x41+
    x31*x33*x38*x44- x31*x33*x40*x42- x31*x34*x37*x44+ x31*x34*x40*x41+
    x31*x36*x37*x42- x31*x36*x38*x41- x32*x33*x38*x43+ x32*x33*x39*x42+
    x32*x34*x37*x43- x32*x34*x39*x41- x32*x35*x37*x42+ x32*x35*x38*x41,
    x25*x34*x39*x44- x25*x34*x40*x43- x25*x35*x38*x44+ x25*x35*x40*x42+
    x25*x36*x38*x43- x25*x36*x39*x42- x26*x33*x39*x44+ x26*x33*x40*x43+
    x26*x35*x37*x44- x26*x35*x40*x41- x26*x36*x37*x43+ x26*x36*x39*x41+
    x27*x33*x38*x44- x27*x33*x40*x42- x27*x34*x37*x44+ x27*x34*x40*x41+
    x27*x36*x37*x42- x27*x36*x38*x41- x28*x33*x38*x43+ x28*x33*x39*x42+
    x28*x34*x37*x43- x28*x34*x39*x41- x28*x35*x37*x42+ x28*x35*x38*x41,
    x25*x30*x39*x44- x25*x30*x40*x43- x25*x31*x38*x44+ x25*x31*x40*x42+
    x25*x32*x38*x43- x25*x32*x39*x42- x26*x29*x39*x44+ x26*x29*x40*x43+
    x26*x31*x37*x44- x26*x31*x40*x41- x26*x32*x37*x43+ x26*x32*x39*x41+
    x27*x29*x38*x44- x27*x29*x40*x42- x27*x30*x37*x44+ x27*x30*x40*x41+
    x27*x32*x37*x42- x27*x32*x38*x41- x28*x29*x38*x43+ x28*x29*x39*x42+
    x28*x30*x37*x43- x28*x30*x39*x41- x28*x31*x37*x42+ x28*x31*x38*x41,
    x25*x30*x35*x44- x25*x30*x36*x43- x25*x31*x34*x44+ x25*x31*x36*x42+
    x25*x32*x34*x43- x25*x32*x35*x42- x26*x29*x35*x44+ x26*x29*x36*x43+
    x26*x31*x33*x44- x26*x31*x36*x41- x26*x32*x33*x43+ x26*x32*x35*x41+
    x27*x29*x34*x44- x27*x29*x36*x42- x27*x30*x33*x44+ x27*x30*x36*x41+
    x27*x32*x33*x42- x27*x32*x34*x41- x28*x29*x34*x43+ x28*x29*x35*x42+
    x28*x30*x33*x43- x28*x30*x35*x41- x28*x31*x33*x42+ x28*x31*x34*x41,
    x25*x30*x35*x40- x25*x30*x36*x39- x25*x31*x34*x40+ x25*x31*x36*x38+
    x25*x32*x34*x39- x25*x32*x35*x38- x26*x29*x35*x40+ x26*x29*x36*x39+
    x26*x31*x33*x40- x26*x31*x36*x37- x26*x32*x33*x39+ x26*x32*x35*x37+
    x27*x29*x34*x40- x27*x29*x36*x38- x27*x30*x33*x40+ x27*x30*x36*x37+
    x27*x32*x33*x38- x27*x32*x34*x37- x28*x29*x34*x39+ x28*x29*x35*x38+
    x28*x30*x33*x39- x28*x30*x35*x37- x28*x31*x33*x38+ x28*x31*x34*x37, -
    x10*x13*x19*x24+ x10*x13*x20*x23+ x10*x15*x17*x24- x10*x15*x20*x21-
    x10*x16*x17*x23+ x10*x16*x19*x21+ x11*x13*x18*x24- x11*x13*x20*x22-
    x11*x14*x17*x24+ x11*x14*x20*x21+ x11*x16*x17*x22- x11*x16*x18*x21-
    x12*x13*x18*x23+ x12*x13*x19*x22+ x12*x14*x17*x23- x12*x14*x19*x21-
    x12*x15*x17*x22+ x12*x15*x18*x21+ x14*x19*x24*x9- x14*x20*x23*x9-
    x15*x18*x24*x9+ x15*x20*x22*x9+ x16*x18*x23*x9- x16*x19*x22*x9, -
    x13*x18*x23*x8+ x13*x18*x24*x7+ x13*x19*x22*x8- x13*x19*x24*x6-
    x13*x20*x22*x7+ x13*x20*x23*x6+ x14*x17*x23*x8- x14*x17*x24*x7-
    x14*x19*x21*x8+ x14*x19*x24*x5+ x14*x20*x21*x7- x14*x20*x23*x5-
    x15*x17*x22*x8+ x15*x17*x24*x6+ x15*x18*x21*x8- x15*x18*x24*x5-
    x15*x20*x21*x6+ x15*x20*x22*x5+ x16*x17*x22*x7- x16*x17*x23*x6-
    x16*x18*x21*x7+ x16*x18*x23*x5+ x16*x19*x21*x6- x16*x19*x22*x5,
    x1*x14*x19*x24- x1*x14*x20*x23- x1*x15*x18*x24+ x1*x15*x20*x22+
    x1*x16*x18*x23- x1*x16*x19*x22- x13*x18*x23*x4+ x13*x18*x24*x3-
    x13*x19*x2*x24+ x13*x19*x22*x4+ x13*x2*x20*x23- x13*x20*x22*x3+
    x14*x17*x23*x4- x14*x17*x24*x3- x14*x19*x21*x4+ x14*x20*x21*x3+
    x15*x17*x2*x24- x15*x17*x22*x4+ x15*x18*x21*x4- x15*x2*x20*x21-
    x16*x17*x2*x23+ x16*x17*x22*x3- x16*x18*x21*x3+ x16*x19*x2*x21,
    x10*x17*x23*x8- x10*x17*x24*x7- x10*x19*x21*x8+ x10*x19*x24*x5+
    x10*x20*x21*x7- x10*x20*x23*x5- x11*x17*x22*x8+ x11*x17*x24*x6+
    x11*x18*x21*x8- x11*x18*x24*x5- x11*x20*x21*x6+ x11*x20*x22*x5+
    x12*x17*x22*x7- x12*x17*x23*x6- x12*x18*x21*x7+ x12*x18*x23*x5+
    x12*x19*x21*x6- x12*x19*x22*x5- x18*x23*x8*x9+ x18*x24*x7*x9+ x19*x22*x8*x9-
    x19*x24*x6*x9- x20*x22*x7*x9+ x20*x23*x6*x9, x1*x10*x19*x24- x1*x10*x20*x23-
    x1*x11*x18*x24+ x1*x11*x20*x22+ x1*x12*x18*x23- x1*x12*x19*x22+
    x10*x17*x23*x4- x10*x17*x24*x3- x10*x19*x21*x4+ x10*x20*x21*x3+
    x11*x17*x2*x24- x11*x17*x22*x4+ x11*x18*x21*x4- x11*x2*x20*x21-
    x12*x17*x2*x23+ x12*x17*x22*x3- x12*x18*x21*x3+ x12*x19*x2*x21- x18*x23*x4*x9+
    x18*x24*x3*x9- x19*x2*x24*x9+ x19*x22*x4*x9+ x2*x20*x23*x9- x20*x22*x3*x9,
    x1*x18*x23*x8- x1*x18*x24*x7- x1*x19*x22*x8+ x1*x19*x24*x6+ x1*x20*x22*x7-
    x1*x20*x23*x6- x17*x2*x23*x8+ x17*x2*x24*x7+ x17*x22*x3*x8- x17*x22*x4*x7+
    x17*x23*x4*x6- x17*x24*x3*x6- x18*x21*x3*x8+ x18*x21*x4*x7- x18*x23*x4*x5+
    x18*x24*x3*x5+ x19*x2*x21*x8- x19*x2*x24*x5- x19*x21*x4*x6+ x19*x22*x4*x5-
    x2*x20*x21*x7+ x2*x20*x23*x5+ x20*x21*x3*x6- x20*x22*x3*x5, x10*x13*x23*x8-
    x10*x13*x24*x7- x10*x15*x21*x8+ x10*x15*x24*x5+ x10*x16*x21*x7-
    x10*x16*x23*x5- x11*x13*x22*x8+ x11*x13*x24*x6+ x11*x14*x21*x8-
    x11*x14*x24*x5- x11*x16*x21*x6+ x11*x16*x22*x5+ x12*x13*x22*x7-
    x12*x13*x23*x6- x12*x14*x21*x7+ x12*x14*x23*x5+ x12*x15*x21*x6-
    x12*x15*x22*x5- x14*x23*x8*x9+ x14*x24*x7*x9+ x15*x22*x8*x9- x15*x24*x6*x9-
    x16*x22*x7*x9+ x16*x23*x6*x9, x1*x10*x15*x24- x1*x10*x16*x23- x1*x11*x14*x24+
    x1*x11*x16*x22+ x1*x12*x14*x23- x1*x12*x15*x22+ x10*x13*x23*x4-
    x10*x13*x24*x3- x10*x15*x21*x4+ x10*x16*x21*x3+ x11*x13*x2*x24-
    x11*x13*x22*x4+ x11*x14*x21*x4- x11*x16*x2*x21- x12*x13*x2*x23+
    x12*x13*x22*x3- x12*x14*x21*x3+ x12*x15*x2*x21- x14*x23*x4*x9+ x14*x24*x3*x9-
    x15*x2*x24*x9+ x15*x22*x4*x9+ x16*x2*x23*x9- x16*x22*x3*x9, x1*x14*x23*x8-
    x1*x14*x24*x7- x1*x15*x22*x8+ x1*x15*x24*x6+ x1*x16*x22*x7- x1*x16*x23*x6-
    x13*x2*x23*x8+ x13*x2*x24*x7+ x13*x22*x3*x8- x13*x22*x4*x7+ x13*x23*x4*x6-
    x13*x24*x3*x6- x14*x21*x3*x8+ x14*x21*x4*x7- x14*x23*x4*x5+ x14*x24*x3*x5+
    x15*x2*x21*x8- x15*x2*x24*x5- x15*x21*x4*x6+ x15*x22*x4*x5- x16*x2*x21*x7+
    x16*x2*x23*x5+ x16*x21*x3*x6- x16*x22*x3*x5, x1*x10*x23*x8- x1*x10*x24*x7-
    x1*x11*x22*x8+ x1*x11*x24*x6+ x1*x12*x22*x7- x1*x12*x23*x6- x10*x21*x3*x8+
    x10*x21*x4*x7- x10*x23*x4*x5+ x10*x24*x3*x5+ x11*x2*x21*x8- x11*x2*x24*x5-
    x11*x21*x4*x6+ x11*x22*x4*x5- x12*x2*x21*x7+ x12*x2*x23*x5+ x12*x21*x3*x6-
    x12*x22*x3*x5- x2*x23*x8*x9+ x2*x24*x7*x9+ x22*x3*x8*x9- x22*x4*x7*x9+
    x23*x4*x6*x9- x24*x3*x6*x9, x10*x13*x19*x8- x10*x13*x20*x7- x10*x15*x17*x8+
    x10*x15*x20*x5+ x10*x16*x17*x7- x10*x16*x19*x5- x11*x13*x18*x8+
    x11*x13*x20*x6+ x11*x14*x17*x8- x11*x14*x20*x5- x11*x16*x17*x6+
    x11*x16*x18*x5+ x12*x13*x18*x7- x12*x13*x19*x6- x12*x14*x17*x7+
    x12*x14*x19*x5+ x12*x15*x17*x6- x12*x15*x18*x5- x14*x19*x8*x9+ x14*x20*x7*x9+
    x15*x18*x8*x9- x15*x20*x6*x9- x16*x18*x7*x9+ x16*x19*x6*x9, x1*x10*x15*x20-
    x1*x10*x16*x19- x1*x11*x14*x20+ x1*x11*x16*x18+ x1*x12*x14*x19-
    x1*x12*x15*x18+ x10*x13*x19*x4- x10*x13*x20*x3- x10*x15*x17*x4+
    x10*x16*x17*x3- x11*x13*x18*x4+ x11*x13*x2*x20+ x11*x14*x17*x4-
    x11*x16*x17*x2+ x12*x13*x18*x3- x12*x13*x19*x2- x12*x14*x17*x3+
    x12*x15*x17*x2- x14*x19*x4*x9+ x14*x20*x3*x9+ x15*x18*x4*x9- x15*x2*x20*x9-
    x16*x18*x3*x9+ x16*x19*x2*x9, x1*x14*x19*x8- x1*x14*x20*x7- x1*x15*x18*x8+
    x1*x15*x20*x6+ x1*x16*x18*x7- x1*x16*x19*x6+ x13*x18*x3*x8- x13*x18*x4*x7-
    x13*x19*x2*x8+ x13*x19*x4*x6+ x13*x2*x20*x7- x13*x20*x3*x6- x14*x17*x3*x8+
    x14*x17*x4*x7- x14*x19*x4*x5+ x14*x20*x3*x5+ x15*x17*x2*x8- x15*x17*x4*x6+
    x15*x18*x4*x5- x15*x2*x20*x5- x16*x17*x2*x7+ x16*x17*x3*x6- x16*x18*x3*x5+
    x16*x19*x2*x5, x1*x10*x19*x8- x1*x10*x20*x7- x1*x11*x18*x8+ x1*x11*x20*x6+
    x1*x12*x18*x7- x1*x12*x19*x6- x10*x17*x3*x8+ x10*x17*x4*x7- x10*x19*x4*x5+
    x10*x20*x3*x5+ x11*x17*x2*x8- x11*x17*x4*x6+ x11*x18*x4*x5- x11*x2*x20*x5-
    x12*x17*x2*x7+ x12*x17*x3*x6- x12*x18*x3*x5+ x12*x19*x2*x5+ x18*x3*x8*x9-
    x18*x4*x7*x9- x19*x2*x8*x9+ x19*x4*x6*x9+ x2*x20*x7*x9- x20*x3*x6*x9,
    x1*x10*x15*x8- x1*x10*x16*x7- x1*x11*x14*x8+ x1*x11*x16*x6+ x1*x12*x14*x7-
    x1*x12*x15*x6- x10*x13*x3*x8+ x10*x13*x4*x7- x10*x15*x4*x5+ x10*x16*x3*x5+
    x11*x13*x2*x8- x11*x13*x4*x6+ x11*x14*x4*x5- x11*x16*x2*x5- x12*x13*x2*x7+
    x12*x13*x3*x6- x12*x14*x3*x5+ x12*x15*x2*x5+ x14*x3*x8*x9- x14*x4*x7*x9-
    x15*x2*x8*x9+ x15*x4*x6*x9+ x16*x2*x7*x9- x16*x3*x6*x9
    )
  R, id
end

function yang_l10_m5(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 11
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "z$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
    2*z2^13- 4*z2^12*z3- 4*z2^12*z4+ 6*z2^11*z3*z4- 4*z2^12*z5+ 6*z2^11*z3*z5+
    6*z2^11*z4*z5- 8*z2^10*z3*z4*z5- 4*z2^12*z6+ 6*z2^11*z3*z6+ 6*z2^11*z4*z6-
    8*z2^10*z3*z4*z6+ 6*z2^11*z5*z6- 8*z2^10*z3*z5*z6- 8*z2^10*z4*z5*z6+
    10*z2^9*z3*z4*z5*z6+ 8*z2^11+ 4491*z2^10*z3+ 4491*z2^10*z4+ 5*z2^9*z3*z4+
    4491*z2^10*z5+ 5*z2^9*z3*z5+ 5*z2^9*z4*z5- 4493*z2^8*z3*z4*z5+
    4491*z2^10*z6+ 5*z2^9*z3*z6+ 5*z2^9*z4*z6- 4493*z2^8*z3*z4*z6+ 5*z2^9*z5*z6-
    4493*z2^8*z3*z5*z6- 4493*z2^8*z4*z5*z6- 30*z2^7*z3*z4*z5*z6+ 2261*z2^9+
    4496*z2^8*z3+ 4496*z2^8*z4- 2257*z2^7*z3*z4+ 4496*z2^8*z5- 2257*z2^7*z3*z5-
    2257*z2^7*z4*z5- 4490*z2^6*z3*z4*z5+ 4496*z2^8*z6- 2257*z2^7*z3*z6-
    2257*z2^7*z4*z6- 4490*z2^6*z3*z4*z6- 2257*z2^7*z5*z6- 4490*z2^6*z3*z5*z6-
    4490*z2^6*z4*z5*z6+ 2266*z2^5*z3*z4*z5*z6+ 1130*z2^7+ 2816*z2^6*z3+
    2816*z2^6*z4+ 4496*z2^5*z3*z4+ 2816*z2^6*z5+ 4496*z2^5*z3*z5+
    4496*z2^5*z4*z5+ 1683*z2^4*z3*z4*z5+ 2816*z2^6*z6+ 4496*z2^5*z3*z6+
    4496*z2^5*z4*z6+ 1683*z2^4*z3*z4*z6+ 4496*z2^5*z5*z6+ 1683*z2^4*z3*z5*z6+
    1683*z2^4*z4*z5*z6- 1127*z2^3*z3*z4*z5*z6+ 3867*z2^5+ 1549*z2^4*z3+
    1549*z2^4*z4- 2460*z2^3*z3*z4+ 1549*z2^4*z5- 2460*z2^3*z3*z5-
    2460*z2^3*z4*z5+ 1688*z2^2*z3*z4*z5+ 1549*z2^4*z6- 2460*z2^3*z3*z6-
    2460*z2^3*z4*z6+ 1688*z2^2*z3*z4*z6- 2460*z2^3*z5*z6+ 1688*z2^2*z3*z5*z6+
    1688*z2^2*z4*z5*z6+ 211*z2*z3*z4*z5*z6+ 3445*z2^3- 4448*z2^2*z3-
    4448*z2^2*z4- 1090*z2*z3*z4- 4448*z2^2*z5- 1090*z2*z3*z5- 1090*z2*z4*z5-
    4061*z3*z4*z5- 4448*z2^2*z6- 1090*z2*z3*z6- 1090*z2*z4*z6- 4061*z3*z4*z6-
    1090*z2*z5*z6- 4061*z3*z5*z6- 4061*z4*z5*z6+ 1969*z2+ 4061*z3+ 4061*z4+
    4061*z5+ 4061*z6, - 4*z2*z3^12+ 2*z3^13+ 6*z2*z3^11*z4- 4*z3^12*z4+
    6*z2*z3^11*z5- 4*z3^12*z5- 8*z2*z3^10*z4*z5+ 6*z3^11*z4*z5+ 6*z2*z3^11*z6-
    4*z3^12*z6- 8*z2*z3^10*z4*z6+ 6*z3^11*z4*z6- 8*z2*z3^10*z5*z6+ 6*z3^11*z5*z6+
    10*z2*z3^9*z4*z5*z6- 8*z3^10*z4*z5*z6+ 4491*z2*z3^10+ 8*z3^11+ 5*z2*z3^9*z4+
    4491*z3^10*z4+ 5*z2*z3^9*z5+ 4491*z3^10*z5- 4493*z2*z3^8*z4*z5+ 5*z3^9*z4*z5+
    5*z2*z3^9*z6+ 4491*z3^10*z6- 4493*z2*z3^8*z4*z6+ 5*z3^9*z4*z6-
    4493*z2*z3^8*z5*z6+ 5*z3^9*z5*z6- 30*z2*z3^7*z4*z5*z6- 4493*z3^8*z4*z5*z6+
    4496*z2*z3^8+ 2261*z3^9- 2257*z2*z3^7*z4+ 4496*z3^8*z4- 2257*z2*z3^7*z5+
    4496*z3^8*z5- 4490*z2*z3^6*z4*z5- 2257*z3^7*z4*z5- 2257*z2*z3^7*z6+
    4496*z3^8*z6- 4490*z2*z3^6*z4*z6- 2257*z3^7*z4*z6- 4490*z2*z3^6*z5*z6-
    2257*z3^7*z5*z6+ 2266*z2*z3^5*z4*z5*z6- 4490*z3^6*z4*z5*z6+ 2816*z2*z3^6+
    1130*z3^7+ 4496*z2*z3^5*z4+ 2816*z3^6*z4+ 4496*z2*z3^5*z5+ 2816*z3^6*z5+
    1683*z2*z3^4*z4*z5+ 4496*z3^5*z4*z5+ 4496*z2*z3^5*z6+ 2816*z3^6*z6+
    1683*z2*z3^4*z4*z6+ 4496*z3^5*z4*z6+ 1683*z2*z3^4*z5*z6+ 4496*z3^5*z5*z6-
    1127*z2*z3^3*z4*z5*z6+ 1683*z3^4*z4*z5*z6+ 1549*z2*z3^4+ 3867*z3^5-
    2460*z2*z3^3*z4+ 1549*z3^4*z4- 2460*z2*z3^3*z5+ 1549*z3^4*z5+
    1688*z2*z3^2*z4*z5- 2460*z3^3*z4*z5- 2460*z2*z3^3*z6+ 1549*z3^4*z6+
    1688*z2*z3^2*z4*z6- 2460*z3^3*z4*z6+ 1688*z2*z3^2*z5*z6- 2460*z3^3*z5*z6+
    211*z2*z3*z4*z5*z6+ 1688*z3^2*z4*z5*z6- 4448*z2*z3^2+ 3445*z3^3-
    1090*z2*z3*z4- 4448*z3^2*z4- 1090*z2*z3*z5- 4448*z3^2*z5- 4061*z2*z4*z5-
    1090*z3*z4*z5- 1090*z2*z3*z6- 4448*z3^2*z6- 4061*z2*z4*z6- 1090*z3*z4*z6-
    4061*z2*z5*z6- 1090*z3*z5*z6- 4061*z4*z5*z6+ 4061*z2+ 1969*z3+ 4061*z4+
    4061*z5+ 4061*z6, 6*z2*z3*z4^11- 4*z2*z4^12- 4*z3*z4^12+ 2*z4^13-
    8*z2*z3*z4^10*z5+ 6*z2*z4^11*z5+ 6*z3*z4^11*z5- 4*z4^12*z5- 8*z2*z3*z4^10*z6+
    6*z2*z4^11*z6+ 6*z3*z4^11*z6- 4*z4^12*z6+ 10*z2*z3*z4^9*z5*z6-
    8*z2*z4^10*z5*z6- 8*z3*z4^10*z5*z6+ 6*z4^11*z5*z6+ 5*z2*z3*z4^9+
    4491*z2*z4^10+ 4491*z3*z4^10+ 8*z4^11- 4493*z2*z3*z4^8*z5+ 5*z2*z4^9*z5+
    5*z3*z4^9*z5+ 4491*z4^10*z5- 4493*z2*z3*z4^8*z6+ 5*z2*z4^9*z6+ 5*z3*z4^9*z6+
    4491*z4^10*z6- 30*z2*z3*z4^7*z5*z6- 4493*z2*z4^8*z5*z6- 4493*z3*z4^8*z5*z6+
    5*z4^9*z5*z6- 2257*z2*z3*z4^7+ 4496*z2*z4^8+ 4496*z3*z4^8+ 2261*z4^9-
    4490*z2*z3*z4^6*z5- 2257*z2*z4^7*z5- 2257*z3*z4^7*z5+ 4496*z4^8*z5-
    4490*z2*z3*z4^6*z6- 2257*z2*z4^7*z6- 2257*z3*z4^7*z6+ 4496*z4^8*z6+
    2266*z2*z3*z4^5*z5*z6- 4490*z2*z4^6*z5*z6- 4490*z3*z4^6*z5*z6-
    2257*z4^7*z5*z6+ 4496*z2*z3*z4^5+ 2816*z2*z4^6+ 2816*z3*z4^6+ 1130*z4^7+
    1683*z2*z3*z4^4*z5+ 4496*z2*z4^5*z5+ 4496*z3*z4^5*z5+ 2816*z4^6*z5+
    1683*z2*z3*z4^4*z6+ 4496*z2*z4^5*z6+ 4496*z3*z4^5*z6+ 2816*z4^6*z6-
    1127*z2*z3*z4^3*z5*z6+ 1683*z2*z4^4*z5*z6+ 1683*z3*z4^4*z5*z6+
    4496*z4^5*z5*z6- 2460*z2*z3*z4^3+ 1549*z2*z4^4+ 1549*z3*z4^4+ 3867*z4^5+
    1688*z2*z3*z4^2*z5- 2460*z2*z4^3*z5- 2460*z3*z4^3*z5+ 1549*z4^4*z5+
    1688*z2*z3*z4^2*z6- 2460*z2*z4^3*z6- 2460*z3*z4^3*z6+ 1549*z4^4*z6+
    211*z2*z3*z4*z5*z6+ 1688*z2*z4^2*z5*z6+ 1688*z3*z4^2*z5*z6- 2460*z4^3*z5*z6-
    1090*z2*z3*z4- 4448*z2*z4^2- 4448*z3*z4^2+ 3445*z4^3- 4061*z2*z3*z5-
    1090*z2*z4*z5- 1090*z3*z4*z5- 4448*z4^2*z5- 4061*z2*z3*z6- 1090*z2*z4*z6-
    1090*z3*z4*z6- 4448*z4^2*z6- 4061*z2*z5*z6- 4061*z3*z5*z6- 1090*z4*z5*z6+
    4061*z2+ 4061*z3+ 1969*z4+ 4061*z5+ 4061*z6, - 8*z2*z3*z4*z5^10+
    6*z2*z3*z5^11+ 6*z2*z4*z5^11+ 6*z3*z4*z5^11- 4*z2*z5^12- 4*z3*z5^12-
    4*z4*z5^12+ 2*z5^13+ 10*z2*z3*z4*z5^9*z6- 8*z2*z3*z5^10*z6- 8*z2*z4*z5^10*z6-
    8*z3*z4*z5^10*z6+ 6*z2*z5^11*z6+ 6*z3*z5^11*z6+ 6*z4*z5^11*z6- 4*z5^12*z6-
    4493*z2*z3*z4*z5^8+ 5*z2*z3*z5^9+ 5*z2*z4*z5^9+ 5*z3*z4*z5^9+ 4491*z2*z5^10+
    4491*z3*z5^10+ 4491*z4*z5^10+ 8*z5^11- 30*z2*z3*z4*z5^7*z6-
    4493*z2*z3*z5^8*z6- 4493*z2*z4*z5^8*z6- 4493*z3*z4*z5^8*z6+ 5*z2*z5^9*z6+
    5*z3*z5^9*z6+ 5*z4*z5^9*z6+ 4491*z5^10*z6- 4490*z2*z3*z4*z5^6-
    2257*z2*z3*z5^7- 2257*z2*z4*z5^7- 2257*z3*z4*z5^7+ 4496*z2*z5^8+ 4496*z3*z5^8+
    4496*z4*z5^8+ 2261*z5^9+ 2266*z2*z3*z4*z5^5*z6- 4490*z2*z3*z5^6*z6-
    4490*z2*z4*z5^6*z6- 4490*z3*z4*z5^6*z6- 2257*z2*z5^7*z6- 2257*z3*z5^7*z6-
    2257*z4*z5^7*z6+ 4496*z5^8*z6+ 1683*z2*z3*z4*z5^4+ 4496*z2*z3*z5^5+
    4496*z2*z4*z5^5+ 4496*z3*z4*z5^5+ 2816*z2*z5^6+ 2816*z3*z5^6+ 2816*z4*z5^6+
    1130*z5^7- 1127*z2*z3*z4*z5^3*z6+ 1683*z2*z3*z5^4*z6+ 1683*z2*z4*z5^4*z6+
    1683*z3*z4*z5^4*z6+ 4496*z2*z5^5*z6+ 4496*z3*z5^5*z6+ 4496*z4*z5^5*z6+
    2816*z5^6*z6+ 1688*z2*z3*z4*z5^2- 2460*z2*z3*z5^3- 2460*z2*z4*z5^3-
    2460*z3*z4*z5^3+ 1549*z2*z5^4+ 1549*z3*z5^4+ 1549*z4*z5^4+ 3867*z5^5+
    211*z2*z3*z4*z5*z6+ 1688*z2*z3*z5^2*z6+ 1688*z2*z4*z5^2*z6+
    1688*z3*z4*z5^2*z6- 2460*z2*z5^3*z6- 2460*z3*z5^3*z6- 2460*z4*z5^3*z6+
    1549*z5^4*z6- 4061*z2*z3*z4- 1090*z2*z3*z5- 1090*z2*z4*z5- 1090*z3*z4*z5-
    4448*z2*z5^2- 4448*z3*z5^2- 4448*z4*z5^2+ 3445*z5^3- 4061*z2*z3*z6-
    4061*z2*z4*z6- 4061*z3*z4*z6- 1090*z2*z5*z6- 1090*z3*z5*z6- 1090*z4*z5*z6-
    4448*z5^2*z6+ 4061*z2+ 4061*z3+ 4061*z4+ 1969*z5+ 4061*z6,
    10*z2*z3*z4*z5*z6^9- 8*z2*z3*z4*z6^10- 8*z2*z3*z5*z6^10- 8*z2*z4*z5*z6^10-
    8*z3*z4*z5*z6^10+ 6*z2*z3*z6^11+ 6*z2*z4*z6^11+ 6*z3*z4*z6^11+ 6*z2*z5*z6^11+
    6*z3*z5*z6^11+ 6*z4*z5*z6^11- 4*z2*z6^12- 4*z3*z6^12- 4*z4*z6^12- 4*z5*z6^12+
    2*z6^13- 30*z2*z3*z4*z5*z6^7- 4493*z2*z3*z4*z6^8- 4493*z2*z3*z5*z6^8-
    4493*z2*z4*z5*z6^8- 4493*z3*z4*z5*z6^8+ 5*z2*z3*z6^9+ 5*z2*z4*z6^9+
    5*z3*z4*z6^9+ 5*z2*z5*z6^9+ 5*z3*z5*z6^9+ 5*z4*z5*z6^9+ 4491*z2*z6^10+
    4491*z3*z6^10+ 4491*z4*z6^10+ 4491*z5*z6^10+ 8*z6^11+ 2266*z2*z3*z4*z5*z6^5-
    4490*z2*z3*z4*z6^6- 4490*z2*z3*z5*z6^6- 4490*z2*z4*z5*z6^6-
    4490*z3*z4*z5*z6^6- 2257*z2*z3*z6^7- 2257*z2*z4*z6^7- 2257*z3*z4*z6^7-
    2257*z2*z5*z6^7- 2257*z3*z5*z6^7- 2257*z4*z5*z6^7+ 4496*z2*z6^8+ 4496*z3*z6^8+
    4496*z4*z6^8+ 4496*z5*z6^8+ 2261*z6^9- 1127*z2*z3*z4*z5*z6^3+
    1683*z2*z3*z4*z6^4+ 1683*z2*z3*z5*z6^4+ 1683*z2*z4*z5*z6^4+
    1683*z3*z4*z5*z6^4+ 4496*z2*z3*z6^5+ 4496*z2*z4*z6^5+ 4496*z3*z4*z6^5+
    4496*z2*z5*z6^5+ 4496*z3*z5*z6^5+ 4496*z4*z5*z6^5+ 2816*z2*z6^6+ 2816*z3*z6^6+
    2816*z4*z6^6+ 2816*z5*z6^6+ 1130*z6^7+ 211*z2*z3*z4*z5*z6+ 1688*z2*z3*z4*z6^2+
    1688*z2*z3*z5*z6^2+ 1688*z2*z4*z5*z6^2+ 1688*z3*z4*z5*z6^2- 2460*z2*z3*z6^3-
    2460*z2*z4*z6^3- 2460*z3*z4*z6^3- 2460*z2*z5*z6^3- 2460*z3*z5*z6^3-
    2460*z4*z5*z6^3+ 1549*z2*z6^4+ 1549*z3*z6^4+ 1549*z4*z6^4+ 1549*z5*z6^4+
    3867*z6^5- 4061*z2*z3*z4- 4061*z2*z3*z5- 4061*z2*z4*z5- 4061*z3*z4*z5-
    1090*z2*z3*z6- 1090*z2*z4*z6- 1090*z3*z4*z6- 1090*z2*z5*z6- 1090*z3*z5*z6-
    1090*z4*z5*z6- 4448*z2*z6^2- 4448*z3*z6^2- 4448*z4*z6^2- 4448*z5*z6^2+
    3445*z6^3+ 4061*z2+ 4061*z3+ 4061*z4+ 4061*z5+ 1969*z6, 2*z2^12- 2*z2^11*z3-
    2*z2^10*z3^2- 2*z2^9*z3^3- 2*z2^8*z3^4- 2*z2^7*z3^5- 2*z2^6*z3^6- 2*z2^5*z3^7-
    2*z2^4*z3^8- 2*z2^3*z3^9- 2*z2^2*z3^10- 2*z2*z3^11+ 2*z3^12- 4*z2^11*z4+
    2*z2^10*z3*z4+ 2*z2^9*z3^2*z4+ 2*z2^8*z3^3*z4+ 2*z2^7*z3^4*z4+ 2*z2^6*z3^5*z4+
    2*z2^5*z3^6*z4+ 2*z2^4*z3^7*z4+ 2*z2^3*z3^8*z4+ 2*z2^2*z3^9*z4+ 2*z2*z3^10*z4-
    4*z3^11*z4- 4*z2^11*z5+ 2*z2^10*z3*z5+ 2*z2^9*z3^2*z5+ 2*z2^8*z3^3*z5+
    2*z2^7*z3^4*z5+ 2*z2^6*z3^5*z5+ 2*z2^5*z3^6*z5+ 2*z2^4*z3^7*z5+
    2*z2^3*z3^8*z5+ 2*z2^2*z3^9*z5+ 2*z2*z3^10*z5- 4*z3^11*z5+ 6*z2^10*z4*z5-
    2*z2^9*z3*z4*z5- 2*z2^8*z3^2*z4*z5- 2*z2^7*z3^3*z4*z5- 2*z2^6*z3^4*z4*z5-
    2*z2^5*z3^5*z4*z5- 2*z2^4*z3^6*z4*z5- 2*z2^3*z3^7*z4*z5- 2*z2^2*z3^8*z4*z5-
    2*z2*z3^9*z4*z5+ 6*z3^10*z4*z5- 4*z2^11*z6+ 2*z2^10*z3*z6+ 2*z2^9*z3^2*z6+
    2*z2^8*z3^3*z6+ 2*z2^7*z3^4*z6+ 2*z2^6*z3^5*z6+ 2*z2^5*z3^6*z6+
    2*z2^4*z3^7*z6+ 2*z2^3*z3^8*z6+ 2*z2^2*z3^9*z6+ 2*z2*z3^10*z6- 4*z3^11*z6+
    6*z2^10*z4*z6- 2*z2^9*z3*z4*z6- 2*z2^8*z3^2*z4*z6- 2*z2^7*z3^3*z4*z6-
    2*z2^6*z3^4*z4*z6- 2*z2^5*z3^5*z4*z6- 2*z2^4*z3^6*z4*z6- 2*z2^3*z3^7*z4*z6-
    2*z2^2*z3^8*z4*z6- 2*z2*z3^9*z4*z6+ 6*z3^10*z4*z6+ 6*z2^10*z5*z6-
    2*z2^9*z3*z5*z6- 2*z2^8*z3^2*z5*z6- 2*z2^7*z3^3*z5*z6- 2*z2^6*z3^4*z5*z6-
    2*z2^5*z3^5*z5*z6- 2*z2^4*z3^6*z5*z6- 2*z2^3*z3^7*z5*z6- 2*z2^2*z3^8*z5*z6-
    2*z2*z3^9*z5*z6+ 6*z3^10*z5*z6- 8*z2^9*z4*z5*z6+ 2*z2^8*z3*z4*z5*z6+
    2*z2^7*z3^2*z4*z5*z6+ 2*z2^6*z3^3*z4*z5*z6+ 2*z2^5*z3^4*z4*z5*z6+
    2*z2^4*z3^5*z4*z5*z6+ 2*z2^3*z3^6*z4*z5*z6+ 2*z2^2*z3^7*z4*z5*z6+
    2*z2*z3^8*z4*z5*z6- 8*z3^9*z4*z5*z6+ 8*z2^10+ 4499*z2^9*z3+ 4499*z2^8*z3^2+
    4499*z2^7*z3^3+ 4499*z2^6*z3^4+ 4499*z2^5*z3^5+ 4499*z2^4*z3^6+
    4499*z2^3*z3^7+ 4499*z2^2*z3^8+ 4499*z2*z3^9+ 8*z3^10+ 4491*z2^9*z4+
    4496*z2^8*z3*z4+ 4496*z2^7*z3^2*z4+ 4496*z2^6*z3^3*z4+ 4496*z2^5*z3^4*z4+
    4496*z2^4*z3^5*z4+ 4496*z2^3*z3^6*z4+ 4496*z2^2*z3^7*z4+ 4496*z2*z3^8*z4+
    4491*z3^9*z4+ 4491*z2^9*z5+ 4496*z2^8*z3*z5+ 4496*z2^7*z3^2*z5+
    4496*z2^6*z3^3*z5+ 4496*z2^5*z3^4*z5+ 4496*z2^4*z3^5*z5+ 4496*z2^3*z3^6*z5+
    4496*z2^2*z3^7*z5+ 4496*z2*z3^8*z5+ 4491*z3^9*z5+ 5*z2^8*z4*z5-
    4488*z2^7*z3*z4*z5- 4488*z2^6*z3^2*z4*z5- 4488*z2^5*z3^3*z4*z5-
    4488*z2^4*z3^4*z4*z5- 4488*z2^3*z3^5*z4*z5- 4488*z2^2*z3^6*z4*z5-
    4488*z2*z3^7*z4*z5+ 5*z3^8*z4*z5+ 4491*z2^9*z6+ 4496*z2^8*z3*z6+
    4496*z2^7*z3^2*z6+ 4496*z2^6*z3^3*z6+ 4496*z2^5*z3^4*z6+ 4496*z2^4*z3^5*z6+
    4496*z2^3*z3^6*z6+ 4496*z2^2*z3^7*z6+ 4496*z2*z3^8*z6+ 4491*z3^9*z6+
    5*z2^8*z4*z6- 4488*z2^7*z3*z4*z6- 4488*z2^6*z3^2*z4*z6- 4488*z2^5*z3^3*z4*z6-
    4488*z2^4*z3^4*z4*z6- 4488*z2^3*z3^5*z4*z6- 4488*z2^2*z3^6*z4*z6-
    4488*z2*z3^7*z4*z6+ 5*z3^8*z4*z6+ 5*z2^8*z5*z6- 4488*z2^7*z3*z5*z6-
    4488*z2^6*z3^2*z5*z6- 4488*z2^5*z3^3*z5*z6- 4488*z2^4*z3^4*z5*z6-
    4488*z2^3*z3^5*z5*z6- 4488*z2^2*z3^6*z5*z6- 4488*z2*z3^7*z5*z6+ 5*z3^8*z5*z6-
    4493*z2^7*z4*z5*z6+ 4478*z2^6*z3*z4*z5*z6+ 4478*z2^5*z3^2*z4*z5*z6+
    4478*z2^4*z3^3*z4*z5*z6+ 4478*z2^3*z3^4*z4*z5*z6+ 4478*z2^2*z3^5*z4*z5*z6+
    4478*z2*z3^6*z4*z5*z6- 4493*z3^7*z4*z5*z6+ 2261*z2^8- 2244*z2^7*z3-
    2244*z2^6*z3^2- 2244*z2^5*z3^3- 2244*z2^4*z3^4- 2244*z2^3*z3^5-
    2244*z2^2*z3^6- 2244*z2*z3^7+ 2261*z3^8+ 4496*z2^7*z4+ 2239*z2^6*z3*z4+
    2239*z2^5*z3^2*z4+ 2239*z2^4*z3^3*z4+ 2239*z2^3*z3^4*z4+ 2239*z2^2*z3^5*z4+
    2239*z2*z3^6*z4+ 4496*z3^7*z4+ 4496*z2^7*z5+ 2239*z2^6*z3*z5+
    2239*z2^5*z3^2*z5+ 2239*z2^4*z3^3*z5+ 2239*z2^3*z3^4*z5+ 2239*z2^2*z3^5*z5+
    2239*z2*z3^6*z5+ 4496*z3^7*z5- 2257*z2^6*z4*z5+ 2254*z2^5*z3*z4*z5+
    2254*z2^4*z3^2*z4*z5+ 2254*z2^3*z3^3*z4*z5+ 2254*z2^2*z3^4*z4*z5+
    2254*z2*z3^5*z4*z5- 2257*z3^6*z4*z5+ 4496*z2^7*z6+ 2239*z2^6*z3*z6+
    2239*z2^5*z3^2*z6+ 2239*z2^4*z3^3*z6+ 2239*z2^3*z3^4*z6+ 2239*z2^2*z3^5*z6+
    2239*z2*z3^6*z6+ 4496*z3^7*z6- 2257*z2^6*z4*z6+ 2254*z2^5*z3*z4*z6+
    2254*z2^4*z3^2*z4*z6+ 2254*z2^3*z3^3*z4*z6+ 2254*z2^2*z3^4*z4*z6+
    2254*z2*z3^5*z4*z6- 2257*z3^6*z4*z6- 2257*z2^6*z5*z6+ 2254*z2^5*z3*z5*z6+
    2254*z2^4*z3^2*z5*z6+ 2254*z2^3*z3^3*z5*z6+ 2254*z2^2*z3^4*z5*z6+
    2254*z2*z3^5*z5*z6- 2257*z3^6*z5*z6- 4490*z2^5*z4*z5*z6-
    2224*z2^4*z3*z4*z5*z6- 2224*z2^3*z3^2*z4*z5*z6- 2224*z2^2*z3^3*z4*z5*z6-
    2224*z2*z3^4*z4*z5*z6- 4490*z3^5*z4*z5*z6+ 1130*z2^6+ 3946*z2^5*z3+
    3946*z2^4*z3^2+ 3946*z2^3*z3^3+ 3946*z2^2*z3^4+ 3946*z2*z3^5+ 1130*z3^6+
    2816*z2^5*z4- 1689*z2^4*z3*z4- 1689*z2^3*z3^2*z4- 1689*z2^2*z3^3*z4-
    1689*z2*z3^4*z4+ 2816*z3^5*z4+ 2816*z2^5*z5- 1689*z2^4*z3*z5-
    1689*z2^3*z3^2*z5- 1689*z2^2*z3^3*z5- 1689*z2*z3^4*z5+ 2816*z3^5*z5+
    4496*z2^4*z4*z5- 2822*z2^3*z3*z4*z5- 2822*z2^2*z3^2*z4*z5- 2822*z2*z3^3*z4*z5+
    4496*z3^4*z4*z5+ 2816*z2^5*z6- 1689*z2^4*z3*z6- 1689*z2^3*z3^2*z6-
    1689*z2^2*z3^3*z6- 1689*z2*z3^4*z6+ 2816*z3^5*z6+ 4496*z2^4*z4*z6-
    2822*z2^3*z3*z4*z6- 2822*z2^2*z3^2*z4*z6- 2822*z2*z3^3*z4*z6+ 4496*z3^4*z4*z6+
    4496*z2^4*z5*z6- 2822*z2^3*z3*z5*z6- 2822*z2^2*z3^2*z5*z6- 2822*z2*z3^3*z5*z6+
    4496*z3^4*z5*z6+ 1683*z2^3*z4*z5*z6+ 556*z2^2*z3*z4*z5*z6+
    556*z2*z3^2*z4*z5*z6+ 1683*z3^3*z4*z5*z6+ 3867*z2^4- 3585*z2^3*z3-
    3585*z2^2*z3^2- 3585*z2*z3^3+ 3867*z3^4+ 1549*z2^3*z4- 911*z2^2*z3*z4-
    911*z2*z3^2*z4+ 1549*z3^3*z4+ 1549*z2^3*z5- 911*z2^2*z3*z5- 911*z2*z3^2*z5+
    1549*z3^3*z5- 2460*z2^2*z4*z5- 772*z2*z3*z4*z5- 2460*z3^2*z4*z5+ 1549*z2^3*z6-
    911*z2^2*z3*z6- 911*z2*z3^2*z6+ 1549*z3^3*z6- 2460*z2^2*z4*z6-
    772*z2*z3*z4*z6- 2460*z3^2*z4*z6- 2460*z2^2*z5*z6- 772*z2*z3*z5*z6-
    2460*z3^2*z5*z6+ 1688*z2*z4*z5*z6+ 1688*z3*z4*z5*z6+ 3445*z2^2- 1003*z2*z3+
    3445*z3^2- 4448*z2*z4- 4448*z3*z4- 4448*z2*z5- 4448*z3*z5+ 2971*z4*z5-
    4448*z2*z6- 4448*z3*z6+ 2971*z4*z6+ 2971*z5*z6- 2092, 2*z2^12- 4*z2^11*z3-
    2*z2^11*z4+ 2*z2^10*z3*z4- 2*z2^10*z4^2+ 2*z2^9*z3*z4^2- 2*z2^9*z4^3+
    2*z2^8*z3*z4^3- 2*z2^8*z4^4+ 2*z2^7*z3*z4^4- 2*z2^7*z4^5+ 2*z2^6*z3*z4^5-
    2*z2^6*z4^6+ 2*z2^5*z3*z4^6- 2*z2^5*z4^7+ 2*z2^4*z3*z4^7- 2*z2^4*z4^8+
    2*z2^3*z3*z4^8- 2*z2^3*z4^9+ 2*z2^2*z3*z4^9- 2*z2^2*z4^10+ 2*z2*z3*z4^10-
    2*z2*z4^11- 4*z3*z4^11+ 2*z4^12- 4*z2^11*z5+ 6*z2^10*z3*z5+ 2*z2^10*z4*z5-
    2*z2^9*z3*z4*z5+ 2*z2^9*z4^2*z5- 2*z2^8*z3*z4^2*z5+ 2*z2^8*z4^3*z5-
    2*z2^7*z3*z4^3*z5+ 2*z2^7*z4^4*z5- 2*z2^6*z3*z4^4*z5+ 2*z2^6*z4^5*z5-
    2*z2^5*z3*z4^5*z5+ 2*z2^5*z4^6*z5- 2*z2^4*z3*z4^6*z5+ 2*z2^4*z4^7*z5-
    2*z2^3*z3*z4^7*z5+ 2*z2^3*z4^8*z5- 2*z2^2*z3*z4^8*z5+ 2*z2^2*z4^9*z5-
    2*z2*z3*z4^9*z5+ 2*z2*z4^10*z5+ 6*z3*z4^10*z5- 4*z4^11*z5- 4*z2^11*z6+
    6*z2^10*z3*z6+ 2*z2^10*z4*z6- 2*z2^9*z3*z4*z6+ 2*z2^9*z4^2*z6-
    2*z2^8*z3*z4^2*z6+ 2*z2^8*z4^3*z6- 2*z2^7*z3*z4^3*z6+ 2*z2^7*z4^4*z6-
    2*z2^6*z3*z4^4*z6+ 2*z2^6*z4^5*z6- 2*z2^5*z3*z4^5*z6+ 2*z2^5*z4^6*z6-
    2*z2^4*z3*z4^6*z6+ 2*z2^4*z4^7*z6- 2*z2^3*z3*z4^7*z6+ 2*z2^3*z4^8*z6-
    2*z2^2*z3*z4^8*z6+ 2*z2^2*z4^9*z6- 2*z2*z3*z4^9*z6+ 2*z2*z4^10*z6+
    6*z3*z4^10*z6- 4*z4^11*z6+ 6*z2^10*z5*z6- 8*z2^9*z3*z5*z6- 2*z2^9*z4*z5*z6+
    2*z2^8*z3*z4*z5*z6- 2*z2^8*z4^2*z5*z6+ 2*z2^7*z3*z4^2*z5*z6-
    2*z2^7*z4^3*z5*z6+ 2*z2^6*z3*z4^3*z5*z6- 2*z2^6*z4^4*z5*z6+
    2*z2^5*z3*z4^4*z5*z6- 2*z2^5*z4^5*z5*z6+ 2*z2^4*z3*z4^5*z5*z6-
    2*z2^4*z4^6*z5*z6+ 2*z2^3*z3*z4^6*z5*z6- 2*z2^3*z4^7*z5*z6+
    2*z2^2*z3*z4^7*z5*z6- 2*z2^2*z4^8*z5*z6+ 2*z2*z3*z4^8*z5*z6- 2*z2*z4^9*z5*z6-
    8*z3*z4^9*z5*z6+ 6*z4^10*z5*z6+ 8*z2^10+ 4491*z2^9*z3+ 4499*z2^9*z4+
    4496*z2^8*z3*z4+ 4499*z2^8*z4^2+ 4496*z2^7*z3*z4^2+ 4499*z2^7*z4^3+
    4496*z2^6*z3*z4^3+ 4499*z2^6*z4^4+ 4496*z2^5*z3*z4^4+ 4499*z2^5*z4^5+
    4496*z2^4*z3*z4^5+ 4499*z2^4*z4^6+ 4496*z2^3*z3*z4^6+ 4499*z2^3*z4^7+
    4496*z2^2*z3*z4^7+ 4499*z2^2*z4^8+ 4496*z2*z3*z4^8+ 4499*z2*z4^9+
    4491*z3*z4^9+ 8*z4^10+ 4491*z2^9*z5+ 5*z2^8*z3*z5+ 4496*z2^8*z4*z5-
    4488*z2^7*z3*z4*z5+ 4496*z2^7*z4^2*z5- 4488*z2^6*z3*z4^2*z5+
    4496*z2^6*z4^3*z5- 4488*z2^5*z3*z4^3*z5+ 4496*z2^5*z4^4*z5-
    4488*z2^4*z3*z4^4*z5+ 4496*z2^4*z4^5*z5- 4488*z2^3*z3*z4^5*z5+
    4496*z2^3*z4^6*z5- 4488*z2^2*z3*z4^6*z5+ 4496*z2^2*z4^7*z5-
    4488*z2*z3*z4^7*z5+ 4496*z2*z4^8*z5+ 5*z3*z4^8*z5+ 4491*z4^9*z5+ 4491*z2^9*z6+
    5*z2^8*z3*z6+ 4496*z2^8*z4*z6- 4488*z2^7*z3*z4*z6+ 4496*z2^7*z4^2*z6-
    4488*z2^6*z3*z4^2*z6+ 4496*z2^6*z4^3*z6- 4488*z2^5*z3*z4^3*z6+
    4496*z2^5*z4^4*z6- 4488*z2^4*z3*z4^4*z6+ 4496*z2^4*z4^5*z6-
    4488*z2^3*z3*z4^5*z6+ 4496*z2^3*z4^6*z6- 4488*z2^2*z3*z4^6*z6+
    4496*z2^2*z4^7*z6- 4488*z2*z3*z4^7*z6+ 4496*z2*z4^8*z6+ 5*z3*z4^8*z6+
    4491*z4^9*z6+ 5*z2^8*z5*z6- 4493*z2^7*z3*z5*z6- 4488*z2^7*z4*z5*z6+
    4478*z2^6*z3*z4*z5*z6- 4488*z2^6*z4^2*z5*z6+ 4478*z2^5*z3*z4^2*z5*z6-
    4488*z2^5*z4^3*z5*z6+ 4478*z2^4*z3*z4^3*z5*z6- 4488*z2^4*z4^4*z5*z6+
    4478*z2^3*z3*z4^4*z5*z6- 4488*z2^3*z4^5*z5*z6+ 4478*z2^2*z3*z4^5*z5*z6-
    4488*z2^2*z4^6*z5*z6+ 4478*z2*z3*z4^6*z5*z6- 4488*z2*z4^7*z5*z6-
    4493*z3*z4^7*z5*z6+ 5*z4^8*z5*z6+ 2261*z2^8+ 4496*z2^7*z3- 2244*z2^7*z4+
    2239*z2^6*z3*z4- 2244*z2^6*z4^2+ 2239*z2^5*z3*z4^2- 2244*z2^5*z4^3+
    2239*z2^4*z3*z4^3- 2244*z2^4*z4^4+ 2239*z2^3*z3*z4^4- 2244*z2^3*z4^5+
    2239*z2^2*z3*z4^5- 2244*z2^2*z4^6+ 2239*z2*z3*z4^6- 2244*z2*z4^7+
    4496*z3*z4^7+ 2261*z4^8+ 4496*z2^7*z5- 2257*z2^6*z3*z5+ 2239*z2^6*z4*z5+
    2254*z2^5*z3*z4*z5+ 2239*z2^5*z4^2*z5+ 2254*z2^4*z3*z4^2*z5+
    2239*z2^4*z4^3*z5+ 2254*z2^3*z3*z4^3*z5+ 2239*z2^3*z4^4*z5+
    2254*z2^2*z3*z4^4*z5+ 2239*z2^2*z4^5*z5+ 2254*z2*z3*z4^5*z5+ 2239*z2*z4^6*z5-
    2257*z3*z4^6*z5+ 4496*z4^7*z5+ 4496*z2^7*z6- 2257*z2^6*z3*z6+ 2239*z2^6*z4*z6+
    2254*z2^5*z3*z4*z6+ 2239*z2^5*z4^2*z6+ 2254*z2^4*z3*z4^2*z6+
    2239*z2^4*z4^3*z6+ 2254*z2^3*z3*z4^3*z6+ 2239*z2^3*z4^4*z6+
    2254*z2^2*z3*z4^4*z6+ 2239*z2^2*z4^5*z6+ 2254*z2*z3*z4^5*z6+ 2239*z2*z4^6*z6-
    2257*z3*z4^6*z6+ 4496*z4^7*z6- 2257*z2^6*z5*z6- 4490*z2^5*z3*z5*z6+
    2254*z2^5*z4*z5*z6- 2224*z2^4*z3*z4*z5*z6+ 2254*z2^4*z4^2*z5*z6-
    2224*z2^3*z3*z4^2*z5*z6+ 2254*z2^3*z4^3*z5*z6- 2224*z2^2*z3*z4^3*z5*z6+
    2254*z2^2*z4^4*z5*z6- 2224*z2*z3*z4^4*z5*z6+ 2254*z2*z4^5*z5*z6-
    4490*z3*z4^5*z5*z6- 2257*z4^6*z5*z6+ 1130*z2^6+ 2816*z2^5*z3+ 3946*z2^5*z4-
    1689*z2^4*z3*z4+ 3946*z2^4*z4^2- 1689*z2^3*z3*z4^2+ 3946*z2^3*z4^3-
    1689*z2^2*z3*z4^3+ 3946*z2^2*z4^4- 1689*z2*z3*z4^4+ 3946*z2*z4^5+
    2816*z3*z4^5+ 1130*z4^6+ 2816*z2^5*z5+ 4496*z2^4*z3*z5- 1689*z2^4*z4*z5-
    2822*z2^3*z3*z4*z5- 1689*z2^3*z4^2*z5- 2822*z2^2*z3*z4^2*z5-
    1689*z2^2*z4^3*z5- 2822*z2*z3*z4^3*z5- 1689*z2*z4^4*z5+ 4496*z3*z4^4*z5+
    2816*z4^5*z5+ 2816*z2^5*z6+ 4496*z2^4*z3*z6- 1689*z2^4*z4*z6-
    2822*z2^3*z3*z4*z6- 1689*z2^3*z4^2*z6- 2822*z2^2*z3*z4^2*z6-
    1689*z2^2*z4^3*z6- 2822*z2*z3*z4^3*z6- 1689*z2*z4^4*z6+ 4496*z3*z4^4*z6+
    2816*z4^5*z6+ 4496*z2^4*z5*z6+ 1683*z2^3*z3*z5*z6- 2822*z2^3*z4*z5*z6+
    556*z2^2*z3*z4*z5*z6- 2822*z2^2*z4^2*z5*z6+ 556*z2*z3*z4^2*z5*z6-
    2822*z2*z4^3*z5*z6+ 1683*z3*z4^3*z5*z6+ 4496*z4^4*z5*z6+ 3867*z2^4+
    1549*z2^3*z3- 3585*z2^3*z4- 911*z2^2*z3*z4- 3585*z2^2*z4^2- 911*z2*z3*z4^2-
    3585*z2*z4^3+ 1549*z3*z4^3+ 3867*z4^4+ 1549*z2^3*z5- 2460*z2^2*z3*z5-
    911*z2^2*z4*z5- 772*z2*z3*z4*z5- 911*z2*z4^2*z5- 2460*z3*z4^2*z5+
    1549*z4^3*z5+ 1549*z2^3*z6- 2460*z2^2*z3*z6- 911*z2^2*z4*z6- 772*z2*z3*z4*z6-
    911*z2*z4^2*z6- 2460*z3*z4^2*z6+ 1549*z4^3*z6- 2460*z2^2*z5*z6+
    1688*z2*z3*z5*z6- 772*z2*z4*z5*z6+ 1688*z3*z4*z5*z6- 2460*z4^2*z5*z6+
    3445*z2^2- 4448*z2*z3- 1003*z2*z4- 4448*z3*z4+ 3445*z4^2- 4448*z2*z5+
    2971*z3*z5- 4448*z4*z5- 4448*z2*z6+ 2971*z3*z6- 4448*z4*z6+ 2971*z5*z6- 2092,
    2*z2^12- 4*z2^11*z3- 4*z2^11*z4+ 6*z2^10*z3*z4- 2*z2^11*z5+ 2*z2^10*z3*z5+
    2*z2^10*z4*z5- 2*z2^9*z3*z4*z5- 2*z2^10*z5^2+ 2*z2^9*z3*z5^2+ 2*z2^9*z4*z5^2-
    2*z2^8*z3*z4*z5^2- 2*z2^9*z5^3+ 2*z2^8*z3*z5^3+ 2*z2^8*z4*z5^3-
    2*z2^7*z3*z4*z5^3- 2*z2^8*z5^4+ 2*z2^7*z3*z5^4+ 2*z2^7*z4*z5^4-
    2*z2^6*z3*z4*z5^4- 2*z2^7*z5^5+ 2*z2^6*z3*z5^5+ 2*z2^6*z4*z5^5-
    2*z2^5*z3*z4*z5^5- 2*z2^6*z5^6+ 2*z2^5*z3*z5^6+ 2*z2^5*z4*z5^6-
    2*z2^4*z3*z4*z5^6- 2*z2^5*z5^7+ 2*z2^4*z3*z5^7+ 2*z2^4*z4*z5^7-
    2*z2^3*z3*z4*z5^7- 2*z2^4*z5^8+ 2*z2^3*z3*z5^8+ 2*z2^3*z4*z5^8-
    2*z2^2*z3*z4*z5^8- 2*z2^3*z5^9+ 2*z2^2*z3*z5^9+ 2*z2^2*z4*z5^9-
    2*z2*z3*z4*z5^9- 2*z2^2*z5^10+ 2*z2*z3*z5^10+ 2*z2*z4*z5^10+ 6*z3*z4*z5^10-
    2*z2*z5^11- 4*z3*z5^11- 4*z4*z5^11+ 2*z5^12- 4*z2^11*z6+ 6*z2^10*z3*z6+
    6*z2^10*z4*z6- 8*z2^9*z3*z4*z6+ 2*z2^10*z5*z6- 2*z2^9*z3*z5*z6-
    2*z2^9*z4*z5*z6+ 2*z2^8*z3*z4*z5*z6+ 2*z2^9*z5^2*z6- 2*z2^8*z3*z5^2*z6-
    2*z2^8*z4*z5^2*z6+ 2*z2^7*z3*z4*z5^2*z6+ 2*z2^8*z5^3*z6- 2*z2^7*z3*z5^3*z6-
    2*z2^7*z4*z5^3*z6+ 2*z2^6*z3*z4*z5^3*z6+ 2*z2^7*z5^4*z6- 2*z2^6*z3*z5^4*z6-
    2*z2^6*z4*z5^4*z6+ 2*z2^5*z3*z4*z5^4*z6+ 2*z2^6*z5^5*z6- 2*z2^5*z3*z5^5*z6-
    2*z2^5*z4*z5^5*z6+ 2*z2^4*z3*z4*z5^5*z6+ 2*z2^5*z5^6*z6- 2*z2^4*z3*z5^6*z6-
    2*z2^4*z4*z5^6*z6+ 2*z2^3*z3*z4*z5^6*z6+ 2*z2^4*z5^7*z6- 2*z2^3*z3*z5^7*z6-
    2*z2^3*z4*z5^7*z6+ 2*z2^2*z3*z4*z5^7*z6+ 2*z2^3*z5^8*z6- 2*z2^2*z3*z5^8*z6-
    2*z2^2*z4*z5^8*z6+ 2*z2*z3*z4*z5^8*z6+ 2*z2^2*z5^9*z6- 2*z2*z3*z5^9*z6-
    2*z2*z4*z5^9*z6- 8*z3*z4*z5^9*z6+ 2*z2*z5^10*z6+ 6*z3*z5^10*z6+ 6*z4*z5^10*z6-
    4*z5^11*z6+ 8*z2^10+ 4491*z2^9*z3+ 4491*z2^9*z4+ 5*z2^8*z3*z4+ 4499*z2^9*z5+
    4496*z2^8*z3*z5+ 4496*z2^8*z4*z5- 4488*z2^7*z3*z4*z5+ 4499*z2^8*z5^2+
    4496*z2^7*z3*z5^2+ 4496*z2^7*z4*z5^2- 4488*z2^6*z3*z4*z5^2+ 4499*z2^7*z5^3+
    4496*z2^6*z3*z5^3+ 4496*z2^6*z4*z5^3- 4488*z2^5*z3*z4*z5^3+ 4499*z2^6*z5^4+
    4496*z2^5*z3*z5^4+ 4496*z2^5*z4*z5^4- 4488*z2^4*z3*z4*z5^4+ 4499*z2^5*z5^5+
    4496*z2^4*z3*z5^5+ 4496*z2^4*z4*z5^5- 4488*z2^3*z3*z4*z5^5+ 4499*z2^4*z5^6+
    4496*z2^3*z3*z5^6+ 4496*z2^3*z4*z5^6- 4488*z2^2*z3*z4*z5^6+ 4499*z2^3*z5^7+
    4496*z2^2*z3*z5^7+ 4496*z2^2*z4*z5^7- 4488*z2*z3*z4*z5^7+ 4499*z2^2*z5^8+
    4496*z2*z3*z5^8+ 4496*z2*z4*z5^8+ 5*z3*z4*z5^8+ 4499*z2*z5^9+ 4491*z3*z5^9+
    4491*z4*z5^9+ 8*z5^10+ 4491*z2^9*z6+ 5*z2^8*z3*z6+ 5*z2^8*z4*z6-
    4493*z2^7*z3*z4*z6+ 4496*z2^8*z5*z6- 4488*z2^7*z3*z5*z6- 4488*z2^7*z4*z5*z6+
    4478*z2^6*z3*z4*z5*z6+ 4496*z2^7*z5^2*z6- 4488*z2^6*z3*z5^2*z6-
    4488*z2^6*z4*z5^2*z6+ 4478*z2^5*z3*z4*z5^2*z6+ 4496*z2^6*z5^3*z6-
    4488*z2^5*z3*z5^3*z6- 4488*z2^5*z4*z5^3*z6+ 4478*z2^4*z3*z4*z5^3*z6+
    4496*z2^5*z5^4*z6- 4488*z2^4*z3*z5^4*z6- 4488*z2^4*z4*z5^4*z6+
    4478*z2^3*z3*z4*z5^4*z6+ 4496*z2^4*z5^5*z6- 4488*z2^3*z3*z5^5*z6-
    4488*z2^3*z4*z5^5*z6+ 4478*z2^2*z3*z4*z5^5*z6+ 4496*z2^3*z5^6*z6-
    4488*z2^2*z3*z5^6*z6- 4488*z2^2*z4*z5^6*z6+ 4478*z2*z3*z4*z5^6*z6+
    4496*z2^2*z5^7*z6- 4488*z2*z3*z5^7*z6- 4488*z2*z4*z5^7*z6- 4493*z3*z4*z5^7*z6+
    4496*z2*z5^8*z6+ 5*z3*z5^8*z6+ 5*z4*z5^8*z6+ 4491*z5^9*z6+ 2261*z2^8+
    4496*z2^7*z3+ 4496*z2^7*z4- 2257*z2^6*z3*z4- 2244*z2^7*z5+ 2239*z2^6*z3*z5+
    2239*z2^6*z4*z5+ 2254*z2^5*z3*z4*z5- 2244*z2^6*z5^2+ 2239*z2^5*z3*z5^2+
    2239*z2^5*z4*z5^2+ 2254*z2^4*z3*z4*z5^2- 2244*z2^5*z5^3+ 2239*z2^4*z3*z5^3+
    2239*z2^4*z4*z5^3+ 2254*z2^3*z3*z4*z5^3- 2244*z2^4*z5^4+ 2239*z2^3*z3*z5^4+
    2239*z2^3*z4*z5^4+ 2254*z2^2*z3*z4*z5^4- 2244*z2^3*z5^5+ 2239*z2^2*z3*z5^5+
    2239*z2^2*z4*z5^5+ 2254*z2*z3*z4*z5^5- 2244*z2^2*z5^6+ 2239*z2*z3*z5^6+
    2239*z2*z4*z5^6- 2257*z3*z4*z5^6- 2244*z2*z5^7+ 4496*z3*z5^7+ 4496*z4*z5^7+
    2261*z5^8+ 4496*z2^7*z6- 2257*z2^6*z3*z6- 2257*z2^6*z4*z6- 4490*z2^5*z3*z4*z6+
    2239*z2^6*z5*z6+ 2254*z2^5*z3*z5*z6+ 2254*z2^5*z4*z5*z6-
    2224*z2^4*z3*z4*z5*z6+ 2239*z2^5*z5^2*z6+ 2254*z2^4*z3*z5^2*z6+
    2254*z2^4*z4*z5^2*z6- 2224*z2^3*z3*z4*z5^2*z6+ 2239*z2^4*z5^3*z6+
    2254*z2^3*z3*z5^3*z6+ 2254*z2^3*z4*z5^3*z6- 2224*z2^2*z3*z4*z5^3*z6+
    2239*z2^3*z5^4*z6+ 2254*z2^2*z3*z5^4*z6+ 2254*z2^2*z4*z5^4*z6-
    2224*z2*z3*z4*z5^4*z6+ 2239*z2^2*z5^5*z6+ 2254*z2*z3*z5^5*z6+
    2254*z2*z4*z5^5*z6- 4490*z3*z4*z5^5*z6+ 2239*z2*z5^6*z6- 2257*z3*z5^6*z6-
    2257*z4*z5^6*z6+ 4496*z5^7*z6+ 1130*z2^6+ 2816*z2^5*z3+ 2816*z2^5*z4+
    4496*z2^4*z3*z4+ 3946*z2^5*z5- 1689*z2^4*z3*z5- 1689*z2^4*z4*z5-
    2822*z2^3*z3*z4*z5+ 3946*z2^4*z5^2- 1689*z2^3*z3*z5^2- 1689*z2^3*z4*z5^2-
    2822*z2^2*z3*z4*z5^2+ 3946*z2^3*z5^3- 1689*z2^2*z3*z5^3- 1689*z2^2*z4*z5^3-
    2822*z2*z3*z4*z5^3+ 3946*z2^2*z5^4- 1689*z2*z3*z5^4- 1689*z2*z4*z5^4+
    4496*z3*z4*z5^4+ 3946*z2*z5^5+ 2816*z3*z5^5+ 2816*z4*z5^5+ 1130*z5^6+
    2816*z2^5*z6+ 4496*z2^4*z3*z6+ 4496*z2^4*z4*z6+ 1683*z2^3*z3*z4*z6-
    1689*z2^4*z5*z6- 2822*z2^3*z3*z5*z6- 2822*z2^3*z4*z5*z6+ 556*z2^2*z3*z4*z5*z6-
    1689*z2^3*z5^2*z6- 2822*z2^2*z3*z5^2*z6- 2822*z2^2*z4*z5^2*z6+
    556*z2*z3*z4*z5^2*z6- 1689*z2^2*z5^3*z6- 2822*z2*z3*z5^3*z6-
    2822*z2*z4*z5^3*z6+ 1683*z3*z4*z5^3*z6- 1689*z2*z5^4*z6+ 4496*z3*z5^4*z6+
    4496*z4*z5^4*z6+ 2816*z5^5*z6+ 3867*z2^4+ 1549*z2^3*z3+ 1549*z2^3*z4-
    2460*z2^2*z3*z4- 3585*z2^3*z5- 911*z2^2*z3*z5- 911*z2^2*z4*z5-
    772*z2*z3*z4*z5- 3585*z2^2*z5^2- 911*z2*z3*z5^2- 911*z2*z4*z5^2-
    2460*z3*z4*z5^2- 3585*z2*z5^3+ 1549*z3*z5^3+ 1549*z4*z5^3+ 3867*z5^4+
    1549*z2^3*z6- 2460*z2^2*z3*z6- 2460*z2^2*z4*z6+ 1688*z2*z3*z4*z6-
    911*z2^2*z5*z6- 772*z2*z3*z5*z6- 772*z2*z4*z5*z6+ 1688*z3*z4*z5*z6-
    911*z2*z5^2*z6- 2460*z3*z5^2*z6- 2460*z4*z5^2*z6+ 1549*z5^3*z6+ 3445*z2^2-
    4448*z2*z3- 4448*z2*z4+ 2971*z3*z4- 1003*z2*z5- 4448*z3*z5- 4448*z4*z5+
    3445*z5^2- 4448*z2*z6+ 2971*z3*z6+ 2971*z4*z6- 4448*z5*z6- 2092, 2*z2^12-
    4*z2^11*z3- 4*z2^11*z4+ 6*z2^10*z3*z4- 4*z2^11*z5+ 6*z2^10*z3*z5+
    6*z2^10*z4*z5- 8*z2^9*z3*z4*z5- 2*z2^11*z6+ 2*z2^10*z3*z6+ 2*z2^10*z4*z6-
    2*z2^9*z3*z4*z6+ 2*z2^10*z5*z6- 2*z2^9*z3*z5*z6- 2*z2^9*z4*z5*z6+
    2*z2^8*z3*z4*z5*z6- 2*z2^10*z6^2+ 2*z2^9*z3*z6^2+ 2*z2^9*z4*z6^2-
    2*z2^8*z3*z4*z6^2+ 2*z2^9*z5*z6^2- 2*z2^8*z3*z5*z6^2- 2*z2^8*z4*z5*z6^2+
    2*z2^7*z3*z4*z5*z6^2- 2*z2^9*z6^3+ 2*z2^8*z3*z6^3+ 2*z2^8*z4*z6^3-
    2*z2^7*z3*z4*z6^3+ 2*z2^8*z5*z6^3- 2*z2^7*z3*z5*z6^3- 2*z2^7*z4*z5*z6^3+
    2*z2^6*z3*z4*z5*z6^3- 2*z2^8*z6^4+ 2*z2^7*z3*z6^4+ 2*z2^7*z4*z6^4-
    2*z2^6*z3*z4*z6^4+ 2*z2^7*z5*z6^4- 2*z2^6*z3*z5*z6^4- 2*z2^6*z4*z5*z6^4+
    2*z2^5*z3*z4*z5*z6^4- 2*z2^7*z6^5+ 2*z2^6*z3*z6^5+ 2*z2^6*z4*z6^5-
    2*z2^5*z3*z4*z6^5+ 2*z2^6*z5*z6^5- 2*z2^5*z3*z5*z6^5- 2*z2^5*z4*z5*z6^5+
    2*z2^4*z3*z4*z5*z6^5- 2*z2^6*z6^6+ 2*z2^5*z3*z6^6+ 2*z2^5*z4*z6^6-
    2*z2^4*z3*z4*z6^6+ 2*z2^5*z5*z6^6- 2*z2^4*z3*z5*z6^6- 2*z2^4*z4*z5*z6^6+
    2*z2^3*z3*z4*z5*z6^6- 2*z2^5*z6^7+ 2*z2^4*z3*z6^7+ 2*z2^4*z4*z6^7-
    2*z2^3*z3*z4*z6^7+ 2*z2^4*z5*z6^7- 2*z2^3*z3*z5*z6^7- 2*z2^3*z4*z5*z6^7+
    2*z2^2*z3*z4*z5*z6^7- 2*z2^4*z6^8+ 2*z2^3*z3*z6^8+ 2*z2^3*z4*z6^8-
    2*z2^2*z3*z4*z6^8+ 2*z2^3*z5*z6^8- 2*z2^2*z3*z5*z6^8- 2*z2^2*z4*z5*z6^8+
    2*z2*z3*z4*z5*z6^8- 2*z2^3*z6^9+ 2*z2^2*z3*z6^9+ 2*z2^2*z4*z6^9-
    2*z2*z3*z4*z6^9+ 2*z2^2*z5*z6^9- 2*z2*z3*z5*z6^9- 2*z2*z4*z5*z6^9-
    8*z3*z4*z5*z6^9- 2*z2^2*z6^10+ 2*z2*z3*z6^10+ 2*z2*z4*z6^10+ 6*z3*z4*z6^10+
    2*z2*z5*z6^10+ 6*z3*z5*z6^10+ 6*z4*z5*z6^10- 2*z2*z6^11- 4*z3*z6^11-
    4*z4*z6^11- 4*z5*z6^11+ 2*z6^12+ 8*z2^10+ 4491*z2^9*z3+ 4491*z2^9*z4+
    5*z2^8*z3*z4+ 4491*z2^9*z5+ 5*z2^8*z3*z5+ 5*z2^8*z4*z5- 4493*z2^7*z3*z4*z5+
    4499*z2^9*z6+ 4496*z2^8*z3*z6+ 4496*z2^8*z4*z6- 4488*z2^7*z3*z4*z6+
    4496*z2^8*z5*z6- 4488*z2^7*z3*z5*z6- 4488*z2^7*z4*z5*z6+
    4478*z2^6*z3*z4*z5*z6+ 4499*z2^8*z6^2+ 4496*z2^7*z3*z6^2+ 4496*z2^7*z4*z6^2-
    4488*z2^6*z3*z4*z6^2+ 4496*z2^7*z5*z6^2- 4488*z2^6*z3*z5*z6^2-
    4488*z2^6*z4*z5*z6^2+ 4478*z2^5*z3*z4*z5*z6^2+ 4499*z2^7*z6^3+
    4496*z2^6*z3*z6^3+ 4496*z2^6*z4*z6^3- 4488*z2^5*z3*z4*z6^3+ 4496*z2^6*z5*z6^3-
    4488*z2^5*z3*z5*z6^3- 4488*z2^5*z4*z5*z6^3+ 4478*z2^4*z3*z4*z5*z6^3+
    4499*z2^6*z6^4+ 4496*z2^5*z3*z6^4+ 4496*z2^5*z4*z6^4- 4488*z2^4*z3*z4*z6^4+
    4496*z2^5*z5*z6^4- 4488*z2^4*z3*z5*z6^4- 4488*z2^4*z4*z5*z6^4+
    4478*z2^3*z3*z4*z5*z6^4+ 4499*z2^5*z6^5+ 4496*z2^4*z3*z6^5+ 4496*z2^4*z4*z6^5-
    4488*z2^3*z3*z4*z6^5+ 4496*z2^4*z5*z6^5- 4488*z2^3*z3*z5*z6^5-
    4488*z2^3*z4*z5*z6^5+ 4478*z2^2*z3*z4*z5*z6^5+ 4499*z2^4*z6^6+
    4496*z2^3*z3*z6^6+ 4496*z2^3*z4*z6^6- 4488*z2^2*z3*z4*z6^6+ 4496*z2^3*z5*z6^6-
    4488*z2^2*z3*z5*z6^6- 4488*z2^2*z4*z5*z6^6+ 4478*z2*z3*z4*z5*z6^6+
    4499*z2^3*z6^7+ 4496*z2^2*z3*z6^7+ 4496*z2^2*z4*z6^7- 4488*z2*z3*z4*z6^7+
    4496*z2^2*z5*z6^7- 4488*z2*z3*z5*z6^7- 4488*z2*z4*z5*z6^7- 4493*z3*z4*z5*z6^7+
    4499*z2^2*z6^8+ 4496*z2*z3*z6^8+ 4496*z2*z4*z6^8+ 5*z3*z4*z6^8+
    4496*z2*z5*z6^8+ 5*z3*z5*z6^8+ 5*z4*z5*z6^8+ 4499*z2*z6^9+ 4491*z3*z6^9+
    4491*z4*z6^9+ 4491*z5*z6^9+ 8*z6^10+ 2261*z2^8+ 4496*z2^7*z3+ 4496*z2^7*z4-
    2257*z2^6*z3*z4+ 4496*z2^7*z5- 2257*z2^6*z3*z5- 2257*z2^6*z4*z5-
    4490*z2^5*z3*z4*z5- 2244*z2^7*z6+ 2239*z2^6*z3*z6+ 2239*z2^6*z4*z6+
    2254*z2^5*z3*z4*z6+ 2239*z2^6*z5*z6+ 2254*z2^5*z3*z5*z6+ 2254*z2^5*z4*z5*z6-
    2224*z2^4*z3*z4*z5*z6- 2244*z2^6*z6^2+ 2239*z2^5*z3*z6^2+ 2239*z2^5*z4*z6^2+
    2254*z2^4*z3*z4*z6^2+ 2239*z2^5*z5*z6^2+ 2254*z2^4*z3*z5*z6^2+
    2254*z2^4*z4*z5*z6^2- 2224*z2^3*z3*z4*z5*z6^2- 2244*z2^5*z6^3+
    2239*z2^4*z3*z6^3+ 2239*z2^4*z4*z6^3+ 2254*z2^3*z3*z4*z6^3+ 2239*z2^4*z5*z6^3+
    2254*z2^3*z3*z5*z6^3+ 2254*z2^3*z4*z5*z6^3- 2224*z2^2*z3*z4*z5*z6^3-
    2244*z2^4*z6^4+ 2239*z2^3*z3*z6^4+ 2239*z2^3*z4*z6^4+ 2254*z2^2*z3*z4*z6^4+
    2239*z2^3*z5*z6^4+ 2254*z2^2*z3*z5*z6^4+ 2254*z2^2*z4*z5*z6^4-
    2224*z2*z3*z4*z5*z6^4- 2244*z2^3*z6^5+ 2239*z2^2*z3*z6^5+ 2239*z2^2*z4*z6^5+
    2254*z2*z3*z4*z6^5+ 2239*z2^2*z5*z6^5+ 2254*z2*z3*z5*z6^5+ 2254*z2*z4*z5*z6^5-
    4490*z3*z4*z5*z6^5- 2244*z2^2*z6^6+ 2239*z2*z3*z6^6+ 2239*z2*z4*z6^6-
    2257*z3*z4*z6^6+ 2239*z2*z5*z6^6- 2257*z3*z5*z6^6- 2257*z4*z5*z6^6-
    2244*z2*z6^7+ 4496*z3*z6^7+ 4496*z4*z6^7+ 4496*z5*z6^7+ 2261*z6^8+ 1130*z2^6+
    2816*z2^5*z3+ 2816*z2^5*z4+ 4496*z2^4*z3*z4+ 2816*z2^5*z5+ 4496*z2^4*z3*z5+
    4496*z2^4*z4*z5+ 1683*z2^3*z3*z4*z5+ 3946*z2^5*z6- 1689*z2^4*z3*z6-
    1689*z2^4*z4*z6- 2822*z2^3*z3*z4*z6- 1689*z2^4*z5*z6- 2822*z2^3*z3*z5*z6-
    2822*z2^3*z4*z5*z6+ 556*z2^2*z3*z4*z5*z6+ 3946*z2^4*z6^2- 1689*z2^3*z3*z6^2-
    1689*z2^3*z4*z6^2- 2822*z2^2*z3*z4*z6^2- 1689*z2^3*z5*z6^2-
    2822*z2^2*z3*z5*z6^2- 2822*z2^2*z4*z5*z6^2+ 556*z2*z3*z4*z5*z6^2+
    3946*z2^3*z6^3- 1689*z2^2*z3*z6^3- 1689*z2^2*z4*z6^3- 2822*z2*z3*z4*z6^3-
    1689*z2^2*z5*z6^3- 2822*z2*z3*z5*z6^3- 2822*z2*z4*z5*z6^3+ 1683*z3*z4*z5*z6^3+
    3946*z2^2*z6^4- 1689*z2*z3*z6^4- 1689*z2*z4*z6^4+ 4496*z3*z4*z6^4-
    1689*z2*z5*z6^4+ 4496*z3*z5*z6^4+ 4496*z4*z5*z6^4+ 3946*z2*z6^5+ 2816*z3*z6^5+
    2816*z4*z6^5+ 2816*z5*z6^5+ 1130*z6^6+ 3867*z2^4+ 1549*z2^3*z3+ 1549*z2^3*z4-
    2460*z2^2*z3*z4+ 1549*z2^3*z5- 2460*z2^2*z3*z5- 2460*z2^2*z4*z5+
    1688*z2*z3*z4*z5- 3585*z2^3*z6- 911*z2^2*z3*z6- 911*z2^2*z4*z6-
    772*z2*z3*z4*z6- 911*z2^2*z5*z6- 772*z2*z3*z5*z6- 772*z2*z4*z5*z6+
    1688*z3*z4*z5*z6- 3585*z2^2*z6^2- 911*z2*z3*z6^2- 911*z2*z4*z6^2-
    2460*z3*z4*z6^2- 911*z2*z5*z6^2- 2460*z3*z5*z6^2- 2460*z4*z5*z6^2-
    3585*z2*z6^3+ 1549*z3*z6^3+ 1549*z4*z6^3+ 1549*z5*z6^3+ 3867*z6^4+ 3445*z2^2-
    4448*z2*z3- 4448*z2*z4+ 2971*z3*z4- 4448*z2*z5+ 2971*z3*z5+ 2971*z4*z5-
    1003*z2*z6- 4448*z3*z6- 4448*z4*z6- 4448*z5*z6+ 3445*z6^2- 2092, - 4*z2*z3^11+
    2*z3^12+ 2*z2*z3^10*z4- 2*z3^11*z4+ 2*z2*z3^9*z4^2- 2*z3^10*z4^2+
    2*z2*z3^8*z4^3- 2*z3^9*z4^3+ 2*z2*z3^7*z4^4- 2*z3^8*z4^4+ 2*z2*z3^6*z4^5-
    2*z3^7*z4^5+ 2*z2*z3^5*z4^6- 2*z3^6*z4^6+ 2*z2*z3^4*z4^7- 2*z3^5*z4^7+
    2*z2*z3^3*z4^8- 2*z3^4*z4^8+ 2*z2*z3^2*z4^9- 2*z3^3*z4^9+ 2*z2*z3*z4^10-
    2*z3^2*z4^10- 4*z2*z4^11- 2*z3*z4^11+ 2*z4^12+ 6*z2*z3^10*z5- 4*z3^11*z5-
    2*z2*z3^9*z4*z5+ 2*z3^10*z4*z5- 2*z2*z3^8*z4^2*z5+ 2*z3^9*z4^2*z5-
    2*z2*z3^7*z4^3*z5+ 2*z3^8*z4^3*z5- 2*z2*z3^6*z4^4*z5+ 2*z3^7*z4^4*z5-
    2*z2*z3^5*z4^5*z5+ 2*z3^6*z4^5*z5- 2*z2*z3^4*z4^6*z5+ 2*z3^5*z4^6*z5-
    2*z2*z3^3*z4^7*z5+ 2*z3^4*z4^7*z5- 2*z2*z3^2*z4^8*z5+ 2*z3^3*z4^8*z5-
    2*z2*z3*z4^9*z5+ 2*z3^2*z4^9*z5+ 6*z2*z4^10*z5+ 2*z3*z4^10*z5- 4*z4^11*z5+
    6*z2*z3^10*z6- 4*z3^11*z6- 2*z2*z3^9*z4*z6+ 2*z3^10*z4*z6- 2*z2*z3^8*z4^2*z6+
    2*z3^9*z4^2*z6- 2*z2*z3^7*z4^3*z6+ 2*z3^8*z4^3*z6- 2*z2*z3^6*z4^4*z6+
    2*z3^7*z4^4*z6- 2*z2*z3^5*z4^5*z6+ 2*z3^6*z4^5*z6- 2*z2*z3^4*z4^6*z6+
    2*z3^5*z4^6*z6- 2*z2*z3^3*z4^7*z6+ 2*z3^4*z4^7*z6- 2*z2*z3^2*z4^8*z6+
    2*z3^3*z4^8*z6- 2*z2*z3*z4^9*z6+ 2*z3^2*z4^9*z6+ 6*z2*z4^10*z6+ 2*z3*z4^10*z6-
    4*z4^11*z6- 8*z2*z3^9*z5*z6+ 6*z3^10*z5*z6+ 2*z2*z3^8*z4*z5*z6-
    2*z3^9*z4*z5*z6+ 2*z2*z3^7*z4^2*z5*z6- 2*z3^8*z4^2*z5*z6+
    2*z2*z3^6*z4^3*z5*z6- 2*z3^7*z4^3*z5*z6+ 2*z2*z3^5*z4^4*z5*z6-
    2*z3^6*z4^4*z5*z6+ 2*z2*z3^4*z4^5*z5*z6- 2*z3^5*z4^5*z5*z6+
    2*z2*z3^3*z4^6*z5*z6- 2*z3^4*z4^6*z5*z6+ 2*z2*z3^2*z4^7*z5*z6-
    2*z3^3*z4^7*z5*z6+ 2*z2*z3*z4^8*z5*z6- 2*z3^2*z4^8*z5*z6- 8*z2*z4^9*z5*z6-
    2*z3*z4^9*z5*z6+ 6*z4^10*z5*z6+ 4491*z2*z3^9+ 8*z3^10+ 4496*z2*z3^8*z4+
    4499*z3^9*z4+ 4496*z2*z3^7*z4^2+ 4499*z3^8*z4^2+ 4496*z2*z3^6*z4^3+
    4499*z3^7*z4^3+ 4496*z2*z3^5*z4^4+ 4499*z3^6*z4^4+ 4496*z2*z3^4*z4^5+
    4499*z3^5*z4^5+ 4496*z2*z3^3*z4^6+ 4499*z3^4*z4^6+ 4496*z2*z3^2*z4^7+
    4499*z3^3*z4^7+ 4496*z2*z3*z4^8+ 4499*z3^2*z4^8+ 4491*z2*z4^9+ 4499*z3*z4^9+
    8*z4^10+ 5*z2*z3^8*z5+ 4491*z3^9*z5- 4488*z2*z3^7*z4*z5+ 4496*z3^8*z4*z5-
    4488*z2*z3^6*z4^2*z5+ 4496*z3^7*z4^2*z5- 4488*z2*z3^5*z4^3*z5+
    4496*z3^6*z4^3*z5- 4488*z2*z3^4*z4^4*z5+ 4496*z3^5*z4^4*z5-
    4488*z2*z3^3*z4^5*z5+ 4496*z3^4*z4^5*z5- 4488*z2*z3^2*z4^6*z5+
    4496*z3^3*z4^6*z5- 4488*z2*z3*z4^7*z5+ 4496*z3^2*z4^7*z5+ 5*z2*z4^8*z5+
    4496*z3*z4^8*z5+ 4491*z4^9*z5+ 5*z2*z3^8*z6+ 4491*z3^9*z6- 4488*z2*z3^7*z4*z6+
    4496*z3^8*z4*z6- 4488*z2*z3^6*z4^2*z6+ 4496*z3^7*z4^2*z6-
    4488*z2*z3^5*z4^3*z6+ 4496*z3^6*z4^3*z6- 4488*z2*z3^4*z4^4*z6+
    4496*z3^5*z4^4*z6- 4488*z2*z3^3*z4^5*z6+ 4496*z3^4*z4^5*z6-
    4488*z2*z3^2*z4^6*z6+ 4496*z3^3*z4^6*z6- 4488*z2*z3*z4^7*z6+
    4496*z3^2*z4^7*z6+ 5*z2*z4^8*z6+ 4496*z3*z4^8*z6+ 4491*z4^9*z6-
    4493*z2*z3^7*z5*z6+ 5*z3^8*z5*z6+ 4478*z2*z3^6*z4*z5*z6- 4488*z3^7*z4*z5*z6+
    4478*z2*z3^5*z4^2*z5*z6- 4488*z3^6*z4^2*z5*z6+ 4478*z2*z3^4*z4^3*z5*z6-
    4488*z3^5*z4^3*z5*z6+ 4478*z2*z3^3*z4^4*z5*z6- 4488*z3^4*z4^4*z5*z6+
    4478*z2*z3^2*z4^5*z5*z6- 4488*z3^3*z4^5*z5*z6+ 4478*z2*z3*z4^6*z5*z6-
    4488*z3^2*z4^6*z5*z6- 4493*z2*z4^7*z5*z6- 4488*z3*z4^7*z5*z6+ 5*z4^8*z5*z6+
    4496*z2*z3^7+ 2261*z3^8+ 2239*z2*z3^6*z4- 2244*z3^7*z4+ 2239*z2*z3^5*z4^2-
    2244*z3^6*z4^2+ 2239*z2*z3^4*z4^3- 2244*z3^5*z4^3+ 2239*z2*z3^3*z4^4-
    2244*z3^4*z4^4+ 2239*z2*z3^2*z4^5- 2244*z3^3*z4^5+ 2239*z2*z3*z4^6-
    2244*z3^2*z4^6+ 4496*z2*z4^7- 2244*z3*z4^7+ 2261*z4^8- 2257*z2*z3^6*z5+
    4496*z3^7*z5+ 2254*z2*z3^5*z4*z5+ 2239*z3^6*z4*z5+ 2254*z2*z3^4*z4^2*z5+
    2239*z3^5*z4^2*z5+ 2254*z2*z3^3*z4^3*z5+ 2239*z3^4*z4^3*z5+
    2254*z2*z3^2*z4^4*z5+ 2239*z3^3*z4^4*z5+ 2254*z2*z3*z4^5*z5+
    2239*z3^2*z4^5*z5- 2257*z2*z4^6*z5+ 2239*z3*z4^6*z5+ 4496*z4^7*z5-
    2257*z2*z3^6*z6+ 4496*z3^7*z6+ 2254*z2*z3^5*z4*z6+ 2239*z3^6*z4*z6+
    2254*z2*z3^4*z4^2*z6+ 2239*z3^5*z4^2*z6+ 2254*z2*z3^3*z4^3*z6+
    2239*z3^4*z4^3*z6+ 2254*z2*z3^2*z4^4*z6+ 2239*z3^3*z4^4*z6+
    2254*z2*z3*z4^5*z6+ 2239*z3^2*z4^5*z6- 2257*z2*z4^6*z6+ 2239*z3*z4^6*z6+
    4496*z4^7*z6- 4490*z2*z3^5*z5*z6- 2257*z3^6*z5*z6- 2224*z2*z3^4*z4*z5*z6+
    2254*z3^5*z4*z5*z6- 2224*z2*z3^3*z4^2*z5*z6+ 2254*z3^4*z4^2*z5*z6-
    2224*z2*z3^2*z4^3*z5*z6+ 2254*z3^3*z4^3*z5*z6- 2224*z2*z3*z4^4*z5*z6+
    2254*z3^2*z4^4*z5*z6- 4490*z2*z4^5*z5*z6+ 2254*z3*z4^5*z5*z6- 2257*z4^6*z5*z6+
    2816*z2*z3^5+ 1130*z3^6- 1689*z2*z3^4*z4+ 3946*z3^5*z4- 1689*z2*z3^3*z4^2+
    3946*z3^4*z4^2- 1689*z2*z3^2*z4^3+ 3946*z3^3*z4^3- 1689*z2*z3*z4^4+
    3946*z3^2*z4^4+ 2816*z2*z4^5+ 3946*z3*z4^5+ 1130*z4^6+ 4496*z2*z3^4*z5+
    2816*z3^5*z5- 2822*z2*z3^3*z4*z5- 1689*z3^4*z4*z5- 2822*z2*z3^2*z4^2*z5-
    1689*z3^3*z4^2*z5- 2822*z2*z3*z4^3*z5- 1689*z3^2*z4^3*z5+ 4496*z2*z4^4*z5-
    1689*z3*z4^4*z5+ 2816*z4^5*z5+ 4496*z2*z3^4*z6+ 2816*z3^5*z6-
    2822*z2*z3^3*z4*z6- 1689*z3^4*z4*z6- 2822*z2*z3^2*z4^2*z6- 1689*z3^3*z4^2*z6-
    2822*z2*z3*z4^3*z6- 1689*z3^2*z4^3*z6+ 4496*z2*z4^4*z6- 1689*z3*z4^4*z6+
    2816*z4^5*z6+ 1683*z2*z3^3*z5*z6+ 4496*z3^4*z5*z6+ 556*z2*z3^2*z4*z5*z6-
    2822*z3^3*z4*z5*z6+ 556*z2*z3*z4^2*z5*z6- 2822*z3^2*z4^2*z5*z6+
    1683*z2*z4^3*z5*z6- 2822*z3*z4^3*z5*z6+ 4496*z4^4*z5*z6+ 1549*z2*z3^3+
    3867*z3^4- 911*z2*z3^2*z4- 3585*z3^3*z4- 911*z2*z3*z4^2- 3585*z3^2*z4^2+
    1549*z2*z4^3- 3585*z3*z4^3+ 3867*z4^4- 2460*z2*z3^2*z5+ 1549*z3^3*z5-
    772*z2*z3*z4*z5- 911*z3^2*z4*z5- 2460*z2*z4^2*z5- 911*z3*z4^2*z5+
    1549*z4^3*z5- 2460*z2*z3^2*z6+ 1549*z3^3*z6- 772*z2*z3*z4*z6- 911*z3^2*z4*z6-
    2460*z2*z4^2*z6- 911*z3*z4^2*z6+ 1549*z4^3*z6+ 1688*z2*z3*z5*z6-
    2460*z3^2*z5*z6+ 1688*z2*z4*z5*z6- 772*z3*z4*z5*z6- 2460*z4^2*z5*z6-
    4448*z2*z3+ 3445*z3^2- 4448*z2*z4- 1003*z3*z4+ 3445*z4^2+ 2971*z2*z5-
    4448*z3*z5- 4448*z4*z5+ 2971*z2*z6- 4448*z3*z6- 4448*z4*z6+ 2971*z5*z6- 2092,
    - 4*z2*z3^11+ 2*z3^12+ 6*z2*z3^10*z4- 4*z3^11*z4+ 2*z2*z3^10*z5- 2*z3^11*z5-
    2*z2*z3^9*z4*z5+ 2*z3^10*z4*z5+ 2*z2*z3^9*z5^2- 2*z3^10*z5^2-
    2*z2*z3^8*z4*z5^2+ 2*z3^9*z4*z5^2+ 2*z2*z3^8*z5^3- 2*z3^9*z5^3-
    2*z2*z3^7*z4*z5^3+ 2*z3^8*z4*z5^3+ 2*z2*z3^7*z5^4- 2*z3^8*z5^4-
    2*z2*z3^6*z4*z5^4+ 2*z3^7*z4*z5^4+ 2*z2*z3^6*z5^5- 2*z3^7*z5^5-
    2*z2*z3^5*z4*z5^5+ 2*z3^6*z4*z5^5+ 2*z2*z3^5*z5^6- 2*z3^6*z5^6-
    2*z2*z3^4*z4*z5^6+ 2*z3^5*z4*z5^6+ 2*z2*z3^4*z5^7- 2*z3^5*z5^7-
    2*z2*z3^3*z4*z5^7+ 2*z3^4*z4*z5^7+ 2*z2*z3^3*z5^8- 2*z3^4*z5^8-
    2*z2*z3^2*z4*z5^8+ 2*z3^3*z4*z5^8+ 2*z2*z3^2*z5^9- 2*z3^3*z5^9-
    2*z2*z3*z4*z5^9+ 2*z3^2*z4*z5^9+ 2*z2*z3*z5^10- 2*z3^2*z5^10+ 6*z2*z4*z5^10+
    2*z3*z4*z5^10- 4*z2*z5^11- 2*z3*z5^11- 4*z4*z5^11+ 2*z5^12+ 6*z2*z3^10*z6-
    4*z3^11*z6- 8*z2*z3^9*z4*z6+ 6*z3^10*z4*z6- 2*z2*z3^9*z5*z6+ 2*z3^10*z5*z6+
    2*z2*z3^8*z4*z5*z6- 2*z3^9*z4*z5*z6- 2*z2*z3^8*z5^2*z6+ 2*z3^9*z5^2*z6+
    2*z2*z3^7*z4*z5^2*z6- 2*z3^8*z4*z5^2*z6- 2*z2*z3^7*z5^3*z6+ 2*z3^8*z5^3*z6+
    2*z2*z3^6*z4*z5^3*z6- 2*z3^7*z4*z5^3*z6- 2*z2*z3^6*z5^4*z6+ 2*z3^7*z5^4*z6+
    2*z2*z3^5*z4*z5^4*z6- 2*z3^6*z4*z5^4*z6- 2*z2*z3^5*z5^5*z6+ 2*z3^6*z5^5*z6+
    2*z2*z3^4*z4*z5^5*z6- 2*z3^5*z4*z5^5*z6- 2*z2*z3^4*z5^6*z6+ 2*z3^5*z5^6*z6+
    2*z2*z3^3*z4*z5^6*z6- 2*z3^4*z4*z5^6*z6- 2*z2*z3^3*z5^7*z6+ 2*z3^4*z5^7*z6+
    2*z2*z3^2*z4*z5^7*z6- 2*z3^3*z4*z5^7*z6- 2*z2*z3^2*z5^8*z6+ 2*z3^3*z5^8*z6+
    2*z2*z3*z4*z5^8*z6- 2*z3^2*z4*z5^8*z6- 2*z2*z3*z5^9*z6+ 2*z3^2*z5^9*z6-
    8*z2*z4*z5^9*z6- 2*z3*z4*z5^9*z6+ 6*z2*z5^10*z6+ 2*z3*z5^10*z6+ 6*z4*z5^10*z6-
    4*z5^11*z6+ 4491*z2*z3^9+ 8*z3^10+ 5*z2*z3^8*z4+ 4491*z3^9*z4+
    4496*z2*z3^8*z5+ 4499*z3^9*z5- 4488*z2*z3^7*z4*z5+ 4496*z3^8*z4*z5+
    4496*z2*z3^7*z5^2+ 4499*z3^8*z5^2- 4488*z2*z3^6*z4*z5^2+ 4496*z3^7*z4*z5^2+
    4496*z2*z3^6*z5^3+ 4499*z3^7*z5^3- 4488*z2*z3^5*z4*z5^3+ 4496*z3^6*z4*z5^3+
    4496*z2*z3^5*z5^4+ 4499*z3^6*z5^4- 4488*z2*z3^4*z4*z5^4+ 4496*z3^5*z4*z5^4+
    4496*z2*z3^4*z5^5+ 4499*z3^5*z5^5- 4488*z2*z3^3*z4*z5^5+ 4496*z3^4*z4*z5^5+
    4496*z2*z3^3*z5^6+ 4499*z3^4*z5^6- 4488*z2*z3^2*z4*z5^6+ 4496*z3^3*z4*z5^6+
    4496*z2*z3^2*z5^7+ 4499*z3^3*z5^7- 4488*z2*z3*z4*z5^7+ 4496*z3^2*z4*z5^7+
    4496*z2*z3*z5^8+ 4499*z3^2*z5^8+ 5*z2*z4*z5^8+ 4496*z3*z4*z5^8+ 4491*z2*z5^9+
    4499*z3*z5^9+ 4491*z4*z5^9+ 8*z5^10+ 5*z2*z3^8*z6+ 4491*z3^9*z6-
    4493*z2*z3^7*z4*z6+ 5*z3^8*z4*z6- 4488*z2*z3^7*z5*z6+ 4496*z3^8*z5*z6+
    4478*z2*z3^6*z4*z5*z6- 4488*z3^7*z4*z5*z6- 4488*z2*z3^6*z5^2*z6+
    4496*z3^7*z5^2*z6+ 4478*z2*z3^5*z4*z5^2*z6- 4488*z3^6*z4*z5^2*z6-
    4488*z2*z3^5*z5^3*z6+ 4496*z3^6*z5^3*z6+ 4478*z2*z3^4*z4*z5^3*z6-
    4488*z3^5*z4*z5^3*z6- 4488*z2*z3^4*z5^4*z6+ 4496*z3^5*z5^4*z6+
    4478*z2*z3^3*z4*z5^4*z6- 4488*z3^4*z4*z5^4*z6- 4488*z2*z3^3*z5^5*z6+
    4496*z3^4*z5^5*z6+ 4478*z2*z3^2*z4*z5^5*z6- 4488*z3^3*z4*z5^5*z6-
    4488*z2*z3^2*z5^6*z6+ 4496*z3^3*z5^6*z6+ 4478*z2*z3*z4*z5^6*z6-
    4488*z3^2*z4*z5^6*z6- 4488*z2*z3*z5^7*z6+ 4496*z3^2*z5^7*z6-
    4493*z2*z4*z5^7*z6- 4488*z3*z4*z5^7*z6+ 5*z2*z5^8*z6+ 4496*z3*z5^8*z6+
    5*z4*z5^8*z6+ 4491*z5^9*z6+ 4496*z2*z3^7+ 2261*z3^8- 2257*z2*z3^6*z4+
    4496*z3^7*z4+ 2239*z2*z3^6*z5- 2244*z3^7*z5+ 2254*z2*z3^5*z4*z5+
    2239*z3^6*z4*z5+ 2239*z2*z3^5*z5^2- 2244*z3^6*z5^2+ 2254*z2*z3^4*z4*z5^2+
    2239*z3^5*z4*z5^2+ 2239*z2*z3^4*z5^3- 2244*z3^5*z5^3+ 2254*z2*z3^3*z4*z5^3+
    2239*z3^4*z4*z5^3+ 2239*z2*z3^3*z5^4- 2244*z3^4*z5^4+ 2254*z2*z3^2*z4*z5^4+
    2239*z3^3*z4*z5^4+ 2239*z2*z3^2*z5^5- 2244*z3^3*z5^5+ 2254*z2*z3*z4*z5^5+
    2239*z3^2*z4*z5^5+ 2239*z2*z3*z5^6- 2244*z3^2*z5^6- 2257*z2*z4*z5^6+
    2239*z3*z4*z5^6+ 4496*z2*z5^7- 2244*z3*z5^7+ 4496*z4*z5^7+ 2261*z5^8-
    2257*z2*z3^6*z6+ 4496*z3^7*z6- 4490*z2*z3^5*z4*z6- 2257*z3^6*z4*z6+
    2254*z2*z3^5*z5*z6+ 2239*z3^6*z5*z6- 2224*z2*z3^4*z4*z5*z6+
    2254*z3^5*z4*z5*z6+ 2254*z2*z3^4*z5^2*z6+ 2239*z3^5*z5^2*z6-
    2224*z2*z3^3*z4*z5^2*z6+ 2254*z3^4*z4*z5^2*z6+ 2254*z2*z3^3*z5^3*z6+
    2239*z3^4*z5^3*z6- 2224*z2*z3^2*z4*z5^3*z6+ 2254*z3^3*z4*z5^3*z6+
    2254*z2*z3^2*z5^4*z6+ 2239*z3^3*z5^4*z6- 2224*z2*z3*z4*z5^4*z6+
    2254*z3^2*z4*z5^4*z6+ 2254*z2*z3*z5^5*z6+ 2239*z3^2*z5^5*z6-
    4490*z2*z4*z5^5*z6+ 2254*z3*z4*z5^5*z6- 2257*z2*z5^6*z6+ 2239*z3*z5^6*z6-
    2257*z4*z5^6*z6+ 4496*z5^7*z6+ 2816*z2*z3^5+ 1130*z3^6+ 4496*z2*z3^4*z4+
    2816*z3^5*z4- 1689*z2*z3^4*z5+ 3946*z3^5*z5- 2822*z2*z3^3*z4*z5-
    1689*z3^4*z4*z5- 1689*z2*z3^3*z5^2+ 3946*z3^4*z5^2- 2822*z2*z3^2*z4*z5^2-
    1689*z3^3*z4*z5^2- 1689*z2*z3^2*z5^3+ 3946*z3^3*z5^3- 2822*z2*z3*z4*z5^3-
    1689*z3^2*z4*z5^3- 1689*z2*z3*z5^4+ 3946*z3^2*z5^4+ 4496*z2*z4*z5^4-
    1689*z3*z4*z5^4+ 2816*z2*z5^5+ 3946*z3*z5^5+ 2816*z4*z5^5+ 1130*z5^6+
    4496*z2*z3^4*z6+ 2816*z3^5*z6+ 1683*z2*z3^3*z4*z6+ 4496*z3^4*z4*z6-
    2822*z2*z3^3*z5*z6- 1689*z3^4*z5*z6+ 556*z2*z3^2*z4*z5*z6- 2822*z3^3*z4*z5*z6-
    2822*z2*z3^2*z5^2*z6- 1689*z3^3*z5^2*z6+ 556*z2*z3*z4*z5^2*z6-
    2822*z3^2*z4*z5^2*z6- 2822*z2*z3*z5^3*z6- 1689*z3^2*z5^3*z6+
    1683*z2*z4*z5^3*z6- 2822*z3*z4*z5^3*z6+ 4496*z2*z5^4*z6- 1689*z3*z5^4*z6+
    4496*z4*z5^4*z6+ 2816*z5^5*z6+ 1549*z2*z3^3+ 3867*z3^4- 2460*z2*z3^2*z4+
    1549*z3^3*z4- 911*z2*z3^2*z5- 3585*z3^3*z5- 772*z2*z3*z4*z5- 911*z3^2*z4*z5-
    911*z2*z3*z5^2- 3585*z3^2*z5^2- 2460*z2*z4*z5^2- 911*z3*z4*z5^2+ 1549*z2*z5^3-
    3585*z3*z5^3+ 1549*z4*z5^3+ 3867*z5^4- 2460*z2*z3^2*z6+ 1549*z3^3*z6+
    1688*z2*z3*z4*z6- 2460*z3^2*z4*z6- 772*z2*z3*z5*z6- 911*z3^2*z5*z6+
    1688*z2*z4*z5*z6- 772*z3*z4*z5*z6- 2460*z2*z5^2*z6- 911*z3*z5^2*z6-
    2460*z4*z5^2*z6+ 1549*z5^3*z6- 4448*z2*z3+ 3445*z3^2+ 2971*z2*z4- 4448*z3*z4-
    4448*z2*z5- 1003*z3*z5- 4448*z4*z5+ 3445*z5^2+ 2971*z2*z6- 4448*z3*z6+
    2971*z4*z6- 4448*z5*z6- 2092, - 4*z2*z3^11+ 2*z3^12+ 6*z2*z3^10*z4-
    4*z3^11*z4+ 6*z2*z3^10*z5- 4*z3^11*z5- 8*z2*z3^9*z4*z5+ 6*z3^10*z4*z5+
    2*z2*z3^10*z6- 2*z3^11*z6- 2*z2*z3^9*z4*z6+ 2*z3^10*z4*z6- 2*z2*z3^9*z5*z6+
    2*z3^10*z5*z6+ 2*z2*z3^8*z4*z5*z6- 2*z3^9*z4*z5*z6+ 2*z2*z3^9*z6^2-
    2*z3^10*z6^2- 2*z2*z3^8*z4*z6^2+ 2*z3^9*z4*z6^2- 2*z2*z3^8*z5*z6^2+
    2*z3^9*z5*z6^2+ 2*z2*z3^7*z4*z5*z6^2- 2*z3^8*z4*z5*z6^2+ 2*z2*z3^8*z6^3-
    2*z3^9*z6^3- 2*z2*z3^7*z4*z6^3+ 2*z3^8*z4*z6^3- 2*z2*z3^7*z5*z6^3+
    2*z3^8*z5*z6^3+ 2*z2*z3^6*z4*z5*z6^3- 2*z3^7*z4*z5*z6^3+ 2*z2*z3^7*z6^4-
    2*z3^8*z6^4- 2*z2*z3^6*z4*z6^4+ 2*z3^7*z4*z6^4- 2*z2*z3^6*z5*z6^4+
    2*z3^7*z5*z6^4+ 2*z2*z3^5*z4*z5*z6^4- 2*z3^6*z4*z5*z6^4+ 2*z2*z3^6*z6^5-
    2*z3^7*z6^5- 2*z2*z3^5*z4*z6^5+ 2*z3^6*z4*z6^5- 2*z2*z3^5*z5*z6^5+
    2*z3^6*z5*z6^5+ 2*z2*z3^4*z4*z5*z6^5- 2*z3^5*z4*z5*z6^5+ 2*z2*z3^5*z6^6-
    2*z3^6*z6^6- 2*z2*z3^4*z4*z6^6+ 2*z3^5*z4*z6^6- 2*z2*z3^4*z5*z6^6+
    2*z3^5*z5*z6^6+ 2*z2*z3^3*z4*z5*z6^6- 2*z3^4*z4*z5*z6^6+ 2*z2*z3^4*z6^7-
    2*z3^5*z6^7- 2*z2*z3^3*z4*z6^7+ 2*z3^4*z4*z6^7- 2*z2*z3^3*z5*z6^7+
    2*z3^4*z5*z6^7+ 2*z2*z3^2*z4*z5*z6^7- 2*z3^3*z4*z5*z6^7+ 2*z2*z3^3*z6^8-
    2*z3^4*z6^8- 2*z2*z3^2*z4*z6^8+ 2*z3^3*z4*z6^8- 2*z2*z3^2*z5*z6^8+
    2*z3^3*z5*z6^8+ 2*z2*z3*z4*z5*z6^8- 2*z3^2*z4*z5*z6^8+ 2*z2*z3^2*z6^9-
    2*z3^3*z6^9- 2*z2*z3*z4*z6^9+ 2*z3^2*z4*z6^9- 2*z2*z3*z5*z6^9+ 2*z3^2*z5*z6^9-
    8*z2*z4*z5*z6^9- 2*z3*z4*z5*z6^9+ 2*z2*z3*z6^10- 2*z3^2*z6^10+ 6*z2*z4*z6^10+
    2*z3*z4*z6^10+ 6*z2*z5*z6^10+ 2*z3*z5*z6^10+ 6*z4*z5*z6^10- 4*z2*z6^11-
    2*z3*z6^11- 4*z4*z6^11- 4*z5*z6^11+ 2*z6^12+ 4491*z2*z3^9+ 8*z3^10+
    5*z2*z3^8*z4+ 4491*z3^9*z4+ 5*z2*z3^8*z5+ 4491*z3^9*z5- 4493*z2*z3^7*z4*z5+
    5*z3^8*z4*z5+ 4496*z2*z3^8*z6+ 4499*z3^9*z6- 4488*z2*z3^7*z4*z6+
    4496*z3^8*z4*z6- 4488*z2*z3^7*z5*z6+ 4496*z3^8*z5*z6+ 4478*z2*z3^6*z4*z5*z6-
    4488*z3^7*z4*z5*z6+ 4496*z2*z3^7*z6^2+ 4499*z3^8*z6^2- 4488*z2*z3^6*z4*z6^2+
    4496*z3^7*z4*z6^2- 4488*z2*z3^6*z5*z6^2+ 4496*z3^7*z5*z6^2+
    4478*z2*z3^5*z4*z5*z6^2- 4488*z3^6*z4*z5*z6^2+ 4496*z2*z3^6*z6^3+
    4499*z3^7*z6^3- 4488*z2*z3^5*z4*z6^3+ 4496*z3^6*z4*z6^3- 4488*z2*z3^5*z5*z6^3+
    4496*z3^6*z5*z6^3+ 4478*z2*z3^4*z4*z5*z6^3- 4488*z3^5*z4*z5*z6^3+
    4496*z2*z3^5*z6^4+ 4499*z3^6*z6^4- 4488*z2*z3^4*z4*z6^4+ 4496*z3^5*z4*z6^4-
    4488*z2*z3^4*z5*z6^4+ 4496*z3^5*z5*z6^4+ 4478*z2*z3^3*z4*z5*z6^4-
    4488*z3^4*z4*z5*z6^4+ 4496*z2*z3^4*z6^5+ 4499*z3^5*z6^5- 4488*z2*z3^3*z4*z6^5+
    4496*z3^4*z4*z6^5- 4488*z2*z3^3*z5*z6^5+ 4496*z3^4*z5*z6^5+
    4478*z2*z3^2*z4*z5*z6^5- 4488*z3^3*z4*z5*z6^5+ 4496*z2*z3^3*z6^6+
    4499*z3^4*z6^6- 4488*z2*z3^2*z4*z6^6+ 4496*z3^3*z4*z6^6- 4488*z2*z3^2*z5*z6^6+
    4496*z3^3*z5*z6^6+ 4478*z2*z3*z4*z5*z6^6- 4488*z3^2*z4*z5*z6^6+
    4496*z2*z3^2*z6^7+ 4499*z3^3*z6^7- 4488*z2*z3*z4*z6^7+ 4496*z3^2*z4*z6^7-
    4488*z2*z3*z5*z6^7+ 4496*z3^2*z5*z6^7- 4493*z2*z4*z5*z6^7- 4488*z3*z4*z5*z6^7+
    4496*z2*z3*z6^8+ 4499*z3^2*z6^8+ 5*z2*z4*z6^8+ 4496*z3*z4*z6^8+ 5*z2*z5*z6^8+
    4496*z3*z5*z6^8+ 5*z4*z5*z6^8+ 4491*z2*z6^9+ 4499*z3*z6^9+ 4491*z4*z6^9+
    4491*z5*z6^9+ 8*z6^10+ 4496*z2*z3^7+ 2261*z3^8- 2257*z2*z3^6*z4+ 4496*z3^7*z4-
    2257*z2*z3^6*z5+ 4496*z3^7*z5- 4490*z2*z3^5*z4*z5- 2257*z3^6*z4*z5+
    2239*z2*z3^6*z6- 2244*z3^7*z6+ 2254*z2*z3^5*z4*z6+ 2239*z3^6*z4*z6+
    2254*z2*z3^5*z5*z6+ 2239*z3^6*z5*z6- 2224*z2*z3^4*z4*z5*z6+
    2254*z3^5*z4*z5*z6+ 2239*z2*z3^5*z6^2- 2244*z3^6*z6^2+ 2254*z2*z3^4*z4*z6^2+
    2239*z3^5*z4*z6^2+ 2254*z2*z3^4*z5*z6^2+ 2239*z3^5*z5*z6^2-
    2224*z2*z3^3*z4*z5*z6^2+ 2254*z3^4*z4*z5*z6^2+ 2239*z2*z3^4*z6^3-
    2244*z3^5*z6^3+ 2254*z2*z3^3*z4*z6^3+ 2239*z3^4*z4*z6^3+ 2254*z2*z3^3*z5*z6^3+
    2239*z3^4*z5*z6^3- 2224*z2*z3^2*z4*z5*z6^3+ 2254*z3^3*z4*z5*z6^3+
    2239*z2*z3^3*z6^4- 2244*z3^4*z6^4+ 2254*z2*z3^2*z4*z6^4+ 2239*z3^3*z4*z6^4+
    2254*z2*z3^2*z5*z6^4+ 2239*z3^3*z5*z6^4- 2224*z2*z3*z4*z5*z6^4+
    2254*z3^2*z4*z5*z6^4+ 2239*z2*z3^2*z6^5- 2244*z3^3*z6^5+ 2254*z2*z3*z4*z6^5+
    2239*z3^2*z4*z6^5+ 2254*z2*z3*z5*z6^5+ 2239*z3^2*z5*z6^5- 4490*z2*z4*z5*z6^5+
    2254*z3*z4*z5*z6^5+ 2239*z2*z3*z6^6- 2244*z3^2*z6^6- 2257*z2*z4*z6^6+
    2239*z3*z4*z6^6- 2257*z2*z5*z6^6+ 2239*z3*z5*z6^6- 2257*z4*z5*z6^6+
    4496*z2*z6^7- 2244*z3*z6^7+ 4496*z4*z6^7+ 4496*z5*z6^7+ 2261*z6^8+
    2816*z2*z3^5+ 1130*z3^6+ 4496*z2*z3^4*z4+ 2816*z3^5*z4+ 4496*z2*z3^4*z5+
    2816*z3^5*z5+ 1683*z2*z3^3*z4*z5+ 4496*z3^4*z4*z5- 1689*z2*z3^4*z6+
    3946*z3^5*z6- 2822*z2*z3^3*z4*z6- 1689*z3^4*z4*z6- 2822*z2*z3^3*z5*z6-
    1689*z3^4*z5*z6+ 556*z2*z3^2*z4*z5*z6- 2822*z3^3*z4*z5*z6- 1689*z2*z3^3*z6^2+
    3946*z3^4*z6^2- 2822*z2*z3^2*z4*z6^2- 1689*z3^3*z4*z6^2- 2822*z2*z3^2*z5*z6^2-
    1689*z3^3*z5*z6^2+ 556*z2*z3*z4*z5*z6^2- 2822*z3^2*z4*z5*z6^2-
    1689*z2*z3^2*z6^3+ 3946*z3^3*z6^3- 2822*z2*z3*z4*z6^3- 1689*z3^2*z4*z6^3-
    2822*z2*z3*z5*z6^3- 1689*z3^2*z5*z6^3+ 1683*z2*z4*z5*z6^3- 2822*z3*z4*z5*z6^3-
    1689*z2*z3*z6^4+ 3946*z3^2*z6^4+ 4496*z2*z4*z6^4- 1689*z3*z4*z6^4+
    4496*z2*z5*z6^4- 1689*z3*z5*z6^4+ 4496*z4*z5*z6^4+ 2816*z2*z6^5+ 3946*z3*z6^5+
    2816*z4*z6^5+ 2816*z5*z6^5+ 1130*z6^6+ 1549*z2*z3^3+ 3867*z3^4-
    2460*z2*z3^2*z4+ 1549*z3^3*z4- 2460*z2*z3^2*z5+ 1549*z3^3*z5+
    1688*z2*z3*z4*z5- 2460*z3^2*z4*z5- 911*z2*z3^2*z6- 3585*z3^3*z6-
    772*z2*z3*z4*z6- 911*z3^2*z4*z6- 772*z2*z3*z5*z6- 911*z3^2*z5*z6+
    1688*z2*z4*z5*z6- 772*z3*z4*z5*z6- 911*z2*z3*z6^2- 3585*z3^2*z6^2-
    2460*z2*z4*z6^2- 911*z3*z4*z6^2- 2460*z2*z5*z6^2- 911*z3*z5*z6^2-
    2460*z4*z5*z6^2+ 1549*z2*z6^3- 3585*z3*z6^3+ 1549*z4*z6^3+ 1549*z5*z6^3+
    3867*z6^4- 4448*z2*z3+ 3445*z3^2+ 2971*z2*z4- 4448*z3*z4+ 2971*z2*z5-
    4448*z3*z5+ 2971*z4*z5- 4448*z2*z6- 1003*z3*z6- 4448*z4*z6- 4448*z5*z6+
    3445*z6^2- 2092, 6*z2*z3*z4^10- 4*z2*z4^11- 4*z3*z4^11+ 2*z4^12-
    2*z2*z3*z4^9*z5+ 2*z2*z4^10*z5+ 2*z3*z4^10*z5- 2*z4^11*z5- 2*z2*z3*z4^8*z5^2+
    2*z2*z4^9*z5^2+ 2*z3*z4^9*z5^2- 2*z4^10*z5^2- 2*z2*z3*z4^7*z5^3+
    2*z2*z4^8*z5^3+ 2*z3*z4^8*z5^3- 2*z4^9*z5^3- 2*z2*z3*z4^6*z5^4+
    2*z2*z4^7*z5^4+ 2*z3*z4^7*z5^4- 2*z4^8*z5^4- 2*z2*z3*z4^5*z5^5+
    2*z2*z4^6*z5^5+ 2*z3*z4^6*z5^5- 2*z4^7*z5^5- 2*z2*z3*z4^4*z5^6+
    2*z2*z4^5*z5^6+ 2*z3*z4^5*z5^6- 2*z4^6*z5^6- 2*z2*z3*z4^3*z5^7+
    2*z2*z4^4*z5^7+ 2*z3*z4^4*z5^7- 2*z4^5*z5^7- 2*z2*z3*z4^2*z5^8+
    2*z2*z4^3*z5^8+ 2*z3*z4^3*z5^8- 2*z4^4*z5^8- 2*z2*z3*z4*z5^9+ 2*z2*z4^2*z5^9+
    2*z3*z4^2*z5^9- 2*z4^3*z5^9+ 6*z2*z3*z5^10+ 2*z2*z4*z5^10+ 2*z3*z4*z5^10-
    2*z4^2*z5^10- 4*z2*z5^11- 4*z3*z5^11- 2*z4*z5^11+ 2*z5^12- 8*z2*z3*z4^9*z6+
    6*z2*z4^10*z6+ 6*z3*z4^10*z6- 4*z4^11*z6+ 2*z2*z3*z4^8*z5*z6- 2*z2*z4^9*z5*z6-
    2*z3*z4^9*z5*z6+ 2*z4^10*z5*z6+ 2*z2*z3*z4^7*z5^2*z6- 2*z2*z4^8*z5^2*z6-
    2*z3*z4^8*z5^2*z6+ 2*z4^9*z5^2*z6+ 2*z2*z3*z4^6*z5^3*z6- 2*z2*z4^7*z5^3*z6-
    2*z3*z4^7*z5^3*z6+ 2*z4^8*z5^3*z6+ 2*z2*z3*z4^5*z5^4*z6- 2*z2*z4^6*z5^4*z6-
    2*z3*z4^6*z5^4*z6+ 2*z4^7*z5^4*z6+ 2*z2*z3*z4^4*z5^5*z6- 2*z2*z4^5*z5^5*z6-
    2*z3*z4^5*z5^5*z6+ 2*z4^6*z5^5*z6+ 2*z2*z3*z4^3*z5^6*z6- 2*z2*z4^4*z5^6*z6-
    2*z3*z4^4*z5^6*z6+ 2*z4^5*z5^6*z6+ 2*z2*z3*z4^2*z5^7*z6- 2*z2*z4^3*z5^7*z6-
    2*z3*z4^3*z5^7*z6+ 2*z4^4*z5^7*z6+ 2*z2*z3*z4*z5^8*z6- 2*z2*z4^2*z5^8*z6-
    2*z3*z4^2*z5^8*z6+ 2*z4^3*z5^8*z6- 8*z2*z3*z5^9*z6- 2*z2*z4*z5^9*z6-
    2*z3*z4*z5^9*z6+ 2*z4^2*z5^9*z6+ 6*z2*z5^10*z6+ 6*z3*z5^10*z6+ 2*z4*z5^10*z6-
    4*z5^11*z6+ 5*z2*z3*z4^8+ 4491*z2*z4^9+ 4491*z3*z4^9+ 8*z4^10-
    4488*z2*z3*z4^7*z5+ 4496*z2*z4^8*z5+ 4496*z3*z4^8*z5+ 4499*z4^9*z5-
    4488*z2*z3*z4^6*z5^2+ 4496*z2*z4^7*z5^2+ 4496*z3*z4^7*z5^2+ 4499*z4^8*z5^2-
    4488*z2*z3*z4^5*z5^3+ 4496*z2*z4^6*z5^3+ 4496*z3*z4^6*z5^3+ 4499*z4^7*z5^3-
    4488*z2*z3*z4^4*z5^4+ 4496*z2*z4^5*z5^4+ 4496*z3*z4^5*z5^4+ 4499*z4^6*z5^4-
    4488*z2*z3*z4^3*z5^5+ 4496*z2*z4^4*z5^5+ 4496*z3*z4^4*z5^5+ 4499*z4^5*z5^5-
    4488*z2*z3*z4^2*z5^6+ 4496*z2*z4^3*z5^6+ 4496*z3*z4^3*z5^6+ 4499*z4^4*z5^6-
    4488*z2*z3*z4*z5^7+ 4496*z2*z4^2*z5^7+ 4496*z3*z4^2*z5^7+ 4499*z4^3*z5^7+
    5*z2*z3*z5^8+ 4496*z2*z4*z5^8+ 4496*z3*z4*z5^8+ 4499*z4^2*z5^8+ 4491*z2*z5^9+
    4491*z3*z5^9+ 4499*z4*z5^9+ 8*z5^10- 4493*z2*z3*z4^7*z6+ 5*z2*z4^8*z6+
    5*z3*z4^8*z6+ 4491*z4^9*z6+ 4478*z2*z3*z4^6*z5*z6- 4488*z2*z4^7*z5*z6-
    4488*z3*z4^7*z5*z6+ 4496*z4^8*z5*z6+ 4478*z2*z3*z4^5*z5^2*z6-
    4488*z2*z4^6*z5^2*z6- 4488*z3*z4^6*z5^2*z6+ 4496*z4^7*z5^2*z6+
    4478*z2*z3*z4^4*z5^3*z6- 4488*z2*z4^5*z5^3*z6- 4488*z3*z4^5*z5^3*z6+
    4496*z4^6*z5^3*z6+ 4478*z2*z3*z4^3*z5^4*z6- 4488*z2*z4^4*z5^4*z6-
    4488*z3*z4^4*z5^4*z6+ 4496*z4^5*z5^4*z6+ 4478*z2*z3*z4^2*z5^5*z6-
    4488*z2*z4^3*z5^5*z6- 4488*z3*z4^3*z5^5*z6+ 4496*z4^4*z5^5*z6+
    4478*z2*z3*z4*z5^6*z6- 4488*z2*z4^2*z5^6*z6- 4488*z3*z4^2*z5^6*z6+
    4496*z4^3*z5^6*z6- 4493*z2*z3*z5^7*z6- 4488*z2*z4*z5^7*z6- 4488*z3*z4*z5^7*z6+
    4496*z4^2*z5^7*z6+ 5*z2*z5^8*z6+ 5*z3*z5^8*z6+ 4496*z4*z5^8*z6+ 4491*z5^9*z6-
    2257*z2*z3*z4^6+ 4496*z2*z4^7+ 4496*z3*z4^7+ 2261*z4^8+ 2254*z2*z3*z4^5*z5+
    2239*z2*z4^6*z5+ 2239*z3*z4^6*z5- 2244*z4^7*z5+ 2254*z2*z3*z4^4*z5^2+
    2239*z2*z4^5*z5^2+ 2239*z3*z4^5*z5^2- 2244*z4^6*z5^2+ 2254*z2*z3*z4^3*z5^3+
    2239*z2*z4^4*z5^3+ 2239*z3*z4^4*z5^3- 2244*z4^5*z5^3+ 2254*z2*z3*z4^2*z5^4+
    2239*z2*z4^3*z5^4+ 2239*z3*z4^3*z5^4- 2244*z4^4*z5^4+ 2254*z2*z3*z4*z5^5+
    2239*z2*z4^2*z5^5+ 2239*z3*z4^2*z5^5- 2244*z4^3*z5^5- 2257*z2*z3*z5^6+
    2239*z2*z4*z5^6+ 2239*z3*z4*z5^6- 2244*z4^2*z5^6+ 4496*z2*z5^7+ 4496*z3*z5^7-
    2244*z4*z5^7+ 2261*z5^8- 4490*z2*z3*z4^5*z6- 2257*z2*z4^6*z6- 2257*z3*z4^6*z6+
    4496*z4^7*z6- 2224*z2*z3*z4^4*z5*z6+ 2254*z2*z4^5*z5*z6+ 2254*z3*z4^5*z5*z6+
    2239*z4^6*z5*z6- 2224*z2*z3*z4^3*z5^2*z6+ 2254*z2*z4^4*z5^2*z6+
    2254*z3*z4^4*z5^2*z6+ 2239*z4^5*z5^2*z6- 2224*z2*z3*z4^2*z5^3*z6+
    2254*z2*z4^3*z5^3*z6+ 2254*z3*z4^3*z5^3*z6+ 2239*z4^4*z5^3*z6-
    2224*z2*z3*z4*z5^4*z6+ 2254*z2*z4^2*z5^4*z6+ 2254*z3*z4^2*z5^4*z6+
    2239*z4^3*z5^4*z6- 4490*z2*z3*z5^5*z6+ 2254*z2*z4*z5^5*z6+ 2254*z3*z4*z5^5*z6+
    2239*z4^2*z5^5*z6- 2257*z2*z5^6*z6- 2257*z3*z5^6*z6+ 2239*z4*z5^6*z6+
    4496*z5^7*z6+ 4496*z2*z3*z4^4+ 2816*z2*z4^5+ 2816*z3*z4^5+ 1130*z4^6-
    2822*z2*z3*z4^3*z5- 1689*z2*z4^4*z5- 1689*z3*z4^4*z5+ 3946*z4^5*z5-
    2822*z2*z3*z4^2*z5^2- 1689*z2*z4^3*z5^2- 1689*z3*z4^3*z5^2+ 3946*z4^4*z5^2-
    2822*z2*z3*z4*z5^3- 1689*z2*z4^2*z5^3- 1689*z3*z4^2*z5^3+ 3946*z4^3*z5^3+
    4496*z2*z3*z5^4- 1689*z2*z4*z5^4- 1689*z3*z4*z5^4+ 3946*z4^2*z5^4+
    2816*z2*z5^5+ 2816*z3*z5^5+ 3946*z4*z5^5+ 1130*z5^6+ 1683*z2*z3*z4^3*z6+
    4496*z2*z4^4*z6+ 4496*z3*z4^4*z6+ 2816*z4^5*z6+ 556*z2*z3*z4^2*z5*z6-
    2822*z2*z4^3*z5*z6- 2822*z3*z4^3*z5*z6- 1689*z4^4*z5*z6+ 556*z2*z3*z4*z5^2*z6-
    2822*z2*z4^2*z5^2*z6- 2822*z3*z4^2*z5^2*z6- 1689*z4^3*z5^2*z6+
    1683*z2*z3*z5^3*z6- 2822*z2*z4*z5^3*z6- 2822*z3*z4*z5^3*z6- 1689*z4^2*z5^3*z6+
    4496*z2*z5^4*z6+ 4496*z3*z5^4*z6- 1689*z4*z5^4*z6+ 2816*z5^5*z6-
    2460*z2*z3*z4^2+ 1549*z2*z4^3+ 1549*z3*z4^3+ 3867*z4^4- 772*z2*z3*z4*z5-
    911*z2*z4^2*z5- 911*z3*z4^2*z5- 3585*z4^3*z5- 2460*z2*z3*z5^2- 911*z2*z4*z5^2-
    911*z3*z4*z5^2- 3585*z4^2*z5^2+ 1549*z2*z5^3+ 1549*z3*z5^3- 3585*z4*z5^3+
    3867*z5^4+ 1688*z2*z3*z4*z6- 2460*z2*z4^2*z6- 2460*z3*z4^2*z6+ 1549*z4^3*z6+
    1688*z2*z3*z5*z6- 772*z2*z4*z5*z6- 772*z3*z4*z5*z6- 911*z4^2*z5*z6-
    2460*z2*z5^2*z6- 2460*z3*z5^2*z6- 911*z4*z5^2*z6+ 1549*z5^3*z6+ 2971*z2*z3-
    4448*z2*z4- 4448*z3*z4+ 3445*z4^2- 4448*z2*z5- 4448*z3*z5- 1003*z4*z5+
    3445*z5^2+ 2971*z2*z6+ 2971*z3*z6- 4448*z4*z6- 4448*z5*z6- 2092,
    6*z2*z3*z4^10- 4*z2*z4^11- 4*z3*z4^11+ 2*z4^12- 8*z2*z3*z4^9*z5+
    6*z2*z4^10*z5+ 6*z3*z4^10*z5- 4*z4^11*z5- 2*z2*z3*z4^9*z6+ 2*z2*z4^10*z6+
    2*z3*z4^10*z6- 2*z4^11*z6+ 2*z2*z3*z4^8*z5*z6- 2*z2*z4^9*z5*z6-
    2*z3*z4^9*z5*z6+ 2*z4^10*z5*z6- 2*z2*z3*z4^8*z6^2+ 2*z2*z4^9*z6^2+
    2*z3*z4^9*z6^2- 2*z4^10*z6^2+ 2*z2*z3*z4^7*z5*z6^2- 2*z2*z4^8*z5*z6^2-
    2*z3*z4^8*z5*z6^2+ 2*z4^9*z5*z6^2- 2*z2*z3*z4^7*z6^3+ 2*z2*z4^8*z6^3+
    2*z3*z4^8*z6^3- 2*z4^9*z6^3+ 2*z2*z3*z4^6*z5*z6^3- 2*z2*z4^7*z5*z6^3-
    2*z3*z4^7*z5*z6^3+ 2*z4^8*z5*z6^3- 2*z2*z3*z4^6*z6^4+ 2*z2*z4^7*z6^4+
    2*z3*z4^7*z6^4- 2*z4^8*z6^4+ 2*z2*z3*z4^5*z5*z6^4- 2*z2*z4^6*z5*z6^4-
    2*z3*z4^6*z5*z6^4+ 2*z4^7*z5*z6^4- 2*z2*z3*z4^5*z6^5+ 2*z2*z4^6*z6^5+
    2*z3*z4^6*z6^5- 2*z4^7*z6^5+ 2*z2*z3*z4^4*z5*z6^5- 2*z2*z4^5*z5*z6^5-
    2*z3*z4^5*z5*z6^5+ 2*z4^6*z5*z6^5- 2*z2*z3*z4^4*z6^6+ 2*z2*z4^5*z6^6+
    2*z3*z4^5*z6^6- 2*z4^6*z6^6+ 2*z2*z3*z4^3*z5*z6^6- 2*z2*z4^4*z5*z6^6-
    2*z3*z4^4*z5*z6^6+ 2*z4^5*z5*z6^6- 2*z2*z3*z4^3*z6^7+ 2*z2*z4^4*z6^7+
    2*z3*z4^4*z6^7- 2*z4^5*z6^7+ 2*z2*z3*z4^2*z5*z6^7- 2*z2*z4^3*z5*z6^7-
    2*z3*z4^3*z5*z6^7+ 2*z4^4*z5*z6^7- 2*z2*z3*z4^2*z6^8+ 2*z2*z4^3*z6^8+
    2*z3*z4^3*z6^8- 2*z4^4*z6^8+ 2*z2*z3*z4*z5*z6^8- 2*z2*z4^2*z5*z6^8-
    2*z3*z4^2*z5*z6^8+ 2*z4^3*z5*z6^8- 2*z2*z3*z4*z6^9+ 2*z2*z4^2*z6^9+
    2*z3*z4^2*z6^9- 2*z4^3*z6^9- 8*z2*z3*z5*z6^9- 2*z2*z4*z5*z6^9-
    2*z3*z4*z5*z6^9+ 2*z4^2*z5*z6^9+ 6*z2*z3*z6^10+ 2*z2*z4*z6^10+ 2*z3*z4*z6^10-
    2*z4^2*z6^10+ 6*z2*z5*z6^10+ 6*z3*z5*z6^10+ 2*z4*z5*z6^10- 4*z2*z6^11-
    4*z3*z6^11- 2*z4*z6^11- 4*z5*z6^11+ 2*z6^12+ 5*z2*z3*z4^8+ 4491*z2*z4^9+
    4491*z3*z4^9+ 8*z4^10- 4493*z2*z3*z4^7*z5+ 5*z2*z4^8*z5+ 5*z3*z4^8*z5+
    4491*z4^9*z5- 4488*z2*z3*z4^7*z6+ 4496*z2*z4^8*z6+ 4496*z3*z4^8*z6+
    4499*z4^9*z6+ 4478*z2*z3*z4^6*z5*z6- 4488*z2*z4^7*z5*z6- 4488*z3*z4^7*z5*z6+
    4496*z4^8*z5*z6- 4488*z2*z3*z4^6*z6^2+ 4496*z2*z4^7*z6^2+ 4496*z3*z4^7*z6^2+
    4499*z4^8*z6^2+ 4478*z2*z3*z4^5*z5*z6^2- 4488*z2*z4^6*z5*z6^2-
    4488*z3*z4^6*z5*z6^2+ 4496*z4^7*z5*z6^2- 4488*z2*z3*z4^5*z6^3+
    4496*z2*z4^6*z6^3+ 4496*z3*z4^6*z6^3+ 4499*z4^7*z6^3+ 4478*z2*z3*z4^4*z5*z6^3-
    4488*z2*z4^5*z5*z6^3- 4488*z3*z4^5*z5*z6^3+ 4496*z4^6*z5*z6^3-
    4488*z2*z3*z4^4*z6^4+ 4496*z2*z4^5*z6^4+ 4496*z3*z4^5*z6^4+ 4499*z4^6*z6^4+
    4478*z2*z3*z4^3*z5*z6^4- 4488*z2*z4^4*z5*z6^4- 4488*z3*z4^4*z5*z6^4+
    4496*z4^5*z5*z6^4- 4488*z2*z3*z4^3*z6^5+ 4496*z2*z4^4*z6^5+ 4496*z3*z4^4*z6^5+
    4499*z4^5*z6^5+ 4478*z2*z3*z4^2*z5*z6^5- 4488*z2*z4^3*z5*z6^5-
    4488*z3*z4^3*z5*z6^5+ 4496*z4^4*z5*z6^5- 4488*z2*z3*z4^2*z6^6+
    4496*z2*z4^3*z6^6+ 4496*z3*z4^3*z6^6+ 4499*z4^4*z6^6+ 4478*z2*z3*z4*z5*z6^6-
    4488*z2*z4^2*z5*z6^6- 4488*z3*z4^2*z5*z6^6+ 4496*z4^3*z5*z6^6-
    4488*z2*z3*z4*z6^7+ 4496*z2*z4^2*z6^7+ 4496*z3*z4^2*z6^7+ 4499*z4^3*z6^7-
    4493*z2*z3*z5*z6^7- 4488*z2*z4*z5*z6^7- 4488*z3*z4*z5*z6^7+ 4496*z4^2*z5*z6^7+
    5*z2*z3*z6^8+ 4496*z2*z4*z6^8+ 4496*z3*z4*z6^8+ 4499*z4^2*z6^8+ 5*z2*z5*z6^8+
    5*z3*z5*z6^8+ 4496*z4*z5*z6^8+ 4491*z2*z6^9+ 4491*z3*z6^9+ 4499*z4*z6^9+
    4491*z5*z6^9+ 8*z6^10- 2257*z2*z3*z4^6+ 4496*z2*z4^7+ 4496*z3*z4^7+ 2261*z4^8-
    4490*z2*z3*z4^5*z5- 2257*z2*z4^6*z5- 2257*z3*z4^6*z5+ 4496*z4^7*z5+
    2254*z2*z3*z4^5*z6+ 2239*z2*z4^6*z6+ 2239*z3*z4^6*z6- 2244*z4^7*z6-
    2224*z2*z3*z4^4*z5*z6+ 2254*z2*z4^5*z5*z6+ 2254*z3*z4^5*z5*z6+
    2239*z4^6*z5*z6+ 2254*z2*z3*z4^4*z6^2+ 2239*z2*z4^5*z6^2+ 2239*z3*z4^5*z6^2-
    2244*z4^6*z6^2- 2224*z2*z3*z4^3*z5*z6^2+ 2254*z2*z4^4*z5*z6^2+
    2254*z3*z4^4*z5*z6^2+ 2239*z4^5*z5*z6^2+ 2254*z2*z3*z4^3*z6^3+
    2239*z2*z4^4*z6^3+ 2239*z3*z4^4*z6^3- 2244*z4^5*z6^3- 2224*z2*z3*z4^2*z5*z6^3+
    2254*z2*z4^3*z5*z6^3+ 2254*z3*z4^3*z5*z6^3+ 2239*z4^4*z5*z6^3+
    2254*z2*z3*z4^2*z6^4+ 2239*z2*z4^3*z6^4+ 2239*z3*z4^3*z6^4- 2244*z4^4*z6^4-
    2224*z2*z3*z4*z5*z6^4+ 2254*z2*z4^2*z5*z6^4+ 2254*z3*z4^2*z5*z6^4+
    2239*z4^3*z5*z6^4+ 2254*z2*z3*z4*z6^5+ 2239*z2*z4^2*z6^5+ 2239*z3*z4^2*z6^5-
    2244*z4^3*z6^5- 4490*z2*z3*z5*z6^5+ 2254*z2*z4*z5*z6^5+ 2254*z3*z4*z5*z6^5+
    2239*z4^2*z5*z6^5- 2257*z2*z3*z6^6+ 2239*z2*z4*z6^6+ 2239*z3*z4*z6^6-
    2244*z4^2*z6^6- 2257*z2*z5*z6^6- 2257*z3*z5*z6^6+ 2239*z4*z5*z6^6+
    4496*z2*z6^7+ 4496*z3*z6^7- 2244*z4*z6^7+ 4496*z5*z6^7+ 2261*z6^8+
    4496*z2*z3*z4^4+ 2816*z2*z4^5+ 2816*z3*z4^5+ 1130*z4^6+ 1683*z2*z3*z4^3*z5+
    4496*z2*z4^4*z5+ 4496*z3*z4^4*z5+ 2816*z4^5*z5- 2822*z2*z3*z4^3*z6-
    1689*z2*z4^4*z6- 1689*z3*z4^4*z6+ 3946*z4^5*z6+ 556*z2*z3*z4^2*z5*z6-
    2822*z2*z4^3*z5*z6- 2822*z3*z4^3*z5*z6- 1689*z4^4*z5*z6- 2822*z2*z3*z4^2*z6^2-
    1689*z2*z4^3*z6^2- 1689*z3*z4^3*z6^2+ 3946*z4^4*z6^2+ 556*z2*z3*z4*z5*z6^2-
    2822*z2*z4^2*z5*z6^2- 2822*z3*z4^2*z5*z6^2- 1689*z4^3*z5*z6^2-
    2822*z2*z3*z4*z6^3- 1689*z2*z4^2*z6^3- 1689*z3*z4^2*z6^3+ 3946*z4^3*z6^3+
    1683*z2*z3*z5*z6^3- 2822*z2*z4*z5*z6^3- 2822*z3*z4*z5*z6^3- 1689*z4^2*z5*z6^3+
    4496*z2*z3*z6^4- 1689*z2*z4*z6^4- 1689*z3*z4*z6^4+ 3946*z4^2*z6^4+
    4496*z2*z5*z6^4+ 4496*z3*z5*z6^4- 1689*z4*z5*z6^4+ 2816*z2*z6^5+ 2816*z3*z6^5+
    3946*z4*z6^5+ 2816*z5*z6^5+ 1130*z6^6- 2460*z2*z3*z4^2+ 1549*z2*z4^3+
    1549*z3*z4^3+ 3867*z4^4+ 1688*z2*z3*z4*z5- 2460*z2*z4^2*z5- 2460*z3*z4^2*z5+
    1549*z4^3*z5- 772*z2*z3*z4*z6- 911*z2*z4^2*z6- 911*z3*z4^2*z6- 3585*z4^3*z6+
    1688*z2*z3*z5*z6- 772*z2*z4*z5*z6- 772*z3*z4*z5*z6- 911*z4^2*z5*z6-
    2460*z2*z3*z6^2- 911*z2*z4*z6^2- 911*z3*z4*z6^2- 3585*z4^2*z6^2-
    2460*z2*z5*z6^2- 2460*z3*z5*z6^2- 911*z4*z5*z6^2+ 1549*z2*z6^3+ 1549*z3*z6^3-
    3585*z4*z6^3+ 1549*z5*z6^3+ 3867*z6^4+ 2971*z2*z3- 4448*z2*z4- 4448*z3*z4+
    3445*z4^2+ 2971*z2*z5+ 2971*z3*z5- 4448*z4*z5- 4448*z2*z6- 4448*z3*z6-
    1003*z4*z6- 4448*z5*z6+ 3445*z6^2- 2092, - 8*z2*z3*z4*z5^9+ 6*z2*z3*z5^10+
    6*z2*z4*z5^10+ 6*z3*z4*z5^10- 4*z2*z5^11- 4*z3*z5^11- 4*z4*z5^11+ 2*z5^12+
    2*z2*z3*z4*z5^8*z6- 2*z2*z3*z5^9*z6- 2*z2*z4*z5^9*z6- 2*z3*z4*z5^9*z6+
    2*z2*z5^10*z6+ 2*z3*z5^10*z6+ 2*z4*z5^10*z6- 2*z5^11*z6+ 2*z2*z3*z4*z5^7*z6^2-
    2*z2*z3*z5^8*z6^2- 2*z2*z4*z5^8*z6^2- 2*z3*z4*z5^8*z6^2+ 2*z2*z5^9*z6^2+
    2*z3*z5^9*z6^2+ 2*z4*z5^9*z6^2- 2*z5^10*z6^2+ 2*z2*z3*z4*z5^6*z6^3-
    2*z2*z3*z5^7*z6^3- 2*z2*z4*z5^7*z6^3- 2*z3*z4*z5^7*z6^3+ 2*z2*z5^8*z6^3+
    2*z3*z5^8*z6^3+ 2*z4*z5^8*z6^3- 2*z5^9*z6^3+ 2*z2*z3*z4*z5^5*z6^4-
    2*z2*z3*z5^6*z6^4- 2*z2*z4*z5^6*z6^4- 2*z3*z4*z5^6*z6^4+ 2*z2*z5^7*z6^4+
    2*z3*z5^7*z6^4+ 2*z4*z5^7*z6^4- 2*z5^8*z6^4+ 2*z2*z3*z4*z5^4*z6^5-
    2*z2*z3*z5^5*z6^5- 2*z2*z4*z5^5*z6^5- 2*z3*z4*z5^5*z6^5+ 2*z2*z5^6*z6^5+
    2*z3*z5^6*z6^5+ 2*z4*z5^6*z6^5- 2*z5^7*z6^5+ 2*z2*z3*z4*z5^3*z6^6-
    2*z2*z3*z5^4*z6^6- 2*z2*z4*z5^4*z6^6- 2*z3*z4*z5^4*z6^6+ 2*z2*z5^5*z6^6+
    2*z3*z5^5*z6^6+ 2*z4*z5^5*z6^6- 2*z5^6*z6^6+ 2*z2*z3*z4*z5^2*z6^7-
    2*z2*z3*z5^3*z6^7- 2*z2*z4*z5^3*z6^7- 2*z3*z4*z5^3*z6^7+ 2*z2*z5^4*z6^7+
    2*z3*z5^4*z6^7+ 2*z4*z5^4*z6^7- 2*z5^5*z6^7+ 2*z2*z3*z4*z5*z6^8-
    2*z2*z3*z5^2*z6^8- 2*z2*z4*z5^2*z6^8- 2*z3*z4*z5^2*z6^8+ 2*z2*z5^3*z6^8+
    2*z3*z5^3*z6^8+ 2*z4*z5^3*z6^8- 2*z5^4*z6^8- 8*z2*z3*z4*z6^9- 2*z2*z3*z5*z6^9-
    2*z2*z4*z5*z6^9- 2*z3*z4*z5*z6^9+ 2*z2*z5^2*z6^9+ 2*z3*z5^2*z6^9+
    2*z4*z5^2*z6^9- 2*z5^3*z6^9+ 6*z2*z3*z6^10+ 6*z2*z4*z6^10+ 6*z3*z4*z6^10+
    2*z2*z5*z6^10+ 2*z3*z5*z6^10+ 2*z4*z5*z6^10- 2*z5^2*z6^10- 4*z2*z6^11-
    4*z3*z6^11- 4*z4*z6^11- 2*z5*z6^11+ 2*z6^12- 4493*z2*z3*z4*z5^7+ 5*z2*z3*z5^8+
    5*z2*z4*z5^8+ 5*z3*z4*z5^8+ 4491*z2*z5^9+ 4491*z3*z5^9+ 4491*z4*z5^9+ 8*z5^10+
    4478*z2*z3*z4*z5^6*z6- 4488*z2*z3*z5^7*z6- 4488*z2*z4*z5^7*z6-
    4488*z3*z4*z5^7*z6+ 4496*z2*z5^8*z6+ 4496*z3*z5^8*z6+ 4496*z4*z5^8*z6+
    4499*z5^9*z6+ 4478*z2*z3*z4*z5^5*z6^2- 4488*z2*z3*z5^6*z6^2-
    4488*z2*z4*z5^6*z6^2- 4488*z3*z4*z5^6*z6^2+ 4496*z2*z5^7*z6^2+
    4496*z3*z5^7*z6^2+ 4496*z4*z5^7*z6^2+ 4499*z5^8*z6^2+ 4478*z2*z3*z4*z5^4*z6^3-
    4488*z2*z3*z5^5*z6^3- 4488*z2*z4*z5^5*z6^3- 4488*z3*z4*z5^5*z6^3+
    4496*z2*z5^6*z6^3+ 4496*z3*z5^6*z6^3+ 4496*z4*z5^6*z6^3+ 4499*z5^7*z6^3+
    4478*z2*z3*z4*z5^3*z6^4- 4488*z2*z3*z5^4*z6^4- 4488*z2*z4*z5^4*z6^4-
    4488*z3*z4*z5^4*z6^4+ 4496*z2*z5^5*z6^4+ 4496*z3*z5^5*z6^4+ 4496*z4*z5^5*z6^4+
    4499*z5^6*z6^4+ 4478*z2*z3*z4*z5^2*z6^5- 4488*z2*z3*z5^3*z6^5-
    4488*z2*z4*z5^3*z6^5- 4488*z3*z4*z5^3*z6^5+ 4496*z2*z5^4*z6^5+
    4496*z3*z5^4*z6^5+ 4496*z4*z5^4*z6^5+ 4499*z5^5*z6^5+ 4478*z2*z3*z4*z5*z6^6-
    4488*z2*z3*z5^2*z6^6- 4488*z2*z4*z5^2*z6^6- 4488*z3*z4*z5^2*z6^6+
    4496*z2*z5^3*z6^6+ 4496*z3*z5^3*z6^6+ 4496*z4*z5^3*z6^6+ 4499*z5^4*z6^6-
    4493*z2*z3*z4*z6^7- 4488*z2*z3*z5*z6^7- 4488*z2*z4*z5*z6^7-
    4488*z3*z4*z5*z6^7+ 4496*z2*z5^2*z6^7+ 4496*z3*z5^2*z6^7+ 4496*z4*z5^2*z6^7+
    4499*z5^3*z6^7+ 5*z2*z3*z6^8+ 5*z2*z4*z6^8+ 5*z3*z4*z6^8+ 4496*z2*z5*z6^8+
    4496*z3*z5*z6^8+ 4496*z4*z5*z6^8+ 4499*z5^2*z6^8+ 4491*z2*z6^9+ 4491*z3*z6^9+
    4491*z4*z6^9+ 4499*z5*z6^9+ 8*z6^10- 4490*z2*z3*z4*z5^5- 2257*z2*z3*z5^6-
    2257*z2*z4*z5^6- 2257*z3*z4*z5^6+ 4496*z2*z5^7+ 4496*z3*z5^7+ 4496*z4*z5^7+
    2261*z5^8- 2224*z2*z3*z4*z5^4*z6+ 2254*z2*z3*z5^5*z6+ 2254*z2*z4*z5^5*z6+
    2254*z3*z4*z5^5*z6+ 2239*z2*z5^6*z6+ 2239*z3*z5^6*z6+ 2239*z4*z5^6*z6-
    2244*z5^7*z6- 2224*z2*z3*z4*z5^3*z6^2+ 2254*z2*z3*z5^4*z6^2+
    2254*z2*z4*z5^4*z6^2+ 2254*z3*z4*z5^4*z6^2+ 2239*z2*z5^5*z6^2+
    2239*z3*z5^5*z6^2+ 2239*z4*z5^5*z6^2- 2244*z5^6*z6^2- 2224*z2*z3*z4*z5^2*z6^3+
    2254*z2*z3*z5^3*z6^3+ 2254*z2*z4*z5^3*z6^3+ 2254*z3*z4*z5^3*z6^3+
    2239*z2*z5^4*z6^3+ 2239*z3*z5^4*z6^3+ 2239*z4*z5^4*z6^3- 2244*z5^5*z6^3-
    2224*z2*z3*z4*z5*z6^4+ 2254*z2*z3*z5^2*z6^4+ 2254*z2*z4*z5^2*z6^4+
    2254*z3*z4*z5^2*z6^4+ 2239*z2*z5^3*z6^4+ 2239*z3*z5^3*z6^4+ 2239*z4*z5^3*z6^4-
    2244*z5^4*z6^4- 4490*z2*z3*z4*z6^5+ 2254*z2*z3*z5*z6^5+ 2254*z2*z4*z5*z6^5+
    2254*z3*z4*z5*z6^5+ 2239*z2*z5^2*z6^5+ 2239*z3*z5^2*z6^5+ 2239*z4*z5^2*z6^5-
    2244*z5^3*z6^5- 2257*z2*z3*z6^6- 2257*z2*z4*z6^6- 2257*z3*z4*z6^6+
    2239*z2*z5*z6^6+ 2239*z3*z5*z6^6+ 2239*z4*z5*z6^6- 2244*z5^2*z6^6+
    4496*z2*z6^7+ 4496*z3*z6^7+ 4496*z4*z6^7- 2244*z5*z6^7+ 2261*z6^8+
    1683*z2*z3*z4*z5^3+ 4496*z2*z3*z5^4+ 4496*z2*z4*z5^4+ 4496*z3*z4*z5^4+
    2816*z2*z5^5+ 2816*z3*z5^5+ 2816*z4*z5^5+ 1130*z5^6+ 556*z2*z3*z4*z5^2*z6-
    2822*z2*z3*z5^3*z6- 2822*z2*z4*z5^3*z6- 2822*z3*z4*z5^3*z6- 1689*z2*z5^4*z6-
    1689*z3*z5^4*z6- 1689*z4*z5^4*z6+ 3946*z5^5*z6+ 556*z2*z3*z4*z5*z6^2-
    2822*z2*z3*z5^2*z6^2- 2822*z2*z4*z5^2*z6^2- 2822*z3*z4*z5^2*z6^2-
    1689*z2*z5^3*z6^2- 1689*z3*z5^3*z6^2- 1689*z4*z5^3*z6^2+ 3946*z5^4*z6^2+
    1683*z2*z3*z4*z6^3- 2822*z2*z3*z5*z6^3- 2822*z2*z4*z5*z6^3-
    2822*z3*z4*z5*z6^3- 1689*z2*z5^2*z6^3- 1689*z3*z5^2*z6^3- 1689*z4*z5^2*z6^3+
    3946*z5^3*z6^3+ 4496*z2*z3*z6^4+ 4496*z2*z4*z6^4+ 4496*z3*z4*z6^4-
    1689*z2*z5*z6^4- 1689*z3*z5*z6^4- 1689*z4*z5*z6^4+ 3946*z5^2*z6^4+
    2816*z2*z6^5+ 2816*z3*z6^5+ 2816*z4*z6^5+ 3946*z5*z6^5+ 1130*z6^6+
    1688*z2*z3*z4*z5- 2460*z2*z3*z5^2- 2460*z2*z4*z5^2- 2460*z3*z4*z5^2+
    1549*z2*z5^3+ 1549*z3*z5^3+ 1549*z4*z5^3+ 3867*z5^4+ 1688*z2*z3*z4*z6-
    772*z2*z3*z5*z6- 772*z2*z4*z5*z6- 772*z3*z4*z5*z6- 911*z2*z5^2*z6-
    911*z3*z5^2*z6- 911*z4*z5^2*z6- 3585*z5^3*z6- 2460*z2*z3*z6^2-
    2460*z2*z4*z6^2- 2460*z3*z4*z6^2- 911*z2*z5*z6^2- 911*z3*z5*z6^2-
    911*z4*z5*z6^2- 3585*z5^2*z6^2+ 1549*z2*z6^3+ 1549*z3*z6^3+ 1549*z4*z6^3-
    3585*z5*z6^3+ 3867*z6^4+ 2971*z2*z3+ 2971*z2*z4+ 2971*z3*z4- 4448*z2*z5-
    4448*z3*z5- 4448*z4*z5+ 3445*z5^2- 4448*z2*z6- 4448*z3*z6- 4448*z4*z6-
    1003*z5*z6+ 3445*z6^2- 2092, z1*z2^2*z3^2*z4^2*z5^2*z6^2-
    2250*z1*z2^2*z3^2*z4^2*z5^2- 2250*z1*z2^2*z3^2*z4^2*z6^2-
    2250*z1*z2^2*z3^2*z5^2*z6^2- 2250*z1*z2^2*z4^2*z5^2*z6^2-
    2250*z1*z3^2*z4^2*z5^2*z6^2+ 3938*z1*z2^2*z3^2*z4^2+ 3938*z1*z2^2*z3^2*z5^2+
    3938*z1*z2^2*z4^2*z5^2+ 3938*z1*z3^2*z4^2*z5^2+ 3938*z1*z2^2*z3^2*z6^2+
    3938*z1*z2^2*z4^2*z6^2+ 3938*z1*z3^2*z4^2*z6^2+ 3938*z1*z2^2*z5^2*z6^2+
    3938*z1*z3^2*z5^2*z6^2+ 3938*z1*z4^2*z5^2*z6^2- 3516*z1*z2^2*z3^2-
    3516*z1*z2^2*z4^2- 3516*z1*z3^2*z4^2- 3516*z1*z2^2*z5^2- 3516*z1*z3^2*z5^2-
    3516*z1*z4^2*z5^2- 3516*z1*z2^2*z6^2- 3516*z1*z3^2*z6^2- 3516*z1*z4^2*z6^2-
    3516*z1*z5^2*z6^2- 879*z1*z2^2- 879*z1*z3^2- 879*z1*z4^2- 879*z1*z5^2-
    879*z1*z6^2- 2470*z1- 1, - z2- z3- z4- z5- z6+ z7, - z2*z3- z2*z4- z3*z4-
    z2*z5- z3*z5- z4*z5- z2*z6- z3*z6- z4*z6- z5*z6+ z8, - z2*z3*z4- z2*z3*z5-
    z2*z4*z5- z3*z4*z5- z2*z3*z6- z2*z4*z6- z3*z4*z6- z2*z5*z6- z3*z5*z6-
    z4*z5*z6+ z9, - z2*z3*z4*z5- z2*z3*z4*z6- z2*z3*z5*z6- z2*z4*z5*z6-
    z3*z4*z5*z6+ z10, - z2*z3*z4*z5*z6+ z11
    )
  R, id
end

function yang_l10_m5_v2(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 12
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "z$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
    2*z3^13- 4*z3^12*z4- 4*z3^12*z5+ 6*z3^11*z4*z5- 4*z3^12*z6+ 6*z3^11*z4*z6+
    6*z3^11*z5*z6- 8*z3^10*z4*z5*z6- 4*z3^12*z7+ 6*z3^11*z4*z7+ 6*z3^11*z5*z7-
    8*z3^10*z4*z5*z7+ 6*z3^11*z6*z7- 8*z3^10*z4*z6*z7- 8*z3^10*z5*z6*z7+
    10*z3^9*z4*z5*z6*z7+ 8*z3^11+ 4491*z3^10*z4+ 4491*z3^10*z5+ 5*z3^9*z4*z5+
    4491*z3^10*z6+ 5*z3^9*z4*z6+ 5*z3^9*z5*z6- 4493*z3^8*z4*z5*z6+ 4491*z3^10*z7+
    5*z3^9*z4*z7+ 5*z3^9*z5*z7- 4493*z3^8*z4*z5*z7+ 5*z3^9*z6*z7-
    4493*z3^8*z4*z6*z7- 4493*z3^8*z5*z6*z7- 30*z3^7*z4*z5*z6*z7+ 2261*z3^9+
    4496*z3^8*z4+ 4496*z3^8*z5- 2257*z3^7*z4*z5+ 4496*z3^8*z6- 2257*z3^7*z4*z6-
    2257*z3^7*z5*z6- 4490*z3^6*z4*z5*z6+ 4496*z3^8*z7- 2257*z3^7*z4*z7-
    2257*z3^7*z5*z7- 4490*z3^6*z4*z5*z7- 2257*z3^7*z6*z7- 4490*z3^6*z4*z6*z7-
    4490*z3^6*z5*z6*z7+ 2266*z3^5*z4*z5*z6*z7+ 1130*z3^7+ 2816*z3^6*z4+
    2816*z3^6*z5+ 4496*z3^5*z4*z5+ 2816*z3^6*z6+ 4496*z3^5*z4*z6+ 4496*z3^5*z5*z6+
    1683*z3^4*z4*z5*z6+ 2816*z3^6*z7+ 4496*z3^5*z4*z7+ 4496*z3^5*z5*z7+
    1683*z3^4*z4*z5*z7+ 4496*z3^5*z6*z7+ 1683*z3^4*z4*z6*z7+ 1683*z3^4*z5*z6*z7-
    1127*z3^3*z4*z5*z6*z7+ 3867*z3^5+ 1549*z3^4*z4+ 1549*z3^4*z5- 2460*z3^3*z4*z5+
    1549*z3^4*z6- 2460*z3^3*z4*z6- 2460*z3^3*z5*z6+ 1688*z3^2*z4*z5*z6+
    1549*z3^4*z7- 2460*z3^3*z4*z7- 2460*z3^3*z5*z7+ 1688*z3^2*z4*z5*z7-
    2460*z3^3*z6*z7+ 1688*z3^2*z4*z6*z7+ 1688*z3^2*z5*z6*z7+ 211*z3*z4*z5*z6*z7+
    3445*z3^3- 4448*z3^2*z4- 4448*z3^2*z5- 1090*z3*z4*z5- 4448*z3^2*z6-
    1090*z3*z4*z6- 1090*z3*z5*z6- 4061*z4*z5*z6- 4448*z3^2*z7- 1090*z3*z4*z7-
    1090*z3*z5*z7- 4061*z4*z5*z7- 1090*z3*z6*z7- 4061*z4*z6*z7- 4061*z5*z6*z7+
    1969*z3+ 4061*z4+ 4061*z5+ 4061*z6+ 4061*z7, - 4*z3*z4^12+ 2*z4^13+
    6*z3*z4^11*z5- 4*z4^12*z5+ 6*z3*z4^11*z6- 4*z4^12*z6- 8*z3*z4^10*z5*z6+
    6*z4^11*z5*z6+ 6*z3*z4^11*z7- 4*z4^12*z7- 8*z3*z4^10*z5*z7+ 6*z4^11*z5*z7-
    8*z3*z4^10*z6*z7+ 6*z4^11*z6*z7+ 10*z3*z4^9*z5*z6*z7- 8*z4^10*z5*z6*z7+
    4491*z3*z4^10+ 8*z4^11+ 5*z3*z4^9*z5+ 4491*z4^10*z5+ 5*z3*z4^9*z6+
    4491*z4^10*z6- 4493*z3*z4^8*z5*z6+ 5*z4^9*z5*z6+ 5*z3*z4^9*z7+ 4491*z4^10*z7-
    4493*z3*z4^8*z5*z7+ 5*z4^9*z5*z7- 4493*z3*z4^8*z6*z7+ 5*z4^9*z6*z7-
    30*z3*z4^7*z5*z6*z7- 4493*z4^8*z5*z6*z7+ 4496*z3*z4^8+ 2261*z4^9-
    2257*z3*z4^7*z5+ 4496*z4^8*z5- 2257*z3*z4^7*z6+ 4496*z4^8*z6-
    4490*z3*z4^6*z5*z6- 2257*z4^7*z5*z6- 2257*z3*z4^7*z7+ 4496*z4^8*z7-
    4490*z3*z4^6*z5*z7- 2257*z4^7*z5*z7- 4490*z3*z4^6*z6*z7- 2257*z4^7*z6*z7+
    2266*z3*z4^5*z5*z6*z7- 4490*z4^6*z5*z6*z7+ 2816*z3*z4^6+ 1130*z4^7+
    4496*z3*z4^5*z5+ 2816*z4^6*z5+ 4496*z3*z4^5*z6+ 2816*z4^6*z6+
    1683*z3*z4^4*z5*z6+ 4496*z4^5*z5*z6+ 4496*z3*z4^5*z7+ 2816*z4^6*z7+
    1683*z3*z4^4*z5*z7+ 4496*z4^5*z5*z7+ 1683*z3*z4^4*z6*z7+ 4496*z4^5*z6*z7-
    1127*z3*z4^3*z5*z6*z7+ 1683*z4^4*z5*z6*z7+ 1549*z3*z4^4+ 3867*z4^5-
    2460*z3*z4^3*z5+ 1549*z4^4*z5- 2460*z3*z4^3*z6+ 1549*z4^4*z6+
    1688*z3*z4^2*z5*z6- 2460*z4^3*z5*z6- 2460*z3*z4^3*z7+ 1549*z4^4*z7+
    1688*z3*z4^2*z5*z7- 2460*z4^3*z5*z7+ 1688*z3*z4^2*z6*z7- 2460*z4^3*z6*z7+
    211*z3*z4*z5*z6*z7+ 1688*z4^2*z5*z6*z7- 4448*z3*z4^2+ 3445*z4^3-
    1090*z3*z4*z5- 4448*z4^2*z5- 1090*z3*z4*z6- 4448*z4^2*z6- 4061*z3*z5*z6-
    1090*z4*z5*z6- 1090*z3*z4*z7- 4448*z4^2*z7- 4061*z3*z5*z7- 1090*z4*z5*z7-
    4061*z3*z6*z7- 1090*z4*z6*z7- 4061*z5*z6*z7+ 4061*z3+ 1969*z4+ 4061*z5+
    4061*z6+ 4061*z7, 6*z3*z4*z5^11- 4*z3*z5^12- 4*z4*z5^12+ 2*z5^13-
    8*z3*z4*z5^10*z6+ 6*z3*z5^11*z6+ 6*z4*z5^11*z6- 4*z5^12*z6- 8*z3*z4*z5^10*z7+
    6*z3*z5^11*z7+ 6*z4*z5^11*z7- 4*z5^12*z7+ 10*z3*z4*z5^9*z6*z7-
    8*z3*z5^10*z6*z7- 8*z4*z5^10*z6*z7+ 6*z5^11*z6*z7+ 5*z3*z4*z5^9+
    4491*z3*z5^10+ 4491*z4*z5^10+ 8*z5^11- 4493*z3*z4*z5^8*z6+ 5*z3*z5^9*z6+
    5*z4*z5^9*z6+ 4491*z5^10*z6- 4493*z3*z4*z5^8*z7+ 5*z3*z5^9*z7+ 5*z4*z5^9*z7+
    4491*z5^10*z7- 30*z3*z4*z5^7*z6*z7- 4493*z3*z5^8*z6*z7- 4493*z4*z5^8*z6*z7+
    5*z5^9*z6*z7- 2257*z3*z4*z5^7+ 4496*z3*z5^8+ 4496*z4*z5^8+ 2261*z5^9-
    4490*z3*z4*z5^6*z6- 2257*z3*z5^7*z6- 2257*z4*z5^7*z6+ 4496*z5^8*z6-
    4490*z3*z4*z5^6*z7- 2257*z3*z5^7*z7- 2257*z4*z5^7*z7+ 4496*z5^8*z7+
    2266*z3*z4*z5^5*z6*z7- 4490*z3*z5^6*z6*z7- 4490*z4*z5^6*z6*z7-
    2257*z5^7*z6*z7+ 4496*z3*z4*z5^5+ 2816*z3*z5^6+ 2816*z4*z5^6+ 1130*z5^7+
    1683*z3*z4*z5^4*z6+ 4496*z3*z5^5*z6+ 4496*z4*z5^5*z6+ 2816*z5^6*z6+
    1683*z3*z4*z5^4*z7+ 4496*z3*z5^5*z7+ 4496*z4*z5^5*z7+ 2816*z5^6*z7-
    1127*z3*z4*z5^3*z6*z7+ 1683*z3*z5^4*z6*z7+ 1683*z4*z5^4*z6*z7+
    4496*z5^5*z6*z7- 2460*z3*z4*z5^3+ 1549*z3*z5^4+ 1549*z4*z5^4+ 3867*z5^5+
    1688*z3*z4*z5^2*z6- 2460*z3*z5^3*z6- 2460*z4*z5^3*z6+ 1549*z5^4*z6+
    1688*z3*z4*z5^2*z7- 2460*z3*z5^3*z7- 2460*z4*z5^3*z7+ 1549*z5^4*z7+
    211*z3*z4*z5*z6*z7+ 1688*z3*z5^2*z6*z7+ 1688*z4*z5^2*z6*z7- 2460*z5^3*z6*z7-
    1090*z3*z4*z5- 4448*z3*z5^2- 4448*z4*z5^2+ 3445*z5^3- 4061*z3*z4*z6-
    1090*z3*z5*z6- 1090*z4*z5*z6- 4448*z5^2*z6- 4061*z3*z4*z7- 1090*z3*z5*z7-
    1090*z4*z5*z7- 4448*z5^2*z7- 4061*z3*z6*z7- 4061*z4*z6*z7- 1090*z5*z6*z7+
    4061*z3+ 4061*z4+ 1969*z5+ 4061*z6+ 4061*z7, - 8*z3*z4*z5*z6^10+
    6*z3*z4*z6^11+ 6*z3*z5*z6^11+ 6*z4*z5*z6^11- 4*z3*z6^12- 4*z4*z6^12-
    4*z5*z6^12+ 2*z6^13+ 10*z3*z4*z5*z6^9*z7- 8*z3*z4*z6^10*z7- 8*z3*z5*z6^10*z7-
    8*z4*z5*z6^10*z7+ 6*z3*z6^11*z7+ 6*z4*z6^11*z7+ 6*z5*z6^11*z7- 4*z6^12*z7-
    4493*z3*z4*z5*z6^8+ 5*z3*z4*z6^9+ 5*z3*z5*z6^9+ 5*z4*z5*z6^9+ 4491*z3*z6^10+
    4491*z4*z6^10+ 4491*z5*z6^10+ 8*z6^11- 30*z3*z4*z5*z6^7*z7-
    4493*z3*z4*z6^8*z7- 4493*z3*z5*z6^8*z7- 4493*z4*z5*z6^8*z7+ 5*z3*z6^9*z7+
    5*z4*z6^9*z7+ 5*z5*z6^9*z7+ 4491*z6^10*z7- 4490*z3*z4*z5*z6^6-
    2257*z3*z4*z6^7- 2257*z3*z5*z6^7- 2257*z4*z5*z6^7+ 4496*z3*z6^8+ 4496*z4*z6^8+
    4496*z5*z6^8+ 2261*z6^9+ 2266*z3*z4*z5*z6^5*z7- 4490*z3*z4*z6^6*z7-
    4490*z3*z5*z6^6*z7- 4490*z4*z5*z6^6*z7- 2257*z3*z6^7*z7- 2257*z4*z6^7*z7-
    2257*z5*z6^7*z7+ 4496*z6^8*z7+ 1683*z3*z4*z5*z6^4+ 4496*z3*z4*z6^5+
    4496*z3*z5*z6^5+ 4496*z4*z5*z6^5+ 2816*z3*z6^6+ 2816*z4*z6^6+ 2816*z5*z6^6+
    1130*z6^7- 1127*z3*z4*z5*z6^3*z7+ 1683*z3*z4*z6^4*z7+ 1683*z3*z5*z6^4*z7+
    1683*z4*z5*z6^4*z7+ 4496*z3*z6^5*z7+ 4496*z4*z6^5*z7+ 4496*z5*z6^5*z7+
    2816*z6^6*z7+ 1688*z3*z4*z5*z6^2- 2460*z3*z4*z6^3- 2460*z3*z5*z6^3-
    2460*z4*z5*z6^3+ 1549*z3*z6^4+ 1549*z4*z6^4+ 1549*z5*z6^4+ 3867*z6^5+
    211*z3*z4*z5*z6*z7+ 1688*z3*z4*z6^2*z7+ 1688*z3*z5*z6^2*z7+
    1688*z4*z5*z6^2*z7- 2460*z3*z6^3*z7- 2460*z4*z6^3*z7- 2460*z5*z6^3*z7+
    1549*z6^4*z7- 4061*z3*z4*z5- 1090*z3*z4*z6- 1090*z3*z5*z6- 1090*z4*z5*z6-
    4448*z3*z6^2- 4448*z4*z6^2- 4448*z5*z6^2+ 3445*z6^3- 4061*z3*z4*z7-
    4061*z3*z5*z7- 4061*z4*z5*z7- 1090*z3*z6*z7- 1090*z4*z6*z7- 1090*z5*z6*z7-
    4448*z6^2*z7+ 4061*z3+ 4061*z4+ 4061*z5+ 1969*z6+ 4061*z7,
    10*z3*z4*z5*z6*z7^9- 8*z3*z4*z5*z7^10- 8*z3*z4*z6*z7^10- 8*z3*z5*z6*z7^10-
    8*z4*z5*z6*z7^10+ 6*z3*z4*z7^11+ 6*z3*z5*z7^11+ 6*z4*z5*z7^11+ 6*z3*z6*z7^11+
    6*z4*z6*z7^11+ 6*z5*z6*z7^11- 4*z3*z7^12- 4*z4*z7^12- 4*z5*z7^12- 4*z6*z7^12+
    2*z7^13- 30*z3*z4*z5*z6*z7^7- 4493*z3*z4*z5*z7^8- 4493*z3*z4*z6*z7^8-
    4493*z3*z5*z6*z7^8- 4493*z4*z5*z6*z7^8+ 5*z3*z4*z7^9+ 5*z3*z5*z7^9+
    5*z4*z5*z7^9+ 5*z3*z6*z7^9+ 5*z4*z6*z7^9+ 5*z5*z6*z7^9+ 4491*z3*z7^10+
    4491*z4*z7^10+ 4491*z5*z7^10+ 4491*z6*z7^10+ 8*z7^11+ 2266*z3*z4*z5*z6*z7^5-
    4490*z3*z4*z5*z7^6- 4490*z3*z4*z6*z7^6- 4490*z3*z5*z6*z7^6-
    4490*z4*z5*z6*z7^6- 2257*z3*z4*z7^7- 2257*z3*z5*z7^7- 2257*z4*z5*z7^7-
    2257*z3*z6*z7^7- 2257*z4*z6*z7^7- 2257*z5*z6*z7^7+ 4496*z3*z7^8+ 4496*z4*z7^8+
    4496*z5*z7^8+ 4496*z6*z7^8+ 2261*z7^9- 1127*z3*z4*z5*z6*z7^3+
    1683*z3*z4*z5*z7^4+ 1683*z3*z4*z6*z7^4+ 1683*z3*z5*z6*z7^4+
    1683*z4*z5*z6*z7^4+ 4496*z3*z4*z7^5+ 4496*z3*z5*z7^5+ 4496*z4*z5*z7^5+
    4496*z3*z6*z7^5+ 4496*z4*z6*z7^5+ 4496*z5*z6*z7^5+ 2816*z3*z7^6+ 2816*z4*z7^6+
    2816*z5*z7^6+ 2816*z6*z7^6+ 1130*z7^7+ 211*z3*z4*z5*z6*z7+ 1688*z3*z4*z5*z7^2+
    1688*z3*z4*z6*z7^2+ 1688*z3*z5*z6*z7^2+ 1688*z4*z5*z6*z7^2- 2460*z3*z4*z7^3-
    2460*z3*z5*z7^3- 2460*z4*z5*z7^3- 2460*z3*z6*z7^3- 2460*z4*z6*z7^3-
    2460*z5*z6*z7^3+ 1549*z3*z7^4+ 1549*z4*z7^4+ 1549*z5*z7^4+ 1549*z6*z7^4+
    3867*z7^5- 4061*z3*z4*z5- 4061*z3*z4*z6- 4061*z3*z5*z6- 4061*z4*z5*z6-
    1090*z3*z4*z7- 1090*z3*z5*z7- 1090*z4*z5*z7- 1090*z3*z6*z7- 1090*z4*z6*z7-
    1090*z5*z6*z7- 4448*z3*z7^2- 4448*z4*z7^2- 4448*z5*z7^2- 4448*z6*z7^2+
    3445*z7^3+ 4061*z3+ 4061*z4+ 4061*z5+ 4061*z6+ 1969*z7, z1*z3^4*z4^3*z5^2*z6-
    z1*z3^3*z4^4*z5^2*z6- z1*z3^4*z4^2*z5^3*z6+ z1*z3^2*z4^4*z5^3*z6+
    z1*z3^3*z4^2*z5^4*z6- z1*z3^2*z4^3*z5^4*z6- z1*z3^4*z4^3*z5*z6^2+
    z1*z3^3*z4^4*z5*z6^2+ z1*z3^4*z4*z5^3*z6^2- z1*z3*z4^4*z5^3*z6^2-
    z1*z3^3*z4*z5^4*z6^2+ z1*z3*z4^3*z5^4*z6^2+ z1*z3^4*z4^2*z5*z6^3-
    z1*z3^2*z4^4*z5*z6^3- z1*z3^4*z4*z5^2*z6^3+ z1*z3*z4^4*z5^2*z6^3+
    z1*z3^2*z4*z5^4*z6^3- z1*z3*z4^2*z5^4*z6^3- z1*z3^3*z4^2*z5*z6^4+
    z1*z3^2*z4^3*z5*z6^4+ z1*z3^3*z4*z5^2*z6^4- z1*z3*z4^3*z5^2*z6^4-
    z1*z3^2*z4*z5^3*z6^4+ z1*z3*z4^2*z5^3*z6^4- z1*z3^4*z4^3*z5^2*z7+
    z1*z3^3*z4^4*z5^2*z7+ z1*z3^4*z4^2*z5^3*z7- z1*z3^2*z4^4*z5^3*z7-
    z1*z3^3*z4^2*z5^4*z7+ z1*z3^2*z4^3*z5^4*z7+ z1*z3^4*z4^3*z6^2*z7-
    z1*z3^3*z4^4*z6^2*z7- z1*z3^4*z5^3*z6^2*z7+ z1*z4^4*z5^3*z6^2*z7+
    z1*z3^3*z5^4*z6^2*z7- z1*z4^3*z5^4*z6^2*z7- z1*z3^4*z4^2*z6^3*z7+
    z1*z3^2*z4^4*z6^3*z7+ z1*z3^4*z5^2*z6^3*z7- z1*z4^4*z5^2*z6^3*z7-
    z1*z3^2*z5^4*z6^3*z7+ z1*z4^2*z5^4*z6^3*z7+ z1*z3^3*z4^2*z6^4*z7-
    z1*z3^2*z4^3*z6^4*z7- z1*z3^3*z5^2*z6^4*z7+ z1*z4^3*z5^2*z6^4*z7+
    z1*z3^2*z5^3*z6^4*z7- z1*z4^2*z5^3*z6^4*z7+ z1*z3^4*z4^3*z5*z7^2-
    z1*z3^3*z4^4*z5*z7^2- z1*z3^4*z4*z5^3*z7^2+ z1*z3*z4^4*z5^3*z7^2+
    z1*z3^3*z4*z5^4*z7^2- z1*z3*z4^3*z5^4*z7^2- z1*z3^4*z4^3*z6*z7^2+
    z1*z3^3*z4^4*z6*z7^2+ z1*z3^4*z5^3*z6*z7^2- z1*z4^4*z5^3*z6*z7^2-
    z1*z3^3*z5^4*z6*z7^2+ z1*z4^3*z5^4*z6*z7^2+ z1*z3^4*z4*z6^3*z7^2-
    z1*z3*z4^4*z6^3*z7^2- z1*z3^4*z5*z6^3*z7^2+ z1*z4^4*z5*z6^3*z7^2+
    z1*z3*z5^4*z6^3*z7^2- z1*z4*z5^4*z6^3*z7^2- z1*z3^3*z4*z6^4*z7^2+
    z1*z3*z4^3*z6^4*z7^2+ z1*z3^3*z5*z6^4*z7^2- z1*z4^3*z5*z6^4*z7^2-
    z1*z3*z5^3*z6^4*z7^2+ z1*z4*z5^3*z6^4*z7^2- z1*z3^4*z4^2*z5*z7^3+
    z1*z3^2*z4^4*z5*z7^3+ z1*z3^4*z4*z5^2*z7^3- z1*z3*z4^4*z5^2*z7^3-
    z1*z3^2*z4*z5^4*z7^3+ z1*z3*z4^2*z5^4*z7^3+ z1*z3^4*z4^2*z6*z7^3-
    z1*z3^2*z4^4*z6*z7^3- z1*z3^4*z5^2*z6*z7^3+ z1*z4^4*z5^2*z6*z7^3+
    z1*z3^2*z5^4*z6*z7^3- z1*z4^2*z5^4*z6*z7^3- z1*z3^4*z4*z6^2*z7^3+
    z1*z3*z4^4*z6^2*z7^3+ z1*z3^4*z5*z6^2*z7^3- z1*z4^4*z5*z6^2*z7^3-
    z1*z3*z5^4*z6^2*z7^3+ z1*z4*z5^4*z6^2*z7^3+ z1*z3^2*z4*z6^4*z7^3-
    z1*z3*z4^2*z6^4*z7^3- z1*z3^2*z5*z6^4*z7^3+ z1*z4^2*z5*z6^4*z7^3+
    z1*z3*z5^2*z6^4*z7^3- z1*z4*z5^2*z6^4*z7^3+ z1*z3^3*z4^2*z5*z7^4-
    z1*z3^2*z4^3*z5*z7^4- z1*z3^3*z4*z5^2*z7^4+ z1*z3*z4^3*z5^2*z7^4+
    z1*z3^2*z4*z5^3*z7^4- z1*z3*z4^2*z5^3*z7^4- z1*z3^3*z4^2*z6*z7^4+
    z1*z3^2*z4^3*z6*z7^4+ z1*z3^3*z5^2*z6*z7^4- z1*z4^3*z5^2*z6*z7^4-
    z1*z3^2*z5^3*z6*z7^4+ z1*z4^2*z5^3*z6*z7^4+ z1*z3^3*z4*z6^2*z7^4-
    z1*z3*z4^3*z6^2*z7^4- z1*z3^3*z5*z6^2*z7^4+ z1*z4^3*z5*z6^2*z7^4+
    z1*z3*z5^3*z6^2*z7^4- z1*z4*z5^3*z6^2*z7^4- z1*z3^2*z4*z6^3*z7^4+
    z1*z3*z4^2*z6^3*z7^4+ z1*z3^2*z5*z6^3*z7^4- z1*z4^2*z5*z6^3*z7^4-
    z1*z3*z5^2*z6^3*z7^4+ z1*z4*z5^2*z6^3*z7^4- 1, z2*z3^2*z4^2*z5^2*z6^2*z7^2-
    2250*z2*z3^2*z4^2*z5^2*z6^2- 2250*z2*z3^2*z4^2*z5^2*z7^2-
    2250*z2*z3^2*z4^2*z6^2*z7^2- 2250*z2*z3^2*z5^2*z6^2*z7^2-
    2250*z2*z4^2*z5^2*z6^2*z7^2+ 3938*z2*z3^2*z4^2*z5^2+ 3938*z2*z3^2*z4^2*z6^2+
    3938*z2*z3^2*z5^2*z6^2+ 3938*z2*z4^2*z5^2*z6^2+ 3938*z2*z3^2*z4^2*z7^2+
    3938*z2*z3^2*z5^2*z7^2+ 3938*z2*z4^2*z5^2*z7^2+ 3938*z2*z3^2*z6^2*z7^2+
    3938*z2*z4^2*z6^2*z7^2+ 3938*z2*z5^2*z6^2*z7^2- 3516*z2*z3^2*z4^2-
    3516*z2*z3^2*z5^2- 3516*z2*z4^2*z5^2- 3516*z2*z3^2*z6^2- 3516*z2*z4^2*z6^2-
    3516*z2*z5^2*z6^2- 3516*z2*z3^2*z7^2- 3516*z2*z4^2*z7^2- 3516*z2*z5^2*z7^2-
    3516*z2*z6^2*z7^2- 879*z2*z3^2- 879*z2*z4^2- 879*z2*z5^2- 879*z2*z6^2-
    879*z2*z7^2- 2470*z2- 1, - z3- z4- z5- z6- z7+ z8, - z3*z4- z3*z5- z4*z5-
    z3*z6- z4*z6- z5*z6- z3*z7- z4*z7- z5*z7- z6*z7+ z9, - z3*z4*z5- z3*z4*z6-
    z3*z5*z6- z4*z5*z6- z3*z4*z7- z3*z5*z7- z4*z5*z7- z3*z6*z7- z4*z6*z7-
    z5*z6*z7+ z10, - z3*z4*z5*z6- z3*z4*z5*z7- z3*z4*z6*z7- z3*z5*z6*z7-
    z4*z5*z6*z7+ z11, - z3*z4*z5*z6*z7+ z12
    )
  R, id
end

function yang_l12_m5(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 11
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "z$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
    4*z2^15- 6*z2^14*z3- 6*z2^14*z4+ 8*z2^13*z3*z4- 6*z2^14*z5+ 8*z2^13*z3*z5+
    8*z2^13*z4*z5- 10*z2^12*z3*z4*z5- 6*z2^14*z6+ 8*z2^13*z3*z6+ 8*z2^13*z4*z6-
    10*z2^12*z3*z4*z6+ 8*z2^13*z5*z6- 10*z2^12*z3*z5*z6- 10*z2^12*z4*z5*z6+
    12*z2^11*z3*z4*z5*z6+ 13*z2^13- 10*z2^12*z3- 10*z2^12*z4- z2^11*z3*z4-
    10*z2^12*z5- z2^11*z3*z5- z2^11*z4*z5+ 22*z2^10*z3*z4*z5- 10*z2^12*z6-
    z2^11*z3*z6- z2^11*z4*z6+ 22*z2^10*z3*z4*z6- z2^11*z5*z6+ 22*z2^10*z3*z5*z6+
    22*z2^10*z4*z5*z6- 55*z2^9*z3*z4*z5*z6+ 12*z2^11- 1121*z2^10*z3-
    1121*z2^10*z4+ 2231*z2^9*z3*z4- 1121*z2^10*z5+ 2231*z2^9*z3*z5+
    2231*z2^9*z4*z5- 3363*z2^8*z3*z4*z5- 1121*z2^10*z6+ 2231*z2^9*z3*z6+
    2231*z2^9*z4*z6- 3363*z2^8*z3*z4*z6+ 2231*z2^9*z5*z6- 3363*z2^8*z3*z5*z6-
    3363*z2^8*z4*z5*z6- 4451*z2^7*z3*z4*z5*z6+ 3374*z2^9- 3363*z2^8*z3-
    3363*z2^8*z4+ 1121*z2^7*z3*z4- 3363*z2^8*z5+ 1121*z2^7*z3*z5+
    1121*z2^7*z4*z5+ 4484*z2^6*z3*z4*z5- 3363*z2^8*z6+ 1121*z2^7*z3*z6+
    1121*z2^7*z4*z6+ 4484*z2^6*z3*z4*z6+ 1121*z2^7*z5*z6+ 4484*z2^6*z3*z5*z6+
    4484*z2^6*z4*z5*z6+ 3363*z2^5*z3*z4*z5*z6- 147*z2^7- 2740*z2^6*z3-
    2740*z2^6*z4- 4495*z2^5*z3*z4- 2740*z2^6*z5- 4495*z2^5*z3*z5-
    4495*z2^5*z4*z5- 1755*z2^4*z3*z4*z5- 2740*z2^6*z6- 4495*z2^5*z3*z6-
    4495*z2^5*z4*z6- 1755*z2^4*z3*z4*z6- 4495*z2^5*z5*z6- 1755*z2^4*z3*z5*z6-
    1755*z2^4*z4*z5*z6- 4359*z2^3*z3*z4*z5*z6- 318*z2^5- 3588*z2^4*z3-
    3588*z2^4*z4+ 2988*z2^3*z3*z4- 3588*z2^4*z5+ 2988*z2^3*z3*z5+
    2988*z2^3*z4*z5- 633*z2^2*z3*z4*z5- 3588*z2^4*z6+ 2988*z2^3*z3*z6+
    2988*z2^3*z4*z6- 633*z2^2*z3*z4*z6+ 2988*z2^3*z5*z6- 633*z2^2*z3*z5*z6-
    633*z2^2*z4*z5*z6+ 2637*z2*z3*z4*z5*z6+ 1776*z2^3+ 2202*z2^2*z3+ 2202*z2^2*z4-
    167*z2*z3*z4+ 2202*z2^2*z5- 167*z2*z3*z5- 167*z2*z4*z5- 1235*z3*z4*z5+
    2202*z2^2*z6- 167*z2*z3*z6- 167*z2*z4*z6- 1235*z3*z4*z6- 167*z2*z5*z6-
    1235*z3*z5*z6- 1235*z4*z5*z6- 2303*z2+ 1235*z3+ 1235*z4+ 1235*z5+ 1235*z6, -
    6*z2*z3^14+ 4*z3^15+ 8*z2*z3^13*z4- 6*z3^14*z4+ 8*z2*z3^13*z5- 6*z3^14*z5-
    10*z2*z3^12*z4*z5+ 8*z3^13*z4*z5+ 8*z2*z3^13*z6- 6*z3^14*z6-
    10*z2*z3^12*z4*z6+ 8*z3^13*z4*z6- 10*z2*z3^12*z5*z6+ 8*z3^13*z5*z6+
    12*z2*z3^11*z4*z5*z6- 10*z3^12*z4*z5*z6- 10*z2*z3^12+ 13*z3^13- z2*z3^11*z4-
    10*z3^12*z4- z2*z3^11*z5- 10*z3^12*z5+ 22*z2*z3^10*z4*z5- z3^11*z4*z5-
    z2*z3^11*z6- 10*z3^12*z6+ 22*z2*z3^10*z4*z6- z3^11*z4*z6+ 22*z2*z3^10*z5*z6-
    z3^11*z5*z6- 55*z2*z3^9*z4*z5*z6+ 22*z3^10*z4*z5*z6- 1121*z2*z3^10+ 12*z3^11+
    2231*z2*z3^9*z4- 1121*z3^10*z4+ 2231*z2*z3^9*z5- 1121*z3^10*z5-
    3363*z2*z3^8*z4*z5+ 2231*z3^9*z4*z5+ 2231*z2*z3^9*z6- 1121*z3^10*z6-
    3363*z2*z3^8*z4*z6+ 2231*z3^9*z4*z6- 3363*z2*z3^8*z5*z6+ 2231*z3^9*z5*z6-
    4451*z2*z3^7*z4*z5*z6- 3363*z3^8*z4*z5*z6- 3363*z2*z3^8+ 3374*z3^9+
    1121*z2*z3^7*z4- 3363*z3^8*z4+ 1121*z2*z3^7*z5- 3363*z3^8*z5+
    4484*z2*z3^6*z4*z5+ 1121*z3^7*z4*z5+ 1121*z2*z3^7*z6- 3363*z3^8*z6+
    4484*z2*z3^6*z4*z6+ 1121*z3^7*z4*z6+ 4484*z2*z3^6*z5*z6+ 1121*z3^7*z5*z6+
    3363*z2*z3^5*z4*z5*z6+ 4484*z3^6*z4*z5*z6- 2740*z2*z3^6- 147*z3^7-
    4495*z2*z3^5*z4- 2740*z3^6*z4- 4495*z2*z3^5*z5- 2740*z3^6*z5-
    1755*z2*z3^4*z4*z5- 4495*z3^5*z4*z5- 4495*z2*z3^5*z6- 2740*z3^6*z6-
    1755*z2*z3^4*z4*z6- 4495*z3^5*z4*z6- 1755*z2*z3^4*z5*z6- 4495*z3^5*z5*z6-
    4359*z2*z3^3*z4*z5*z6- 1755*z3^4*z4*z5*z6- 3588*z2*z3^4- 318*z3^5+
    2988*z2*z3^3*z4- 3588*z3^4*z4+ 2988*z2*z3^3*z5- 3588*z3^4*z5-
    633*z2*z3^2*z4*z5+ 2988*z3^3*z4*z5+ 2988*z2*z3^3*z6- 3588*z3^4*z6-
    633*z2*z3^2*z4*z6+ 2988*z3^3*z4*z6- 633*z2*z3^2*z5*z6+ 2988*z3^3*z5*z6+
    2637*z2*z3*z4*z5*z6- 633*z3^2*z4*z5*z6+ 2202*z2*z3^2+ 1776*z3^3- 167*z2*z3*z4+
    2202*z3^2*z4- 167*z2*z3*z5+ 2202*z3^2*z5- 1235*z2*z4*z5- 167*z3*z4*z5-
    167*z2*z3*z6+ 2202*z3^2*z6- 1235*z2*z4*z6- 167*z3*z4*z6- 1235*z2*z5*z6-
    167*z3*z5*z6- 1235*z4*z5*z6+ 1235*z2- 2303*z3+ 1235*z4+ 1235*z5+ 1235*z6,
    8*z2*z3*z4^13- 6*z2*z4^14- 6*z3*z4^14+ 4*z4^15- 10*z2*z3*z4^12*z5+
    8*z2*z4^13*z5+ 8*z3*z4^13*z5- 6*z4^14*z5- 10*z2*z3*z4^12*z6+ 8*z2*z4^13*z6+
    8*z3*z4^13*z6- 6*z4^14*z6+ 12*z2*z3*z4^11*z5*z6- 10*z2*z4^12*z5*z6-
    10*z3*z4^12*z5*z6+ 8*z4^13*z5*z6- z2*z3*z4^11- 10*z2*z4^12- 10*z3*z4^12+
    13*z4^13+ 22*z2*z3*z4^10*z5- z2*z4^11*z5- z3*z4^11*z5- 10*z4^12*z5+
    22*z2*z3*z4^10*z6- z2*z4^11*z6- z3*z4^11*z6- 10*z4^12*z6- 55*z2*z3*z4^9*z5*z6+
    22*z2*z4^10*z5*z6+ 22*z3*z4^10*z5*z6- z4^11*z5*z6+ 2231*z2*z3*z4^9-
    1121*z2*z4^10- 1121*z3*z4^10+ 12*z4^11- 3363*z2*z3*z4^8*z5+ 2231*z2*z4^9*z5+
    2231*z3*z4^9*z5- 1121*z4^10*z5- 3363*z2*z3*z4^8*z6+ 2231*z2*z4^9*z6+
    2231*z3*z4^9*z6- 1121*z4^10*z6- 4451*z2*z3*z4^7*z5*z6- 3363*z2*z4^8*z5*z6-
    3363*z3*z4^8*z5*z6+ 2231*z4^9*z5*z6+ 1121*z2*z3*z4^7- 3363*z2*z4^8-
    3363*z3*z4^8+ 3374*z4^9+ 4484*z2*z3*z4^6*z5+ 1121*z2*z4^7*z5+ 1121*z3*z4^7*z5-
    3363*z4^8*z5+ 4484*z2*z3*z4^6*z6+ 1121*z2*z4^7*z6+ 1121*z3*z4^7*z6-
    3363*z4^8*z6+ 3363*z2*z3*z4^5*z5*z6+ 4484*z2*z4^6*z5*z6+ 4484*z3*z4^6*z5*z6+
    1121*z4^7*z5*z6- 4495*z2*z3*z4^5- 2740*z2*z4^6- 2740*z3*z4^6- 147*z4^7-
    1755*z2*z3*z4^4*z5- 4495*z2*z4^5*z5- 4495*z3*z4^5*z5- 2740*z4^6*z5-
    1755*z2*z3*z4^4*z6- 4495*z2*z4^5*z6- 4495*z3*z4^5*z6- 2740*z4^6*z6-
    4359*z2*z3*z4^3*z5*z6- 1755*z2*z4^4*z5*z6- 1755*z3*z4^4*z5*z6-
    4495*z4^5*z5*z6+ 2988*z2*z3*z4^3- 3588*z2*z4^4- 3588*z3*z4^4- 318*z4^5-
    633*z2*z3*z4^2*z5+ 2988*z2*z4^3*z5+ 2988*z3*z4^3*z5- 3588*z4^4*z5-
    633*z2*z3*z4^2*z6+ 2988*z2*z4^3*z6+ 2988*z3*z4^3*z6- 3588*z4^4*z6+
    2637*z2*z3*z4*z5*z6- 633*z2*z4^2*z5*z6- 633*z3*z4^2*z5*z6+ 2988*z4^3*z5*z6-
    167*z2*z3*z4+ 2202*z2*z4^2+ 2202*z3*z4^2+ 1776*z4^3- 1235*z2*z3*z5-
    167*z2*z4*z5- 167*z3*z4*z5+ 2202*z4^2*z5- 1235*z2*z3*z6- 167*z2*z4*z6-
    167*z3*z4*z6+ 2202*z4^2*z6- 1235*z2*z5*z6- 1235*z3*z5*z6- 167*z4*z5*z6+
    1235*z2+ 1235*z3- 2303*z4+ 1235*z5+ 1235*z6, - 10*z2*z3*z4*z5^12+
    8*z2*z3*z5^13+ 8*z2*z4*z5^13+ 8*z3*z4*z5^13- 6*z2*z5^14- 6*z3*z5^14-
    6*z4*z5^14+ 4*z5^15+ 12*z2*z3*z4*z5^11*z6- 10*z2*z3*z5^12*z6-
    10*z2*z4*z5^12*z6- 10*z3*z4*z5^12*z6+ 8*z2*z5^13*z6+ 8*z3*z5^13*z6+
    8*z4*z5^13*z6- 6*z5^14*z6+ 22*z2*z3*z4*z5^10- z2*z3*z5^11- z2*z4*z5^11-
    z3*z4*z5^11- 10*z2*z5^12- 10*z3*z5^12- 10*z4*z5^12+ 13*z5^13-
    55*z2*z3*z4*z5^9*z6+ 22*z2*z3*z5^10*z6+ 22*z2*z4*z5^10*z6+ 22*z3*z4*z5^10*z6-
    z2*z5^11*z6- z3*z5^11*z6- z4*z5^11*z6- 10*z5^12*z6- 3363*z2*z3*z4*z5^8+
    2231*z2*z3*z5^9+ 2231*z2*z4*z5^9+ 2231*z3*z4*z5^9- 1121*z2*z5^10-
    1121*z3*z5^10- 1121*z4*z5^10+ 12*z5^11- 4451*z2*z3*z4*z5^7*z6-
    3363*z2*z3*z5^8*z6- 3363*z2*z4*z5^8*z6- 3363*z3*z4*z5^8*z6+ 2231*z2*z5^9*z6+
    2231*z3*z5^9*z6+ 2231*z4*z5^9*z6- 1121*z5^10*z6+ 4484*z2*z3*z4*z5^6+
    1121*z2*z3*z5^7+ 1121*z2*z4*z5^7+ 1121*z3*z4*z5^7- 3363*z2*z5^8- 3363*z3*z5^8-
    3363*z4*z5^8+ 3374*z5^9+ 3363*z2*z3*z4*z5^5*z6+ 4484*z2*z3*z5^6*z6+
    4484*z2*z4*z5^6*z6+ 4484*z3*z4*z5^6*z6+ 1121*z2*z5^7*z6+ 1121*z3*z5^7*z6+
    1121*z4*z5^7*z6- 3363*z5^8*z6- 1755*z2*z3*z4*z5^4- 4495*z2*z3*z5^5-
    4495*z2*z4*z5^5- 4495*z3*z4*z5^5- 2740*z2*z5^6- 2740*z3*z5^6- 2740*z4*z5^6-
    147*z5^7- 4359*z2*z3*z4*z5^3*z6- 1755*z2*z3*z5^4*z6- 1755*z2*z4*z5^4*z6-
    1755*z3*z4*z5^4*z6- 4495*z2*z5^5*z6- 4495*z3*z5^5*z6- 4495*z4*z5^5*z6-
    2740*z5^6*z6- 633*z2*z3*z4*z5^2+ 2988*z2*z3*z5^3+ 2988*z2*z4*z5^3+
    2988*z3*z4*z5^3- 3588*z2*z5^4- 3588*z3*z5^4- 3588*z4*z5^4- 318*z5^5+
    2637*z2*z3*z4*z5*z6- 633*z2*z3*z5^2*z6- 633*z2*z4*z5^2*z6- 633*z3*z4*z5^2*z6+
    2988*z2*z5^3*z6+ 2988*z3*z5^3*z6+ 2988*z4*z5^3*z6- 3588*z5^4*z6-
    1235*z2*z3*z4- 167*z2*z3*z5- 167*z2*z4*z5- 167*z3*z4*z5+ 2202*z2*z5^2+
    2202*z3*z5^2+ 2202*z4*z5^2+ 1776*z5^3- 1235*z2*z3*z6- 1235*z2*z4*z6-
    1235*z3*z4*z6- 167*z2*z5*z6- 167*z3*z5*z6- 167*z4*z5*z6+ 2202*z5^2*z6+
    1235*z2+ 1235*z3+ 1235*z4- 2303*z5+ 1235*z6, 12*z2*z3*z4*z5*z6^11-
    10*z2*z3*z4*z6^12- 10*z2*z3*z5*z6^12- 10*z2*z4*z5*z6^12- 10*z3*z4*z5*z6^12+
    8*z2*z3*z6^13+ 8*z2*z4*z6^13+ 8*z3*z4*z6^13+ 8*z2*z5*z6^13+ 8*z3*z5*z6^13+
    8*z4*z5*z6^13- 6*z2*z6^14- 6*z3*z6^14- 6*z4*z6^14- 6*z5*z6^14+ 4*z6^15-
    55*z2*z3*z4*z5*z6^9+ 22*z2*z3*z4*z6^10+ 22*z2*z3*z5*z6^10+ 22*z2*z4*z5*z6^10+
    22*z3*z4*z5*z6^10- z2*z3*z6^11- z2*z4*z6^11- z3*z4*z6^11- z2*z5*z6^11-
    z3*z5*z6^11- z4*z5*z6^11- 10*z2*z6^12- 10*z3*z6^12- 10*z4*z6^12- 10*z5*z6^12+
    13*z6^13- 4451*z2*z3*z4*z5*z6^7- 3363*z2*z3*z4*z6^8- 3363*z2*z3*z5*z6^8-
    3363*z2*z4*z5*z6^8- 3363*z3*z4*z5*z6^8+ 2231*z2*z3*z6^9+ 2231*z2*z4*z6^9+
    2231*z3*z4*z6^9+ 2231*z2*z5*z6^9+ 2231*z3*z5*z6^9+ 2231*z4*z5*z6^9-
    1121*z2*z6^10- 1121*z3*z6^10- 1121*z4*z6^10- 1121*z5*z6^10+ 12*z6^11+
    3363*z2*z3*z4*z5*z6^5+ 4484*z2*z3*z4*z6^6+ 4484*z2*z3*z5*z6^6+
    4484*z2*z4*z5*z6^6+ 4484*z3*z4*z5*z6^6+ 1121*z2*z3*z6^7+ 1121*z2*z4*z6^7+
    1121*z3*z4*z6^7+ 1121*z2*z5*z6^7+ 1121*z3*z5*z6^7+ 1121*z4*z5*z6^7-
    3363*z2*z6^8- 3363*z3*z6^8- 3363*z4*z6^8- 3363*z5*z6^8+ 3374*z6^9-
    4359*z2*z3*z4*z5*z6^3- 1755*z2*z3*z4*z6^4- 1755*z2*z3*z5*z6^4-
    1755*z2*z4*z5*z6^4- 1755*z3*z4*z5*z6^4- 4495*z2*z3*z6^5- 4495*z2*z4*z6^5-
    4495*z3*z4*z6^5- 4495*z2*z5*z6^5- 4495*z3*z5*z6^5- 4495*z4*z5*z6^5-
    2740*z2*z6^6- 2740*z3*z6^6- 2740*z4*z6^6- 2740*z5*z6^6- 147*z6^7+
    2637*z2*z3*z4*z5*z6- 633*z2*z3*z4*z6^2- 633*z2*z3*z5*z6^2- 633*z2*z4*z5*z6^2-
    633*z3*z4*z5*z6^2+ 2988*z2*z3*z6^3+ 2988*z2*z4*z6^3+ 2988*z3*z4*z6^3+
    2988*z2*z5*z6^3+ 2988*z3*z5*z6^3+ 2988*z4*z5*z6^3- 3588*z2*z6^4- 3588*z3*z6^4-
    3588*z4*z6^4- 3588*z5*z6^4- 318*z6^5- 1235*z2*z3*z4- 1235*z2*z3*z5-
    1235*z2*z4*z5- 1235*z3*z4*z5- 167*z2*z3*z6- 167*z2*z4*z6- 167*z3*z4*z6-
    167*z2*z5*z6- 167*z3*z5*z6- 167*z4*z5*z6+ 2202*z2*z6^2+ 2202*z3*z6^2+
    2202*z4*z6^2+ 2202*z5*z6^2+ 1776*z6^3+ 1235*z2+ 1235*z3+ 1235*z4+ 1235*z5-
    2303*z6, 4*z2^14- 2*z2^13*z3- 2*z2^12*z3^2- 2*z2^11*z3^3- 2*z2^10*z3^4-
    2*z2^9*z3^5- 2*z2^8*z3^6- 2*z2^7*z3^7- 2*z2^6*z3^8- 2*z2^5*z3^9- 2*z2^4*z3^10-
    2*z2^3*z3^11- 2*z2^2*z3^12- 2*z2*z3^13+ 4*z3^14- 6*z2^13*z4+ 2*z2^12*z3*z4+
    2*z2^11*z3^2*z4+ 2*z2^10*z3^3*z4+ 2*z2^9*z3^4*z4+ 2*z2^8*z3^5*z4+
    2*z2^7*z3^6*z4+ 2*z2^6*z3^7*z4+ 2*z2^5*z3^8*z4+ 2*z2^4*z3^9*z4+
    2*z2^3*z3^10*z4+ 2*z2^2*z3^11*z4+ 2*z2*z3^12*z4- 6*z3^13*z4- 6*z2^13*z5+
    2*z2^12*z3*z5+ 2*z2^11*z3^2*z5+ 2*z2^10*z3^3*z5+ 2*z2^9*z3^4*z5+
    2*z2^8*z3^5*z5+ 2*z2^7*z3^6*z5+ 2*z2^6*z3^7*z5+ 2*z2^5*z3^8*z5+
    2*z2^4*z3^9*z5+ 2*z2^3*z3^10*z5+ 2*z2^2*z3^11*z5+ 2*z2*z3^12*z5- 6*z3^13*z5+
    8*z2^12*z4*z5- 2*z2^11*z3*z4*z5- 2*z2^10*z3^2*z4*z5- 2*z2^9*z3^3*z4*z5-
    2*z2^8*z3^4*z4*z5- 2*z2^7*z3^5*z4*z5- 2*z2^6*z3^6*z4*z5- 2*z2^5*z3^7*z4*z5-
    2*z2^4*z3^8*z4*z5- 2*z2^3*z3^9*z4*z5- 2*z2^2*z3^10*z4*z5- 2*z2*z3^11*z4*z5+
    8*z3^12*z4*z5- 6*z2^13*z6+ 2*z2^12*z3*z6+ 2*z2^11*z3^2*z6+ 2*z2^10*z3^3*z6+
    2*z2^9*z3^4*z6+ 2*z2^8*z3^5*z6+ 2*z2^7*z3^6*z6+ 2*z2^6*z3^7*z6+
    2*z2^5*z3^8*z6+ 2*z2^4*z3^9*z6+ 2*z2^3*z3^10*z6+ 2*z2^2*z3^11*z6+
    2*z2*z3^12*z6- 6*z3^13*z6+ 8*z2^12*z4*z6- 2*z2^11*z3*z4*z6-
    2*z2^10*z3^2*z4*z6- 2*z2^9*z3^3*z4*z6- 2*z2^8*z3^4*z4*z6- 2*z2^7*z3^5*z4*z6-
    2*z2^6*z3^6*z4*z6- 2*z2^5*z3^7*z4*z6- 2*z2^4*z3^8*z4*z6- 2*z2^3*z3^9*z4*z6-
    2*z2^2*z3^10*z4*z6- 2*z2*z3^11*z4*z6+ 8*z3^12*z4*z6+ 8*z2^12*z5*z6-
    2*z2^11*z3*z5*z6- 2*z2^10*z3^2*z5*z6- 2*z2^9*z3^3*z5*z6- 2*z2^8*z3^4*z5*z6-
    2*z2^7*z3^5*z5*z6- 2*z2^6*z3^6*z5*z6- 2*z2^5*z3^7*z5*z6- 2*z2^4*z3^8*z5*z6-
    2*z2^3*z3^9*z5*z6- 2*z2^2*z3^10*z5*z6- 2*z2*z3^11*z5*z6+ 8*z3^12*z5*z6-
    10*z2^11*z4*z5*z6+ 2*z2^10*z3*z4*z5*z6+ 2*z2^9*z3^2*z4*z5*z6+
    2*z2^8*z3^3*z4*z5*z6+ 2*z2^7*z3^4*z4*z5*z6+ 2*z2^6*z3^5*z4*z5*z6+
    2*z2^5*z3^6*z4*z5*z6+ 2*z2^4*z3^7*z4*z5*z6+ 2*z2^3*z3^8*z4*z5*z6+
    2*z2^2*z3^9*z4*z5*z6+ 2*z2*z3^10*z4*z5*z6- 10*z3^11*z4*z5*z6+ 13*z2^12+
    3*z2^11*z3+ 3*z2^10*z3^2+ 3*z2^9*z3^3+ 3*z2^8*z3^4+ 3*z2^7*z3^5+ 3*z2^6*z3^6+
    3*z2^5*z3^7+ 3*z2^4*z3^8+ 3*z2^3*z3^9+ 3*z2^2*z3^10+ 3*z2*z3^11+ 13*z3^12-
    10*z2^11*z4- 11*z2^10*z3*z4- 11*z2^9*z3^2*z4- 11*z2^8*z3^3*z4-
    11*z2^7*z3^4*z4- 11*z2^6*z3^5*z4- 11*z2^5*z3^6*z4- 11*z2^4*z3^7*z4-
    11*z2^3*z3^8*z4- 11*z2^2*z3^9*z4- 11*z2*z3^10*z4- 10*z3^11*z4- 10*z2^11*z5-
    11*z2^10*z3*z5- 11*z2^9*z3^2*z5- 11*z2^8*z3^3*z5- 11*z2^7*z3^4*z5-
    11*z2^6*z3^5*z5- 11*z2^5*z3^6*z5- 11*z2^4*z3^7*z5- 11*z2^3*z3^8*z5-
    11*z2^2*z3^9*z5- 11*z2*z3^10*z5- 10*z3^11*z5- z2^10*z4*z5+ 21*z2^9*z3*z4*z5+
    21*z2^8*z3^2*z4*z5+ 21*z2^7*z3^3*z4*z5+ 21*z2^6*z3^4*z4*z5+
    21*z2^5*z3^5*z4*z5+ 21*z2^4*z3^6*z4*z5+ 21*z2^3*z3^7*z4*z5+
    21*z2^2*z3^8*z4*z5+ 21*z2*z3^9*z4*z5- z3^10*z4*z5- 10*z2^11*z6-
    11*z2^10*z3*z6- 11*z2^9*z3^2*z6- 11*z2^8*z3^3*z6- 11*z2^7*z3^4*z6-
    11*z2^6*z3^5*z6- 11*z2^5*z3^6*z6- 11*z2^4*z3^7*z6- 11*z2^3*z3^8*z6-
    11*z2^2*z3^9*z6- 11*z2*z3^10*z6- 10*z3^11*z6- z2^10*z4*z6+ 21*z2^9*z3*z4*z6+
    21*z2^8*z3^2*z4*z6+ 21*z2^7*z3^3*z4*z6+ 21*z2^6*z3^4*z4*z6+
    21*z2^5*z3^5*z4*z6+ 21*z2^4*z3^6*z4*z6+ 21*z2^3*z3^7*z4*z6+
    21*z2^2*z3^8*z4*z6+ 21*z2*z3^9*z4*z6- z3^10*z4*z6- z2^10*z5*z6+
    21*z2^9*z3*z5*z6+ 21*z2^8*z3^2*z5*z6+ 21*z2^7*z3^3*z5*z6+ 21*z2^6*z3^4*z5*z6+
    21*z2^5*z3^5*z5*z6+ 21*z2^4*z3^6*z5*z6+ 21*z2^3*z3^7*z5*z6+
    21*z2^2*z3^8*z5*z6+ 21*z2*z3^9*z5*z6- z3^10*z5*z6+ 22*z2^9*z4*z5*z6-
    33*z2^8*z3*z4*z5*z6- 33*z2^7*z3^2*z4*z5*z6- 33*z2^6*z3^3*z4*z5*z6-
    33*z2^5*z3^4*z4*z5*z6- 33*z2^4*z3^5*z4*z5*z6- 33*z2^3*z3^6*z4*z5*z6-
    33*z2^2*z3^7*z4*z5*z6- 33*z2*z3^8*z4*z5*z6+ 22*z3^9*z4*z5*z6+ 12*z2^10-
    1109*z2^9*z3- 1109*z2^8*z3^2- 1109*z2^7*z3^3- 1109*z2^6*z3^4- 1109*z2^5*z3^5-
    1109*z2^4*z3^6- 1109*z2^3*z3^7- 1109*z2^2*z3^8- 1109*z2*z3^9+ 12*z3^10-
    1121*z2^9*z4+ 1110*z2^8*z3*z4+ 1110*z2^7*z3^2*z4+ 1110*z2^6*z3^3*z4+
    1110*z2^5*z3^4*z4+ 1110*z2^4*z3^5*z4+ 1110*z2^3*z3^6*z4+ 1110*z2^2*z3^7*z4+
    1110*z2*z3^8*z4- 1121*z3^9*z4- 1121*z2^9*z5+ 1110*z2^8*z3*z5+
    1110*z2^7*z3^2*z5+ 1110*z2^6*z3^3*z5+ 1110*z2^5*z3^4*z5+ 1110*z2^4*z3^5*z5+
    1110*z2^3*z3^6*z5+ 1110*z2^2*z3^7*z5+ 1110*z2*z3^8*z5- 1121*z3^9*z5+
    2231*z2^8*z4*z5- 1132*z2^7*z3*z4*z5- 1132*z2^6*z3^2*z4*z5-
    1132*z2^5*z3^3*z4*z5- 1132*z2^4*z3^4*z4*z5- 1132*z2^3*z3^5*z4*z5-
    1132*z2^2*z3^6*z4*z5- 1132*z2*z3^7*z4*z5+ 2231*z3^8*z4*z5- 1121*z2^9*z6+
    1110*z2^8*z3*z6+ 1110*z2^7*z3^2*z6+ 1110*z2^6*z3^3*z6+ 1110*z2^5*z3^4*z6+
    1110*z2^4*z3^5*z6+ 1110*z2^3*z3^6*z6+ 1110*z2^2*z3^7*z6+ 1110*z2*z3^8*z6-
    1121*z3^9*z6+ 2231*z2^8*z4*z6- 1132*z2^7*z3*z4*z6- 1132*z2^6*z3^2*z4*z6-
    1132*z2^5*z3^3*z4*z6- 1132*z2^4*z3^4*z4*z6- 1132*z2^3*z3^5*z4*z6-
    1132*z2^2*z3^6*z4*z6- 1132*z2*z3^7*z4*z6+ 2231*z3^8*z4*z6+ 2231*z2^8*z5*z6-
    1132*z2^7*z3*z5*z6- 1132*z2^6*z3^2*z5*z6- 1132*z2^5*z3^3*z5*z6-
    1132*z2^4*z3^4*z5*z6- 1132*z2^3*z3^5*z5*z6- 1132*z2^2*z3^6*z5*z6-
    1132*z2*z3^7*z5*z6+ 2231*z3^8*z5*z6- 3363*z2^7*z4*z5*z6+
    1187*z2^6*z3*z4*z5*z6+ 1187*z2^5*z3^2*z4*z5*z6+ 1187*z2^4*z3^3*z4*z5*z6+
    1187*z2^3*z3^4*z4*z5*z6+ 1187*z2^2*z3^5*z4*z5*z6+ 1187*z2*z3^6*z4*z5*z6-
    3363*z3^7*z4*z5*z6+ 3374*z2^8+ 11*z2^7*z3+ 11*z2^6*z3^2+ 11*z2^5*z3^3+
    11*z2^4*z3^4+ 11*z2^3*z3^5+ 11*z2^2*z3^6+ 11*z2*z3^7+ 3374*z3^8- 3363*z2^7*z4-
    2242*z2^6*z3*z4- 2242*z2^5*z3^2*z4- 2242*z2^4*z3^3*z4- 2242*z2^3*z3^4*z4-
    2242*z2^2*z3^5*z4- 2242*z2*z3^6*z4- 3363*z3^7*z4- 3363*z2^7*z5-
    2242*z2^6*z3*z5- 2242*z2^5*z3^2*z5- 2242*z2^4*z3^3*z5- 2242*z2^3*z3^4*z5-
    2242*z2^2*z3^5*z5- 2242*z2*z3^6*z5- 3363*z3^7*z5+ 1121*z2^6*z4*z5-
    3396*z2^5*z3*z4*z5- 3396*z2^4*z3^2*z4*z5- 3396*z2^3*z3^3*z4*z5-
    3396*z2^2*z3^4*z4*z5- 3396*z2*z3^5*z4*z5+ 1121*z3^6*z4*z5- 3363*z2^7*z6-
    2242*z2^6*z3*z6- 2242*z2^5*z3^2*z6- 2242*z2^4*z3^3*z6- 2242*z2^3*z3^4*z6-
    2242*z2^2*z3^5*z6- 2242*z2*z3^6*z6- 3363*z3^7*z6+ 1121*z2^6*z4*z6-
    3396*z2^5*z3*z4*z6- 3396*z2^4*z3^2*z4*z6- 3396*z2^3*z3^3*z4*z6-
    3396*z2^2*z3^4*z4*z6- 3396*z2*z3^5*z4*z6+ 1121*z3^6*z4*z6+ 1121*z2^6*z5*z6-
    3396*z2^5*z3*z5*z6- 3396*z2^4*z3^2*z5*z6- 3396*z2^3*z3^3*z5*z6-
    3396*z2^2*z3^4*z5*z6- 3396*z2*z3^5*z5*z6+ 1121*z3^6*z5*z6+ 4484*z2^5*z4*z5*z6-
    1154*z2^4*z3*z4*z5*z6- 1154*z2^3*z3^2*z4*z5*z6- 1154*z2^2*z3^3*z4*z5*z6-
    1154*z2*z3^4*z4*z5*z6+ 4484*z3^5*z4*z5*z6- 147*z2^6- 2887*z2^5*z3-
    2887*z2^4*z3^2- 2887*z2^3*z3^3- 2887*z2^2*z3^4- 2887*z2*z3^5- 147*z3^6-
    2740*z2^5*z4+ 1766*z2^4*z3*z4+ 1766*z2^3*z3^2*z4+ 1766*z2^2*z3^3*z4+
    1766*z2*z3^4*z4- 2740*z3^5*z4- 2740*z2^5*z5+ 1766*z2^4*z3*z5+
    1766*z2^3*z3^2*z5+ 1766*z2^2*z3^3*z5+ 1766*z2*z3^4*z5- 2740*z3^5*z5-
    4495*z2^4*z4*z5+ 2751*z2^3*z3*z4*z5+ 2751*z2^2*z3^2*z4*z5+ 2751*z2*z3^3*z4*z5-
    4495*z3^4*z4*z5- 2740*z2^5*z6+ 1766*z2^4*z3*z6+ 1766*z2^3*z3^2*z6+
    1766*z2^2*z3^3*z6+ 1766*z2*z3^4*z6- 2740*z3^5*z6- 4495*z2^4*z4*z6+
    2751*z2^3*z3*z4*z6+ 2751*z2^2*z3^2*z4*z6+ 2751*z2*z3^3*z4*z6- 4495*z3^4*z4*z6-
    4495*z2^4*z5*z6+ 2751*z2^3*z3*z5*z6+ 2751*z2^2*z3^2*z5*z6+ 2751*z2*z3^3*z5*z6-
    4495*z3^4*z5*z6- 1755*z2^3*z4*z5*z6+ 2887*z2^2*z3*z4*z5*z6+
    2887*z2*z3^2*z4*z5*z6- 1755*z3^3*z4*z5*z6- 318*z2^4- 3906*z2^3*z3-
    3906*z2^2*z3^2- 3906*z2*z3^3- 318*z3^4- 3588*z2^3*z4- 600*z2^2*z3*z4-
    600*z2*z3^2*z4- 3588*z3^3*z4- 3588*z2^3*z5- 600*z2^2*z3*z5- 600*z2*z3^2*z5-
    3588*z3^3*z5+ 2988*z2^2*z4*z5+ 2355*z2*z3*z4*z5+ 2988*z3^2*z4*z5-
    3588*z2^3*z6- 600*z2^2*z3*z6- 600*z2*z3^2*z6- 3588*z3^3*z6+ 2988*z2^2*z4*z6+
    2355*z2*z3*z4*z6+ 2988*z3^2*z4*z6+ 2988*z2^2*z5*z6+ 2355*z2*z3*z5*z6+
    2988*z3^2*z5*z6- 633*z2*z4*z5*z6- 633*z3*z4*z5*z6+ 1776*z2^2+ 3978*z2*z3+
    1776*z3^2+ 2202*z2*z4+ 2202*z3*z4+ 2202*z2*z5+ 2202*z3*z5+ 1068*z4*z5+
    2202*z2*z6+ 2202*z3*z6+ 1068*z4*z6+ 1068*z5*z6- 3538, 4*z2^14- 6*z2^13*z3-
    2*z2^13*z4+ 2*z2^12*z3*z4- 2*z2^12*z4^2+ 2*z2^11*z3*z4^2- 2*z2^11*z4^3+
    2*z2^10*z3*z4^3- 2*z2^10*z4^4+ 2*z2^9*z3*z4^4- 2*z2^9*z4^5+ 2*z2^8*z3*z4^5-
    2*z2^8*z4^6+ 2*z2^7*z3*z4^6- 2*z2^7*z4^7+ 2*z2^6*z3*z4^7- 2*z2^6*z4^8+
    2*z2^5*z3*z4^8- 2*z2^5*z4^9+ 2*z2^4*z3*z4^9- 2*z2^4*z4^10+ 2*z2^3*z3*z4^10-
    2*z2^3*z4^11+ 2*z2^2*z3*z4^11- 2*z2^2*z4^12+ 2*z2*z3*z4^12- 2*z2*z4^13-
    6*z3*z4^13+ 4*z4^14- 6*z2^13*z5+ 8*z2^12*z3*z5+ 2*z2^12*z4*z5-
    2*z2^11*z3*z4*z5+ 2*z2^11*z4^2*z5- 2*z2^10*z3*z4^2*z5+ 2*z2^10*z4^3*z5-
    2*z2^9*z3*z4^3*z5+ 2*z2^9*z4^4*z5- 2*z2^8*z3*z4^4*z5+ 2*z2^8*z4^5*z5-
    2*z2^7*z3*z4^5*z5+ 2*z2^7*z4^6*z5- 2*z2^6*z3*z4^6*z5+ 2*z2^6*z4^7*z5-
    2*z2^5*z3*z4^7*z5+ 2*z2^5*z4^8*z5- 2*z2^4*z3*z4^8*z5+ 2*z2^4*z4^9*z5-
    2*z2^3*z3*z4^9*z5+ 2*z2^3*z4^10*z5- 2*z2^2*z3*z4^10*z5+ 2*z2^2*z4^11*z5-
    2*z2*z3*z4^11*z5+ 2*z2*z4^12*z5+ 8*z3*z4^12*z5- 6*z4^13*z5- 6*z2^13*z6+
    8*z2^12*z3*z6+ 2*z2^12*z4*z6- 2*z2^11*z3*z4*z6+ 2*z2^11*z4^2*z6-
    2*z2^10*z3*z4^2*z6+ 2*z2^10*z4^3*z6- 2*z2^9*z3*z4^3*z6+ 2*z2^9*z4^4*z6-
    2*z2^8*z3*z4^4*z6+ 2*z2^8*z4^5*z6- 2*z2^7*z3*z4^5*z6+ 2*z2^7*z4^6*z6-
    2*z2^6*z3*z4^6*z6+ 2*z2^6*z4^7*z6- 2*z2^5*z3*z4^7*z6+ 2*z2^5*z4^8*z6-
    2*z2^4*z3*z4^8*z6+ 2*z2^4*z4^9*z6- 2*z2^3*z3*z4^9*z6+ 2*z2^3*z4^10*z6-
    2*z2^2*z3*z4^10*z6+ 2*z2^2*z4^11*z6- 2*z2*z3*z4^11*z6+ 2*z2*z4^12*z6+
    8*z3*z4^12*z6- 6*z4^13*z6+ 8*z2^12*z5*z6- 10*z2^11*z3*z5*z6- 2*z2^11*z4*z5*z6+
    2*z2^10*z3*z4*z5*z6- 2*z2^10*z4^2*z5*z6+ 2*z2^9*z3*z4^2*z5*z6-
    2*z2^9*z4^3*z5*z6+ 2*z2^8*z3*z4^3*z5*z6- 2*z2^8*z4^4*z5*z6+
    2*z2^7*z3*z4^4*z5*z6- 2*z2^7*z4^5*z5*z6+ 2*z2^6*z3*z4^5*z5*z6-
    2*z2^6*z4^6*z5*z6+ 2*z2^5*z3*z4^6*z5*z6- 2*z2^5*z4^7*z5*z6+
    2*z2^4*z3*z4^7*z5*z6- 2*z2^4*z4^8*z5*z6+ 2*z2^3*z3*z4^8*z5*z6-
    2*z2^3*z4^9*z5*z6+ 2*z2^2*z3*z4^9*z5*z6- 2*z2^2*z4^10*z5*z6+
    2*z2*z3*z4^10*z5*z6- 2*z2*z4^11*z5*z6- 10*z3*z4^11*z5*z6+ 8*z4^12*z5*z6+
    13*z2^12- 10*z2^11*z3+ 3*z2^11*z4- 11*z2^10*z3*z4+ 3*z2^10*z4^2-
    11*z2^9*z3*z4^2+ 3*z2^9*z4^3- 11*z2^8*z3*z4^3+ 3*z2^8*z4^4- 11*z2^7*z3*z4^4+
    3*z2^7*z4^5- 11*z2^6*z3*z4^5+ 3*z2^6*z4^6- 11*z2^5*z3*z4^6+ 3*z2^5*z4^7-
    11*z2^4*z3*z4^7+ 3*z2^4*z4^8- 11*z2^3*z3*z4^8+ 3*z2^3*z4^9- 11*z2^2*z3*z4^9+
    3*z2^2*z4^10- 11*z2*z3*z4^10+ 3*z2*z4^11- 10*z3*z4^11+ 13*z4^12- 10*z2^11*z5-
    z2^10*z3*z5- 11*z2^10*z4*z5+ 21*z2^9*z3*z4*z5- 11*z2^9*z4^2*z5+
    21*z2^8*z3*z4^2*z5- 11*z2^8*z4^3*z5+ 21*z2^7*z3*z4^3*z5- 11*z2^7*z4^4*z5+
    21*z2^6*z3*z4^4*z5- 11*z2^6*z4^5*z5+ 21*z2^5*z3*z4^5*z5- 11*z2^5*z4^6*z5+
    21*z2^4*z3*z4^6*z5- 11*z2^4*z4^7*z5+ 21*z2^3*z3*z4^7*z5- 11*z2^3*z4^8*z5+
    21*z2^2*z3*z4^8*z5- 11*z2^2*z4^9*z5+ 21*z2*z3*z4^9*z5- 11*z2*z4^10*z5-
    z3*z4^10*z5- 10*z4^11*z5- 10*z2^11*z6- z2^10*z3*z6- 11*z2^10*z4*z6+
    21*z2^9*z3*z4*z6- 11*z2^9*z4^2*z6+ 21*z2^8*z3*z4^2*z6- 11*z2^8*z4^3*z6+
    21*z2^7*z3*z4^3*z6- 11*z2^7*z4^4*z6+ 21*z2^6*z3*z4^4*z6- 11*z2^6*z4^5*z6+
    21*z2^5*z3*z4^5*z6- 11*z2^5*z4^6*z6+ 21*z2^4*z3*z4^6*z6- 11*z2^4*z4^7*z6+
    21*z2^3*z3*z4^7*z6- 11*z2^3*z4^8*z6+ 21*z2^2*z3*z4^8*z6- 11*z2^2*z4^9*z6+
    21*z2*z3*z4^9*z6- 11*z2*z4^10*z6- z3*z4^10*z6- 10*z4^11*z6- z2^10*z5*z6+
    22*z2^9*z3*z5*z6+ 21*z2^9*z4*z5*z6- 33*z2^8*z3*z4*z5*z6+ 21*z2^8*z4^2*z5*z6-
    33*z2^7*z3*z4^2*z5*z6+ 21*z2^7*z4^3*z5*z6- 33*z2^6*z3*z4^3*z5*z6+
    21*z2^6*z4^4*z5*z6- 33*z2^5*z3*z4^4*z5*z6+ 21*z2^5*z4^5*z5*z6-
    33*z2^4*z3*z4^5*z5*z6+ 21*z2^4*z4^6*z5*z6- 33*z2^3*z3*z4^6*z5*z6+
    21*z2^3*z4^7*z5*z6- 33*z2^2*z3*z4^7*z5*z6+ 21*z2^2*z4^8*z5*z6-
    33*z2*z3*z4^8*z5*z6+ 21*z2*z4^9*z5*z6+ 22*z3*z4^9*z5*z6- z4^10*z5*z6+
    12*z2^10- 1121*z2^9*z3- 1109*z2^9*z4+ 1110*z2^8*z3*z4- 1109*z2^8*z4^2+
    1110*z2^7*z3*z4^2- 1109*z2^7*z4^3+ 1110*z2^6*z3*z4^3- 1109*z2^6*z4^4+
    1110*z2^5*z3*z4^4- 1109*z2^5*z4^5+ 1110*z2^4*z3*z4^5- 1109*z2^4*z4^6+
    1110*z2^3*z3*z4^6- 1109*z2^3*z4^7+ 1110*z2^2*z3*z4^7- 1109*z2^2*z4^8+
    1110*z2*z3*z4^8- 1109*z2*z4^9- 1121*z3*z4^9+ 12*z4^10- 1121*z2^9*z5+
    2231*z2^8*z3*z5+ 1110*z2^8*z4*z5- 1132*z2^7*z3*z4*z5+ 1110*z2^7*z4^2*z5-
    1132*z2^6*z3*z4^2*z5+ 1110*z2^6*z4^3*z5- 1132*z2^5*z3*z4^3*z5+
    1110*z2^5*z4^4*z5- 1132*z2^4*z3*z4^4*z5+ 1110*z2^4*z4^5*z5-
    1132*z2^3*z3*z4^5*z5+ 1110*z2^3*z4^6*z5- 1132*z2^2*z3*z4^6*z5+
    1110*z2^2*z4^7*z5- 1132*z2*z3*z4^7*z5+ 1110*z2*z4^8*z5+ 2231*z3*z4^8*z5-
    1121*z4^9*z5- 1121*z2^9*z6+ 2231*z2^8*z3*z6+ 1110*z2^8*z4*z6-
    1132*z2^7*z3*z4*z6+ 1110*z2^7*z4^2*z6- 1132*z2^6*z3*z4^2*z6+
    1110*z2^6*z4^3*z6- 1132*z2^5*z3*z4^3*z6+ 1110*z2^5*z4^4*z6-
    1132*z2^4*z3*z4^4*z6+ 1110*z2^4*z4^5*z6- 1132*z2^3*z3*z4^5*z6+
    1110*z2^3*z4^6*z6- 1132*z2^2*z3*z4^6*z6+ 1110*z2^2*z4^7*z6-
    1132*z2*z3*z4^7*z6+ 1110*z2*z4^8*z6+ 2231*z3*z4^8*z6- 1121*z4^9*z6+
    2231*z2^8*z5*z6- 3363*z2^7*z3*z5*z6- 1132*z2^7*z4*z5*z6+
    1187*z2^6*z3*z4*z5*z6- 1132*z2^6*z4^2*z5*z6+ 1187*z2^5*z3*z4^2*z5*z6-
    1132*z2^5*z4^3*z5*z6+ 1187*z2^4*z3*z4^3*z5*z6- 1132*z2^4*z4^4*z5*z6+
    1187*z2^3*z3*z4^4*z5*z6- 1132*z2^3*z4^5*z5*z6+ 1187*z2^2*z3*z4^5*z5*z6-
    1132*z2^2*z4^6*z5*z6+ 1187*z2*z3*z4^6*z5*z6- 1132*z2*z4^7*z5*z6-
    3363*z3*z4^7*z5*z6+ 2231*z4^8*z5*z6+ 3374*z2^8- 3363*z2^7*z3+ 11*z2^7*z4-
    2242*z2^6*z3*z4+ 11*z2^6*z4^2- 2242*z2^5*z3*z4^2+ 11*z2^5*z4^3-
    2242*z2^4*z3*z4^3+ 11*z2^4*z4^4- 2242*z2^3*z3*z4^4+ 11*z2^3*z4^5-
    2242*z2^2*z3*z4^5+ 11*z2^2*z4^6- 2242*z2*z3*z4^6+ 11*z2*z4^7- 3363*z3*z4^7+
    3374*z4^8- 3363*z2^7*z5+ 1121*z2^6*z3*z5- 2242*z2^6*z4*z5- 3396*z2^5*z3*z4*z5-
    2242*z2^5*z4^2*z5- 3396*z2^4*z3*z4^2*z5- 2242*z2^4*z4^3*z5-
    3396*z2^3*z3*z4^3*z5- 2242*z2^3*z4^4*z5- 3396*z2^2*z3*z4^4*z5-
    2242*z2^2*z4^5*z5- 3396*z2*z3*z4^5*z5- 2242*z2*z4^6*z5+ 1121*z3*z4^6*z5-
    3363*z4^7*z5- 3363*z2^7*z6+ 1121*z2^6*z3*z6- 2242*z2^6*z4*z6-
    3396*z2^5*z3*z4*z6- 2242*z2^5*z4^2*z6- 3396*z2^4*z3*z4^2*z6-
    2242*z2^4*z4^3*z6- 3396*z2^3*z3*z4^3*z6- 2242*z2^3*z4^4*z6-
    3396*z2^2*z3*z4^4*z6- 2242*z2^2*z4^5*z6- 3396*z2*z3*z4^5*z6- 2242*z2*z4^6*z6+
    1121*z3*z4^6*z6- 3363*z4^7*z6+ 1121*z2^6*z5*z6+ 4484*z2^5*z3*z5*z6-
    3396*z2^5*z4*z5*z6- 1154*z2^4*z3*z4*z5*z6- 3396*z2^4*z4^2*z5*z6-
    1154*z2^3*z3*z4^2*z5*z6- 3396*z2^3*z4^3*z5*z6- 1154*z2^2*z3*z4^3*z5*z6-
    3396*z2^2*z4^4*z5*z6- 1154*z2*z3*z4^4*z5*z6- 3396*z2*z4^5*z5*z6+
    4484*z3*z4^5*z5*z6+ 1121*z4^6*z5*z6- 147*z2^6- 2740*z2^5*z3- 2887*z2^5*z4+
    1766*z2^4*z3*z4- 2887*z2^4*z4^2+ 1766*z2^3*z3*z4^2- 2887*z2^3*z4^3+
    1766*z2^2*z3*z4^3- 2887*z2^2*z4^4+ 1766*z2*z3*z4^4- 2887*z2*z4^5-
    2740*z3*z4^5- 147*z4^6- 2740*z2^5*z5- 4495*z2^4*z3*z5+ 1766*z2^4*z4*z5+
    2751*z2^3*z3*z4*z5+ 1766*z2^3*z4^2*z5+ 2751*z2^2*z3*z4^2*z5+
    1766*z2^2*z4^3*z5+ 2751*z2*z3*z4^3*z5+ 1766*z2*z4^4*z5- 4495*z3*z4^4*z5-
    2740*z4^5*z5- 2740*z2^5*z6- 4495*z2^4*z3*z6+ 1766*z2^4*z4*z6+
    2751*z2^3*z3*z4*z6+ 1766*z2^3*z4^2*z6+ 2751*z2^2*z3*z4^2*z6+
    1766*z2^2*z4^3*z6+ 2751*z2*z3*z4^3*z6+ 1766*z2*z4^4*z6- 4495*z3*z4^4*z6-
    2740*z4^5*z6- 4495*z2^4*z5*z6- 1755*z2^3*z3*z5*z6+ 2751*z2^3*z4*z5*z6+
    2887*z2^2*z3*z4*z5*z6+ 2751*z2^2*z4^2*z5*z6+ 2887*z2*z3*z4^2*z5*z6+
    2751*z2*z4^3*z5*z6- 1755*z3*z4^3*z5*z6- 4495*z4^4*z5*z6- 318*z2^4-
    3588*z2^3*z3- 3906*z2^3*z4- 600*z2^2*z3*z4- 3906*z2^2*z4^2- 600*z2*z3*z4^2-
    3906*z2*z4^3- 3588*z3*z4^3- 318*z4^4- 3588*z2^3*z5+ 2988*z2^2*z3*z5-
    600*z2^2*z4*z5+ 2355*z2*z3*z4*z5- 600*z2*z4^2*z5+ 2988*z3*z4^2*z5-
    3588*z4^3*z5- 3588*z2^3*z6+ 2988*z2^2*z3*z6- 600*z2^2*z4*z6+ 2355*z2*z3*z4*z6-
    600*z2*z4^2*z6+ 2988*z3*z4^2*z6- 3588*z4^3*z6+ 2988*z2^2*z5*z6-
    633*z2*z3*z5*z6+ 2355*z2*z4*z5*z6- 633*z3*z4*z5*z6+ 2988*z4^2*z5*z6+
    1776*z2^2+ 2202*z2*z3+ 3978*z2*z4+ 2202*z3*z4+ 1776*z4^2+ 2202*z2*z5+
    1068*z3*z5+ 2202*z4*z5+ 2202*z2*z6+ 1068*z3*z6+ 2202*z4*z6+ 1068*z5*z6- 3538,
    4*z2^14- 6*z2^13*z3- 6*z2^13*z4+ 8*z2^12*z3*z4- 2*z2^13*z5+ 2*z2^12*z3*z5+
    2*z2^12*z4*z5- 2*z2^11*z3*z4*z5- 2*z2^12*z5^2+ 2*z2^11*z3*z5^2+
    2*z2^11*z4*z5^2- 2*z2^10*z3*z4*z5^2- 2*z2^11*z5^3+ 2*z2^10*z3*z5^3+
    2*z2^10*z4*z5^3- 2*z2^9*z3*z4*z5^3- 2*z2^10*z5^4+ 2*z2^9*z3*z5^4+
    2*z2^9*z4*z5^4- 2*z2^8*z3*z4*z5^4- 2*z2^9*z5^5+ 2*z2^8*z3*z5^5+
    2*z2^8*z4*z5^5- 2*z2^7*z3*z4*z5^5- 2*z2^8*z5^6+ 2*z2^7*z3*z5^6+
    2*z2^7*z4*z5^6- 2*z2^6*z3*z4*z5^6- 2*z2^7*z5^7+ 2*z2^6*z3*z5^7+
    2*z2^6*z4*z5^7- 2*z2^5*z3*z4*z5^7- 2*z2^6*z5^8+ 2*z2^5*z3*z5^8+
    2*z2^5*z4*z5^8- 2*z2^4*z3*z4*z5^8- 2*z2^5*z5^9+ 2*z2^4*z3*z5^9+
    2*z2^4*z4*z5^9- 2*z2^3*z3*z4*z5^9- 2*z2^4*z5^10+ 2*z2^3*z3*z5^10+
    2*z2^3*z4*z5^10- 2*z2^2*z3*z4*z5^10- 2*z2^3*z5^11+ 2*z2^2*z3*z5^11+
    2*z2^2*z4*z5^11- 2*z2*z3*z4*z5^11- 2*z2^2*z5^12+ 2*z2*z3*z5^12+ 2*z2*z4*z5^12+
    8*z3*z4*z5^12- 2*z2*z5^13- 6*z3*z5^13- 6*z4*z5^13+ 4*z5^14- 6*z2^13*z6+
    8*z2^12*z3*z6+ 8*z2^12*z4*z6- 10*z2^11*z3*z4*z6+ 2*z2^12*z5*z6-
    2*z2^11*z3*z5*z6- 2*z2^11*z4*z5*z6+ 2*z2^10*z3*z4*z5*z6+ 2*z2^11*z5^2*z6-
    2*z2^10*z3*z5^2*z6- 2*z2^10*z4*z5^2*z6+ 2*z2^9*z3*z4*z5^2*z6+ 2*z2^10*z5^3*z6-
    2*z2^9*z3*z5^3*z6- 2*z2^9*z4*z5^3*z6+ 2*z2^8*z3*z4*z5^3*z6+ 2*z2^9*z5^4*z6-
    2*z2^8*z3*z5^4*z6- 2*z2^8*z4*z5^4*z6+ 2*z2^7*z3*z4*z5^4*z6+ 2*z2^8*z5^5*z6-
    2*z2^7*z3*z5^5*z6- 2*z2^7*z4*z5^5*z6+ 2*z2^6*z3*z4*z5^5*z6+ 2*z2^7*z5^6*z6-
    2*z2^6*z3*z5^6*z6- 2*z2^6*z4*z5^6*z6+ 2*z2^5*z3*z4*z5^6*z6+ 2*z2^6*z5^7*z6-
    2*z2^5*z3*z5^7*z6- 2*z2^5*z4*z5^7*z6+ 2*z2^4*z3*z4*z5^7*z6+ 2*z2^5*z5^8*z6-
    2*z2^4*z3*z5^8*z6- 2*z2^4*z4*z5^8*z6+ 2*z2^3*z3*z4*z5^8*z6+ 2*z2^4*z5^9*z6-
    2*z2^3*z3*z5^9*z6- 2*z2^3*z4*z5^9*z6+ 2*z2^2*z3*z4*z5^9*z6+ 2*z2^3*z5^10*z6-
    2*z2^2*z3*z5^10*z6- 2*z2^2*z4*z5^10*z6+ 2*z2*z3*z4*z5^10*z6+ 2*z2^2*z5^11*z6-
    2*z2*z3*z5^11*z6- 2*z2*z4*z5^11*z6- 10*z3*z4*z5^11*z6+ 2*z2*z5^12*z6+
    8*z3*z5^12*z6+ 8*z4*z5^12*z6- 6*z5^13*z6+ 13*z2^12- 10*z2^11*z3- 10*z2^11*z4-
    z2^10*z3*z4+ 3*z2^11*z5- 11*z2^10*z3*z5- 11*z2^10*z4*z5+ 21*z2^9*z3*z4*z5+
    3*z2^10*z5^2- 11*z2^9*z3*z5^2- 11*z2^9*z4*z5^2+ 21*z2^8*z3*z4*z5^2+
    3*z2^9*z5^3- 11*z2^8*z3*z5^3- 11*z2^8*z4*z5^3+ 21*z2^7*z3*z4*z5^3+
    3*z2^8*z5^4- 11*z2^7*z3*z5^4- 11*z2^7*z4*z5^4+ 21*z2^6*z3*z4*z5^4+
    3*z2^7*z5^5- 11*z2^6*z3*z5^5- 11*z2^6*z4*z5^5+ 21*z2^5*z3*z4*z5^5+
    3*z2^6*z5^6- 11*z2^5*z3*z5^6- 11*z2^5*z4*z5^6+ 21*z2^4*z3*z4*z5^6+
    3*z2^5*z5^7- 11*z2^4*z3*z5^7- 11*z2^4*z4*z5^7+ 21*z2^3*z3*z4*z5^7+
    3*z2^4*z5^8- 11*z2^3*z3*z5^8- 11*z2^3*z4*z5^8+ 21*z2^2*z3*z4*z5^8+
    3*z2^3*z5^9- 11*z2^2*z3*z5^9- 11*z2^2*z4*z5^9+ 21*z2*z3*z4*z5^9+ 3*z2^2*z5^10-
    11*z2*z3*z5^10- 11*z2*z4*z5^10- z3*z4*z5^10+ 3*z2*z5^11- 10*z3*z5^11-
    10*z4*z5^11+ 13*z5^12- 10*z2^11*z6- z2^10*z3*z6- z2^10*z4*z6+
    22*z2^9*z3*z4*z6- 11*z2^10*z5*z6+ 21*z2^9*z3*z5*z6+ 21*z2^9*z4*z5*z6-
    33*z2^8*z3*z4*z5*z6- 11*z2^9*z5^2*z6+ 21*z2^8*z3*z5^2*z6+ 21*z2^8*z4*z5^2*z6-
    33*z2^7*z3*z4*z5^2*z6- 11*z2^8*z5^3*z6+ 21*z2^7*z3*z5^3*z6+
    21*z2^7*z4*z5^3*z6- 33*z2^6*z3*z4*z5^3*z6- 11*z2^7*z5^4*z6+
    21*z2^6*z3*z5^4*z6+ 21*z2^6*z4*z5^4*z6- 33*z2^5*z3*z4*z5^4*z6-
    11*z2^6*z5^5*z6+ 21*z2^5*z3*z5^5*z6+ 21*z2^5*z4*z5^5*z6-
    33*z2^4*z3*z4*z5^5*z6- 11*z2^5*z5^6*z6+ 21*z2^4*z3*z5^6*z6+
    21*z2^4*z4*z5^6*z6- 33*z2^3*z3*z4*z5^6*z6- 11*z2^4*z5^7*z6+
    21*z2^3*z3*z5^7*z6+ 21*z2^3*z4*z5^7*z6- 33*z2^2*z3*z4*z5^7*z6-
    11*z2^3*z5^8*z6+ 21*z2^2*z3*z5^8*z6+ 21*z2^2*z4*z5^8*z6- 33*z2*z3*z4*z5^8*z6-
    11*z2^2*z5^9*z6+ 21*z2*z3*z5^9*z6+ 21*z2*z4*z5^9*z6+ 22*z3*z4*z5^9*z6-
    11*z2*z5^10*z6- z3*z5^10*z6- z4*z5^10*z6- 10*z5^11*z6+ 12*z2^10- 1121*z2^9*z3-
    1121*z2^9*z4+ 2231*z2^8*z3*z4- 1109*z2^9*z5+ 1110*z2^8*z3*z5+ 1110*z2^8*z4*z5-
    1132*z2^7*z3*z4*z5- 1109*z2^8*z5^2+ 1110*z2^7*z3*z5^2+ 1110*z2^7*z4*z5^2-
    1132*z2^6*z3*z4*z5^2- 1109*z2^7*z5^3+ 1110*z2^6*z3*z5^3+ 1110*z2^6*z4*z5^3-
    1132*z2^5*z3*z4*z5^3- 1109*z2^6*z5^4+ 1110*z2^5*z3*z5^4+ 1110*z2^5*z4*z5^4-
    1132*z2^4*z3*z4*z5^4- 1109*z2^5*z5^5+ 1110*z2^4*z3*z5^5+ 1110*z2^4*z4*z5^5-
    1132*z2^3*z3*z4*z5^5- 1109*z2^4*z5^6+ 1110*z2^3*z3*z5^6+ 1110*z2^3*z4*z5^6-
    1132*z2^2*z3*z4*z5^6- 1109*z2^3*z5^7+ 1110*z2^2*z3*z5^7+ 1110*z2^2*z4*z5^7-
    1132*z2*z3*z4*z5^7- 1109*z2^2*z5^8+ 1110*z2*z3*z5^8+ 1110*z2*z4*z5^8+
    2231*z3*z4*z5^8- 1109*z2*z5^9- 1121*z3*z5^9- 1121*z4*z5^9+ 12*z5^10-
    1121*z2^9*z6+ 2231*z2^8*z3*z6+ 2231*z2^8*z4*z6- 3363*z2^7*z3*z4*z6+
    1110*z2^8*z5*z6- 1132*z2^7*z3*z5*z6- 1132*z2^7*z4*z5*z6+
    1187*z2^6*z3*z4*z5*z6+ 1110*z2^7*z5^2*z6- 1132*z2^6*z3*z5^2*z6-
    1132*z2^6*z4*z5^2*z6+ 1187*z2^5*z3*z4*z5^2*z6+ 1110*z2^6*z5^3*z6-
    1132*z2^5*z3*z5^3*z6- 1132*z2^5*z4*z5^3*z6+ 1187*z2^4*z3*z4*z5^3*z6+
    1110*z2^5*z5^4*z6- 1132*z2^4*z3*z5^4*z6- 1132*z2^4*z4*z5^4*z6+
    1187*z2^3*z3*z4*z5^4*z6+ 1110*z2^4*z5^5*z6- 1132*z2^3*z3*z5^5*z6-
    1132*z2^3*z4*z5^5*z6+ 1187*z2^2*z3*z4*z5^5*z6+ 1110*z2^3*z5^6*z6-
    1132*z2^2*z3*z5^6*z6- 1132*z2^2*z4*z5^6*z6+ 1187*z2*z3*z4*z5^6*z6+
    1110*z2^2*z5^7*z6- 1132*z2*z3*z5^7*z6- 1132*z2*z4*z5^7*z6- 3363*z3*z4*z5^7*z6+
    1110*z2*z5^8*z6+ 2231*z3*z5^8*z6+ 2231*z4*z5^8*z6- 1121*z5^9*z6+ 3374*z2^8-
    3363*z2^7*z3- 3363*z2^7*z4+ 1121*z2^6*z3*z4+ 11*z2^7*z5- 2242*z2^6*z3*z5-
    2242*z2^6*z4*z5- 3396*z2^5*z3*z4*z5+ 11*z2^6*z5^2- 2242*z2^5*z3*z5^2-
    2242*z2^5*z4*z5^2- 3396*z2^4*z3*z4*z5^2+ 11*z2^5*z5^3- 2242*z2^4*z3*z5^3-
    2242*z2^4*z4*z5^3- 3396*z2^3*z3*z4*z5^3+ 11*z2^4*z5^4- 2242*z2^3*z3*z5^4-
    2242*z2^3*z4*z5^4- 3396*z2^2*z3*z4*z5^4+ 11*z2^3*z5^5- 2242*z2^2*z3*z5^5-
    2242*z2^2*z4*z5^5- 3396*z2*z3*z4*z5^5+ 11*z2^2*z5^6- 2242*z2*z3*z5^6-
    2242*z2*z4*z5^6+ 1121*z3*z4*z5^6+ 11*z2*z5^7- 3363*z3*z5^7- 3363*z4*z5^7+
    3374*z5^8- 3363*z2^7*z6+ 1121*z2^6*z3*z6+ 1121*z2^6*z4*z6+ 4484*z2^5*z3*z4*z6-
    2242*z2^6*z5*z6- 3396*z2^5*z3*z5*z6- 3396*z2^5*z4*z5*z6-
    1154*z2^4*z3*z4*z5*z6- 2242*z2^5*z5^2*z6- 3396*z2^4*z3*z5^2*z6-
    3396*z2^4*z4*z5^2*z6- 1154*z2^3*z3*z4*z5^2*z6- 2242*z2^4*z5^3*z6-
    3396*z2^3*z3*z5^3*z6- 3396*z2^3*z4*z5^3*z6- 1154*z2^2*z3*z4*z5^3*z6-
    2242*z2^3*z5^4*z6- 3396*z2^2*z3*z5^4*z6- 3396*z2^2*z4*z5^4*z6-
    1154*z2*z3*z4*z5^4*z6- 2242*z2^2*z5^5*z6- 3396*z2*z3*z5^5*z6-
    3396*z2*z4*z5^5*z6+ 4484*z3*z4*z5^5*z6- 2242*z2*z5^6*z6+ 1121*z3*z5^6*z6+
    1121*z4*z5^6*z6- 3363*z5^7*z6- 147*z2^6- 2740*z2^5*z3- 2740*z2^5*z4-
    4495*z2^4*z3*z4- 2887*z2^5*z5+ 1766*z2^4*z3*z5+ 1766*z2^4*z4*z5+
    2751*z2^3*z3*z4*z5- 2887*z2^4*z5^2+ 1766*z2^3*z3*z5^2+ 1766*z2^3*z4*z5^2+
    2751*z2^2*z3*z4*z5^2- 2887*z2^3*z5^3+ 1766*z2^2*z3*z5^3+ 1766*z2^2*z4*z5^3+
    2751*z2*z3*z4*z5^3- 2887*z2^2*z5^4+ 1766*z2*z3*z5^4+ 1766*z2*z4*z5^4-
    4495*z3*z4*z5^4- 2887*z2*z5^5- 2740*z3*z5^5- 2740*z4*z5^5- 147*z5^6-
    2740*z2^5*z6- 4495*z2^4*z3*z6- 4495*z2^4*z4*z6- 1755*z2^3*z3*z4*z6+
    1766*z2^4*z5*z6+ 2751*z2^3*z3*z5*z6+ 2751*z2^3*z4*z5*z6+
    2887*z2^2*z3*z4*z5*z6+ 1766*z2^3*z5^2*z6+ 2751*z2^2*z3*z5^2*z6+
    2751*z2^2*z4*z5^2*z6+ 2887*z2*z3*z4*z5^2*z6+ 1766*z2^2*z5^3*z6+
    2751*z2*z3*z5^3*z6+ 2751*z2*z4*z5^3*z6- 1755*z3*z4*z5^3*z6+ 1766*z2*z5^4*z6-
    4495*z3*z5^4*z6- 4495*z4*z5^4*z6- 2740*z5^5*z6- 318*z2^4- 3588*z2^3*z3-
    3588*z2^3*z4+ 2988*z2^2*z3*z4- 3906*z2^3*z5- 600*z2^2*z3*z5- 600*z2^2*z4*z5+
    2355*z2*z3*z4*z5- 3906*z2^2*z5^2- 600*z2*z3*z5^2- 600*z2*z4*z5^2+
    2988*z3*z4*z5^2- 3906*z2*z5^3- 3588*z3*z5^3- 3588*z4*z5^3- 318*z5^4-
    3588*z2^3*z6+ 2988*z2^2*z3*z6+ 2988*z2^2*z4*z6- 633*z2*z3*z4*z6-
    600*z2^2*z5*z6+ 2355*z2*z3*z5*z6+ 2355*z2*z4*z5*z6- 633*z3*z4*z5*z6-
    600*z2*z5^2*z6+ 2988*z3*z5^2*z6+ 2988*z4*z5^2*z6- 3588*z5^3*z6+ 1776*z2^2+
    2202*z2*z3+ 2202*z2*z4+ 1068*z3*z4+ 3978*z2*z5+ 2202*z3*z5+ 2202*z4*z5+
    1776*z5^2+ 2202*z2*z6+ 1068*z3*z6+ 1068*z4*z6+ 2202*z5*z6- 3538, 4*z2^14-
    6*z2^13*z3- 6*z2^13*z4+ 8*z2^12*z3*z4- 6*z2^13*z5+ 8*z2^12*z3*z5+
    8*z2^12*z4*z5- 10*z2^11*z3*z4*z5- 2*z2^13*z6+ 2*z2^12*z3*z6+ 2*z2^12*z4*z6-
    2*z2^11*z3*z4*z6+ 2*z2^12*z5*z6- 2*z2^11*z3*z5*z6- 2*z2^11*z4*z5*z6+
    2*z2^10*z3*z4*z5*z6- 2*z2^12*z6^2+ 2*z2^11*z3*z6^2+ 2*z2^11*z4*z6^2-
    2*z2^10*z3*z4*z6^2+ 2*z2^11*z5*z6^2- 2*z2^10*z3*z5*z6^2- 2*z2^10*z4*z5*z6^2+
    2*z2^9*z3*z4*z5*z6^2- 2*z2^11*z6^3+ 2*z2^10*z3*z6^3+ 2*z2^10*z4*z6^3-
    2*z2^9*z3*z4*z6^3+ 2*z2^10*z5*z6^3- 2*z2^9*z3*z5*z6^3- 2*z2^9*z4*z5*z6^3+
    2*z2^8*z3*z4*z5*z6^3- 2*z2^10*z6^4+ 2*z2^9*z3*z6^4+ 2*z2^9*z4*z6^4-
    2*z2^8*z3*z4*z6^4+ 2*z2^9*z5*z6^4- 2*z2^8*z3*z5*z6^4- 2*z2^8*z4*z5*z6^4+
    2*z2^7*z3*z4*z5*z6^4- 2*z2^9*z6^5+ 2*z2^8*z3*z6^5+ 2*z2^8*z4*z6^5-
    2*z2^7*z3*z4*z6^5+ 2*z2^8*z5*z6^5- 2*z2^7*z3*z5*z6^5- 2*z2^7*z4*z5*z6^5+
    2*z2^6*z3*z4*z5*z6^5- 2*z2^8*z6^6+ 2*z2^7*z3*z6^6+ 2*z2^7*z4*z6^6-
    2*z2^6*z3*z4*z6^6+ 2*z2^7*z5*z6^6- 2*z2^6*z3*z5*z6^6- 2*z2^6*z4*z5*z6^6+
    2*z2^5*z3*z4*z5*z6^6- 2*z2^7*z6^7+ 2*z2^6*z3*z6^7+ 2*z2^6*z4*z6^7-
    2*z2^5*z3*z4*z6^7+ 2*z2^6*z5*z6^7- 2*z2^5*z3*z5*z6^7- 2*z2^5*z4*z5*z6^7+
    2*z2^4*z3*z4*z5*z6^7- 2*z2^6*z6^8+ 2*z2^5*z3*z6^8+ 2*z2^5*z4*z6^8-
    2*z2^4*z3*z4*z6^8+ 2*z2^5*z5*z6^8- 2*z2^4*z3*z5*z6^8- 2*z2^4*z4*z5*z6^8+
    2*z2^3*z3*z4*z5*z6^8- 2*z2^5*z6^9+ 2*z2^4*z3*z6^9+ 2*z2^4*z4*z6^9-
    2*z2^3*z3*z4*z6^9+ 2*z2^4*z5*z6^9- 2*z2^3*z3*z5*z6^9- 2*z2^3*z4*z5*z6^9+
    2*z2^2*z3*z4*z5*z6^9- 2*z2^4*z6^10+ 2*z2^3*z3*z6^10+ 2*z2^3*z4*z6^10-
    2*z2^2*z3*z4*z6^10+ 2*z2^3*z5*z6^10- 2*z2^2*z3*z5*z6^10- 2*z2^2*z4*z5*z6^10+
    2*z2*z3*z4*z5*z6^10- 2*z2^3*z6^11+ 2*z2^2*z3*z6^11+ 2*z2^2*z4*z6^11-
    2*z2*z3*z4*z6^11+ 2*z2^2*z5*z6^11- 2*z2*z3*z5*z6^11- 2*z2*z4*z5*z6^11-
    10*z3*z4*z5*z6^11- 2*z2^2*z6^12+ 2*z2*z3*z6^12+ 2*z2*z4*z6^12+ 8*z3*z4*z6^12+
    2*z2*z5*z6^12+ 8*z3*z5*z6^12+ 8*z4*z5*z6^12- 2*z2*z6^13- 6*z3*z6^13-
    6*z4*z6^13- 6*z5*z6^13+ 4*z6^14+ 13*z2^12- 10*z2^11*z3- 10*z2^11*z4-
    z2^10*z3*z4- 10*z2^11*z5- z2^10*z3*z5- z2^10*z4*z5+ 22*z2^9*z3*z4*z5+
    3*z2^11*z6- 11*z2^10*z3*z6- 11*z2^10*z4*z6+ 21*z2^9*z3*z4*z6- 11*z2^10*z5*z6+
    21*z2^9*z3*z5*z6+ 21*z2^9*z4*z5*z6- 33*z2^8*z3*z4*z5*z6+ 3*z2^10*z6^2-
    11*z2^9*z3*z6^2- 11*z2^9*z4*z6^2+ 21*z2^8*z3*z4*z6^2- 11*z2^9*z5*z6^2+
    21*z2^8*z3*z5*z6^2+ 21*z2^8*z4*z5*z6^2- 33*z2^7*z3*z4*z5*z6^2+ 3*z2^9*z6^3-
    11*z2^8*z3*z6^3- 11*z2^8*z4*z6^3+ 21*z2^7*z3*z4*z6^3- 11*z2^8*z5*z6^3+
    21*z2^7*z3*z5*z6^3+ 21*z2^7*z4*z5*z6^3- 33*z2^6*z3*z4*z5*z6^3+ 3*z2^8*z6^4-
    11*z2^7*z3*z6^4- 11*z2^7*z4*z6^4+ 21*z2^6*z3*z4*z6^4- 11*z2^7*z5*z6^4+
    21*z2^6*z3*z5*z6^4+ 21*z2^6*z4*z5*z6^4- 33*z2^5*z3*z4*z5*z6^4+ 3*z2^7*z6^5-
    11*z2^6*z3*z6^5- 11*z2^6*z4*z6^5+ 21*z2^5*z3*z4*z6^5- 11*z2^6*z5*z6^5+
    21*z2^5*z3*z5*z6^5+ 21*z2^5*z4*z5*z6^5- 33*z2^4*z3*z4*z5*z6^5+ 3*z2^6*z6^6-
    11*z2^5*z3*z6^6- 11*z2^5*z4*z6^6+ 21*z2^4*z3*z4*z6^6- 11*z2^5*z5*z6^6+
    21*z2^4*z3*z5*z6^6+ 21*z2^4*z4*z5*z6^6- 33*z2^3*z3*z4*z5*z6^6+ 3*z2^5*z6^7-
    11*z2^4*z3*z6^7- 11*z2^4*z4*z6^7+ 21*z2^3*z3*z4*z6^7- 11*z2^4*z5*z6^7+
    21*z2^3*z3*z5*z6^7+ 21*z2^3*z4*z5*z6^7- 33*z2^2*z3*z4*z5*z6^7+ 3*z2^4*z6^8-
    11*z2^3*z3*z6^8- 11*z2^3*z4*z6^8+ 21*z2^2*z3*z4*z6^8- 11*z2^3*z5*z6^8+
    21*z2^2*z3*z5*z6^8+ 21*z2^2*z4*z5*z6^8- 33*z2*z3*z4*z5*z6^8+ 3*z2^3*z6^9-
    11*z2^2*z3*z6^9- 11*z2^2*z4*z6^9+ 21*z2*z3*z4*z6^9- 11*z2^2*z5*z6^9+
    21*z2*z3*z5*z6^9+ 21*z2*z4*z5*z6^9+ 22*z3*z4*z5*z6^9+ 3*z2^2*z6^10-
    11*z2*z3*z6^10- 11*z2*z4*z6^10- z3*z4*z6^10- 11*z2*z5*z6^10- z3*z5*z6^10-
    z4*z5*z6^10+ 3*z2*z6^11- 10*z3*z6^11- 10*z4*z6^11- 10*z5*z6^11+ 13*z6^12+
    12*z2^10- 1121*z2^9*z3- 1121*z2^9*z4+ 2231*z2^8*z3*z4- 1121*z2^9*z5+
    2231*z2^8*z3*z5+ 2231*z2^8*z4*z5- 3363*z2^7*z3*z4*z5- 1109*z2^9*z6+
    1110*z2^8*z3*z6+ 1110*z2^8*z4*z6- 1132*z2^7*z3*z4*z6+ 1110*z2^8*z5*z6-
    1132*z2^7*z3*z5*z6- 1132*z2^7*z4*z5*z6+ 1187*z2^6*z3*z4*z5*z6- 1109*z2^8*z6^2+
    1110*z2^7*z3*z6^2+ 1110*z2^7*z4*z6^2- 1132*z2^6*z3*z4*z6^2+ 1110*z2^7*z5*z6^2-
    1132*z2^6*z3*z5*z6^2- 1132*z2^6*z4*z5*z6^2+ 1187*z2^5*z3*z4*z5*z6^2-
    1109*z2^7*z6^3+ 1110*z2^6*z3*z6^3+ 1110*z2^6*z4*z6^3- 1132*z2^5*z3*z4*z6^3+
    1110*z2^6*z5*z6^3- 1132*z2^5*z3*z5*z6^3- 1132*z2^5*z4*z5*z6^3+
    1187*z2^4*z3*z4*z5*z6^3- 1109*z2^6*z6^4+ 1110*z2^5*z3*z6^4+ 1110*z2^5*z4*z6^4-
    1132*z2^4*z3*z4*z6^4+ 1110*z2^5*z5*z6^4- 1132*z2^4*z3*z5*z6^4-
    1132*z2^4*z4*z5*z6^4+ 1187*z2^3*z3*z4*z5*z6^4- 1109*z2^5*z6^5+
    1110*z2^4*z3*z6^5+ 1110*z2^4*z4*z6^5- 1132*z2^3*z3*z4*z6^5+ 1110*z2^4*z5*z6^5-
    1132*z2^3*z3*z5*z6^5- 1132*z2^3*z4*z5*z6^5+ 1187*z2^2*z3*z4*z5*z6^5-
    1109*z2^4*z6^6+ 1110*z2^3*z3*z6^6+ 1110*z2^3*z4*z6^6- 1132*z2^2*z3*z4*z6^6+
    1110*z2^3*z5*z6^6- 1132*z2^2*z3*z5*z6^6- 1132*z2^2*z4*z5*z6^6+
    1187*z2*z3*z4*z5*z6^6- 1109*z2^3*z6^7+ 1110*z2^2*z3*z6^7+ 1110*z2^2*z4*z6^7-
    1132*z2*z3*z4*z6^7+ 1110*z2^2*z5*z6^7- 1132*z2*z3*z5*z6^7- 1132*z2*z4*z5*z6^7-
    3363*z3*z4*z5*z6^7- 1109*z2^2*z6^8+ 1110*z2*z3*z6^8+ 1110*z2*z4*z6^8+
    2231*z3*z4*z6^8+ 1110*z2*z5*z6^8+ 2231*z3*z5*z6^8+ 2231*z4*z5*z6^8-
    1109*z2*z6^9- 1121*z3*z6^9- 1121*z4*z6^9- 1121*z5*z6^9+ 12*z6^10+ 3374*z2^8-
    3363*z2^7*z3- 3363*z2^7*z4+ 1121*z2^6*z3*z4- 3363*z2^7*z5+ 1121*z2^6*z3*z5+
    1121*z2^6*z4*z5+ 4484*z2^5*z3*z4*z5+ 11*z2^7*z6- 2242*z2^6*z3*z6-
    2242*z2^6*z4*z6- 3396*z2^5*z3*z4*z6- 2242*z2^6*z5*z6- 3396*z2^5*z3*z5*z6-
    3396*z2^5*z4*z5*z6- 1154*z2^4*z3*z4*z5*z6+ 11*z2^6*z6^2- 2242*z2^5*z3*z6^2-
    2242*z2^5*z4*z6^2- 3396*z2^4*z3*z4*z6^2- 2242*z2^5*z5*z6^2-
    3396*z2^4*z3*z5*z6^2- 3396*z2^4*z4*z5*z6^2- 1154*z2^3*z3*z4*z5*z6^2+
    11*z2^5*z6^3- 2242*z2^4*z3*z6^3- 2242*z2^4*z4*z6^3- 3396*z2^3*z3*z4*z6^3-
    2242*z2^4*z5*z6^3- 3396*z2^3*z3*z5*z6^3- 3396*z2^3*z4*z5*z6^3-
    1154*z2^2*z3*z4*z5*z6^3+ 11*z2^4*z6^4- 2242*z2^3*z3*z6^4- 2242*z2^3*z4*z6^4-
    3396*z2^2*z3*z4*z6^4- 2242*z2^3*z5*z6^4- 3396*z2^2*z3*z5*z6^4-
    3396*z2^2*z4*z5*z6^4- 1154*z2*z3*z4*z5*z6^4+ 11*z2^3*z6^5- 2242*z2^2*z3*z6^5-
    2242*z2^2*z4*z6^5- 3396*z2*z3*z4*z6^5- 2242*z2^2*z5*z6^5- 3396*z2*z3*z5*z6^5-
    3396*z2*z4*z5*z6^5+ 4484*z3*z4*z5*z6^5+ 11*z2^2*z6^6- 2242*z2*z3*z6^6-
    2242*z2*z4*z6^6+ 1121*z3*z4*z6^6- 2242*z2*z5*z6^6+ 1121*z3*z5*z6^6+
    1121*z4*z5*z6^6+ 11*z2*z6^7- 3363*z3*z6^7- 3363*z4*z6^7- 3363*z5*z6^7+
    3374*z6^8- 147*z2^6- 2740*z2^5*z3- 2740*z2^5*z4- 4495*z2^4*z3*z4-
    2740*z2^5*z5- 4495*z2^4*z3*z5- 4495*z2^4*z4*z5- 1755*z2^3*z3*z4*z5-
    2887*z2^5*z6+ 1766*z2^4*z3*z6+ 1766*z2^4*z4*z6+ 2751*z2^3*z3*z4*z6+
    1766*z2^4*z5*z6+ 2751*z2^3*z3*z5*z6+ 2751*z2^3*z4*z5*z6+
    2887*z2^2*z3*z4*z5*z6- 2887*z2^4*z6^2+ 1766*z2^3*z3*z6^2+ 1766*z2^3*z4*z6^2+
    2751*z2^2*z3*z4*z6^2+ 1766*z2^3*z5*z6^2+ 2751*z2^2*z3*z5*z6^2+
    2751*z2^2*z4*z5*z6^2+ 2887*z2*z3*z4*z5*z6^2- 2887*z2^3*z6^3+
    1766*z2^2*z3*z6^3+ 1766*z2^2*z4*z6^3+ 2751*z2*z3*z4*z6^3+ 1766*z2^2*z5*z6^3+
    2751*z2*z3*z5*z6^3+ 2751*z2*z4*z5*z6^3- 1755*z3*z4*z5*z6^3- 2887*z2^2*z6^4+
    1766*z2*z3*z6^4+ 1766*z2*z4*z6^4- 4495*z3*z4*z6^4+ 1766*z2*z5*z6^4-
    4495*z3*z5*z6^4- 4495*z4*z5*z6^4- 2887*z2*z6^5- 2740*z3*z6^5- 2740*z4*z6^5-
    2740*z5*z6^5- 147*z6^6- 318*z2^4- 3588*z2^3*z3- 3588*z2^3*z4+ 2988*z2^2*z3*z4-
    3588*z2^3*z5+ 2988*z2^2*z3*z5+ 2988*z2^2*z4*z5- 633*z2*z3*z4*z5- 3906*z2^3*z6-
    600*z2^2*z3*z6- 600*z2^2*z4*z6+ 2355*z2*z3*z4*z6- 600*z2^2*z5*z6+
    2355*z2*z3*z5*z6+ 2355*z2*z4*z5*z6- 633*z3*z4*z5*z6- 3906*z2^2*z6^2-
    600*z2*z3*z6^2- 600*z2*z4*z6^2+ 2988*z3*z4*z6^2- 600*z2*z5*z6^2+
    2988*z3*z5*z6^2+ 2988*z4*z5*z6^2- 3906*z2*z6^3- 3588*z3*z6^3- 3588*z4*z6^3-
    3588*z5*z6^3- 318*z6^4+ 1776*z2^2+ 2202*z2*z3+ 2202*z2*z4+ 1068*z3*z4+
    2202*z2*z5+ 1068*z3*z5+ 1068*z4*z5+ 3978*z2*z6+ 2202*z3*z6+ 2202*z4*z6+
    2202*z5*z6+ 1776*z6^2- 3538, - 6*z2*z3^13+ 4*z3^14+ 2*z2*z3^12*z4- 2*z3^13*z4+
    2*z2*z3^11*z4^2- 2*z3^12*z4^2+ 2*z2*z3^10*z4^3- 2*z3^11*z4^3+ 2*z2*z3^9*z4^4-
    2*z3^10*z4^4+ 2*z2*z3^8*z4^5- 2*z3^9*z4^5+ 2*z2*z3^7*z4^6- 2*z3^8*z4^6+
    2*z2*z3^6*z4^7- 2*z3^7*z4^7+ 2*z2*z3^5*z4^8- 2*z3^6*z4^8+ 2*z2*z3^4*z4^9-
    2*z3^5*z4^9+ 2*z2*z3^3*z4^10- 2*z3^4*z4^10+ 2*z2*z3^2*z4^11- 2*z3^3*z4^11+
    2*z2*z3*z4^12- 2*z3^2*z4^12- 6*z2*z4^13- 2*z3*z4^13+ 4*z4^14+ 8*z2*z3^12*z5-
    6*z3^13*z5- 2*z2*z3^11*z4*z5+ 2*z3^12*z4*z5- 2*z2*z3^10*z4^2*z5+
    2*z3^11*z4^2*z5- 2*z2*z3^9*z4^3*z5+ 2*z3^10*z4^3*z5- 2*z2*z3^8*z4^4*z5+
    2*z3^9*z4^4*z5- 2*z2*z3^7*z4^5*z5+ 2*z3^8*z4^5*z5- 2*z2*z3^6*z4^6*z5+
    2*z3^7*z4^6*z5- 2*z2*z3^5*z4^7*z5+ 2*z3^6*z4^7*z5- 2*z2*z3^4*z4^8*z5+
    2*z3^5*z4^8*z5- 2*z2*z3^3*z4^9*z5+ 2*z3^4*z4^9*z5- 2*z2*z3^2*z4^10*z5+
    2*z3^3*z4^10*z5- 2*z2*z3*z4^11*z5+ 2*z3^2*z4^11*z5+ 8*z2*z4^12*z5+
    2*z3*z4^12*z5- 6*z4^13*z5+ 8*z2*z3^12*z6- 6*z3^13*z6- 2*z2*z3^11*z4*z6+
    2*z3^12*z4*z6- 2*z2*z3^10*z4^2*z6+ 2*z3^11*z4^2*z6- 2*z2*z3^9*z4^3*z6+
    2*z3^10*z4^3*z6- 2*z2*z3^8*z4^4*z6+ 2*z3^9*z4^4*z6- 2*z2*z3^7*z4^5*z6+
    2*z3^8*z4^5*z6- 2*z2*z3^6*z4^6*z6+ 2*z3^7*z4^6*z6- 2*z2*z3^5*z4^7*z6+
    2*z3^6*z4^7*z6- 2*z2*z3^4*z4^8*z6+ 2*z3^5*z4^8*z6- 2*z2*z3^3*z4^9*z6+
    2*z3^4*z4^9*z6- 2*z2*z3^2*z4^10*z6+ 2*z3^3*z4^10*z6- 2*z2*z3*z4^11*z6+
    2*z3^2*z4^11*z6+ 8*z2*z4^12*z6+ 2*z3*z4^12*z6- 6*z4^13*z6- 10*z2*z3^11*z5*z6+
    8*z3^12*z5*z6+ 2*z2*z3^10*z4*z5*z6- 2*z3^11*z4*z5*z6+ 2*z2*z3^9*z4^2*z5*z6-
    2*z3^10*z4^2*z5*z6+ 2*z2*z3^8*z4^3*z5*z6- 2*z3^9*z4^3*z5*z6+
    2*z2*z3^7*z4^4*z5*z6- 2*z3^8*z4^4*z5*z6+ 2*z2*z3^6*z4^5*z5*z6-
    2*z3^7*z4^5*z5*z6+ 2*z2*z3^5*z4^6*z5*z6- 2*z3^6*z4^6*z5*z6+
    2*z2*z3^4*z4^7*z5*z6- 2*z3^5*z4^7*z5*z6+ 2*z2*z3^3*z4^8*z5*z6-
    2*z3^4*z4^8*z5*z6+ 2*z2*z3^2*z4^9*z5*z6- 2*z3^3*z4^9*z5*z6+
    2*z2*z3*z4^10*z5*z6- 2*z3^2*z4^10*z5*z6- 10*z2*z4^11*z5*z6- 2*z3*z4^11*z5*z6+
    8*z4^12*z5*z6- 10*z2*z3^11+ 13*z3^12- 11*z2*z3^10*z4+ 3*z3^11*z4-
    11*z2*z3^9*z4^2+ 3*z3^10*z4^2- 11*z2*z3^8*z4^3+ 3*z3^9*z4^3- 11*z2*z3^7*z4^4+
    3*z3^8*z4^4- 11*z2*z3^6*z4^5+ 3*z3^7*z4^5- 11*z2*z3^5*z4^6+ 3*z3^6*z4^6-
    11*z2*z3^4*z4^7+ 3*z3^5*z4^7- 11*z2*z3^3*z4^8+ 3*z3^4*z4^8- 11*z2*z3^2*z4^9+
    3*z3^3*z4^9- 11*z2*z3*z4^10+ 3*z3^2*z4^10- 10*z2*z4^11+ 3*z3*z4^11+ 13*z4^12-
    z2*z3^10*z5- 10*z3^11*z5+ 21*z2*z3^9*z4*z5- 11*z3^10*z4*z5+
    21*z2*z3^8*z4^2*z5- 11*z3^9*z4^2*z5+ 21*z2*z3^7*z4^3*z5- 11*z3^8*z4^3*z5+
    21*z2*z3^6*z4^4*z5- 11*z3^7*z4^4*z5+ 21*z2*z3^5*z4^5*z5- 11*z3^6*z4^5*z5+
    21*z2*z3^4*z4^6*z5- 11*z3^5*z4^6*z5+ 21*z2*z3^3*z4^7*z5- 11*z3^4*z4^7*z5+
    21*z2*z3^2*z4^8*z5- 11*z3^3*z4^8*z5+ 21*z2*z3*z4^9*z5- 11*z3^2*z4^9*z5-
    z2*z4^10*z5- 11*z3*z4^10*z5- 10*z4^11*z5- z2*z3^10*z6- 10*z3^11*z6+
    21*z2*z3^9*z4*z6- 11*z3^10*z4*z6+ 21*z2*z3^8*z4^2*z6- 11*z3^9*z4^2*z6+
    21*z2*z3^7*z4^3*z6- 11*z3^8*z4^3*z6+ 21*z2*z3^6*z4^4*z6- 11*z3^7*z4^4*z6+
    21*z2*z3^5*z4^5*z6- 11*z3^6*z4^5*z6+ 21*z2*z3^4*z4^6*z6- 11*z3^5*z4^6*z6+
    21*z2*z3^3*z4^7*z6- 11*z3^4*z4^7*z6+ 21*z2*z3^2*z4^8*z6- 11*z3^3*z4^8*z6+
    21*z2*z3*z4^9*z6- 11*z3^2*z4^9*z6- z2*z4^10*z6- 11*z3*z4^10*z6- 10*z4^11*z6+
    22*z2*z3^9*z5*z6- z3^10*z5*z6- 33*z2*z3^8*z4*z5*z6+ 21*z3^9*z4*z5*z6-
    33*z2*z3^7*z4^2*z5*z6+ 21*z3^8*z4^2*z5*z6- 33*z2*z3^6*z4^3*z5*z6+
    21*z3^7*z4^3*z5*z6- 33*z2*z3^5*z4^4*z5*z6+ 21*z3^6*z4^4*z5*z6-
    33*z2*z3^4*z4^5*z5*z6+ 21*z3^5*z4^5*z5*z6- 33*z2*z3^3*z4^6*z5*z6+
    21*z3^4*z4^6*z5*z6- 33*z2*z3^2*z4^7*z5*z6+ 21*z3^3*z4^7*z5*z6-
    33*z2*z3*z4^8*z5*z6+ 21*z3^2*z4^8*z5*z6+ 22*z2*z4^9*z5*z6+ 21*z3*z4^9*z5*z6-
    z4^10*z5*z6- 1121*z2*z3^9+ 12*z3^10+ 1110*z2*z3^8*z4- 1109*z3^9*z4+
    1110*z2*z3^7*z4^2- 1109*z3^8*z4^2+ 1110*z2*z3^6*z4^3- 1109*z3^7*z4^3+
    1110*z2*z3^5*z4^4- 1109*z3^6*z4^4+ 1110*z2*z3^4*z4^5- 1109*z3^5*z4^5+
    1110*z2*z3^3*z4^6- 1109*z3^4*z4^6+ 1110*z2*z3^2*z4^7- 1109*z3^3*z4^7+
    1110*z2*z3*z4^8- 1109*z3^2*z4^8- 1121*z2*z4^9- 1109*z3*z4^9+ 12*z4^10+
    2231*z2*z3^8*z5- 1121*z3^9*z5- 1132*z2*z3^7*z4*z5+ 1110*z3^8*z4*z5-
    1132*z2*z3^6*z4^2*z5+ 1110*z3^7*z4^2*z5- 1132*z2*z3^5*z4^3*z5+
    1110*z3^6*z4^3*z5- 1132*z2*z3^4*z4^4*z5+ 1110*z3^5*z4^4*z5-
    1132*z2*z3^3*z4^5*z5+ 1110*z3^4*z4^5*z5- 1132*z2*z3^2*z4^6*z5+
    1110*z3^3*z4^6*z5- 1132*z2*z3*z4^7*z5+ 1110*z3^2*z4^7*z5+ 2231*z2*z4^8*z5+
    1110*z3*z4^8*z5- 1121*z4^9*z5+ 2231*z2*z3^8*z6- 1121*z3^9*z6-
    1132*z2*z3^7*z4*z6+ 1110*z3^8*z4*z6- 1132*z2*z3^6*z4^2*z6+ 1110*z3^7*z4^2*z6-
    1132*z2*z3^5*z4^3*z6+ 1110*z3^6*z4^3*z6- 1132*z2*z3^4*z4^4*z6+
    1110*z3^5*z4^4*z6- 1132*z2*z3^3*z4^5*z6+ 1110*z3^4*z4^5*z6-
    1132*z2*z3^2*z4^6*z6+ 1110*z3^3*z4^6*z6- 1132*z2*z3*z4^7*z6+
    1110*z3^2*z4^7*z6+ 2231*z2*z4^8*z6+ 1110*z3*z4^8*z6- 1121*z4^9*z6-
    3363*z2*z3^7*z5*z6+ 2231*z3^8*z5*z6+ 1187*z2*z3^6*z4*z5*z6-
    1132*z3^7*z4*z5*z6+ 1187*z2*z3^5*z4^2*z5*z6- 1132*z3^6*z4^2*z5*z6+
    1187*z2*z3^4*z4^3*z5*z6- 1132*z3^5*z4^3*z5*z6+ 1187*z2*z3^3*z4^4*z5*z6-
    1132*z3^4*z4^4*z5*z6+ 1187*z2*z3^2*z4^5*z5*z6- 1132*z3^3*z4^5*z5*z6+
    1187*z2*z3*z4^6*z5*z6- 1132*z3^2*z4^6*z5*z6- 3363*z2*z4^7*z5*z6-
    1132*z3*z4^7*z5*z6+ 2231*z4^8*z5*z6- 3363*z2*z3^7+ 3374*z3^8- 2242*z2*z3^6*z4+
    11*z3^7*z4- 2242*z2*z3^5*z4^2+ 11*z3^6*z4^2- 2242*z2*z3^4*z4^3+ 11*z3^5*z4^3-
    2242*z2*z3^3*z4^4+ 11*z3^4*z4^4- 2242*z2*z3^2*z4^5+ 11*z3^3*z4^5-
    2242*z2*z3*z4^6+ 11*z3^2*z4^6- 3363*z2*z4^7+ 11*z3*z4^7+ 3374*z4^8+
    1121*z2*z3^6*z5- 3363*z3^7*z5- 3396*z2*z3^5*z4*z5- 2242*z3^6*z4*z5-
    3396*z2*z3^4*z4^2*z5- 2242*z3^5*z4^2*z5- 3396*z2*z3^3*z4^3*z5-
    2242*z3^4*z4^3*z5- 3396*z2*z3^2*z4^4*z5- 2242*z3^3*z4^4*z5-
    3396*z2*z3*z4^5*z5- 2242*z3^2*z4^5*z5+ 1121*z2*z4^6*z5- 2242*z3*z4^6*z5-
    3363*z4^7*z5+ 1121*z2*z3^6*z6- 3363*z3^7*z6- 3396*z2*z3^5*z4*z6-
    2242*z3^6*z4*z6- 3396*z2*z3^4*z4^2*z6- 2242*z3^5*z4^2*z6-
    3396*z2*z3^3*z4^3*z6- 2242*z3^4*z4^3*z6- 3396*z2*z3^2*z4^4*z6-
    2242*z3^3*z4^4*z6- 3396*z2*z3*z4^5*z6- 2242*z3^2*z4^5*z6+ 1121*z2*z4^6*z6-
    2242*z3*z4^6*z6- 3363*z4^7*z6+ 4484*z2*z3^5*z5*z6+ 1121*z3^6*z5*z6-
    1154*z2*z3^4*z4*z5*z6- 3396*z3^5*z4*z5*z6- 1154*z2*z3^3*z4^2*z5*z6-
    3396*z3^4*z4^2*z5*z6- 1154*z2*z3^2*z4^3*z5*z6- 3396*z3^3*z4^3*z5*z6-
    1154*z2*z3*z4^4*z5*z6- 3396*z3^2*z4^4*z5*z6+ 4484*z2*z4^5*z5*z6-
    3396*z3*z4^5*z5*z6+ 1121*z4^6*z5*z6- 2740*z2*z3^5- 147*z3^6+ 1766*z2*z3^4*z4-
    2887*z3^5*z4+ 1766*z2*z3^3*z4^2- 2887*z3^4*z4^2+ 1766*z2*z3^2*z4^3-
    2887*z3^3*z4^3+ 1766*z2*z3*z4^4- 2887*z3^2*z4^4- 2740*z2*z4^5- 2887*z3*z4^5-
    147*z4^6- 4495*z2*z3^4*z5- 2740*z3^5*z5+ 2751*z2*z3^3*z4*z5+ 1766*z3^4*z4*z5+
    2751*z2*z3^2*z4^2*z5+ 1766*z3^3*z4^2*z5+ 2751*z2*z3*z4^3*z5+
    1766*z3^2*z4^3*z5- 4495*z2*z4^4*z5+ 1766*z3*z4^4*z5- 2740*z4^5*z5-
    4495*z2*z3^4*z6- 2740*z3^5*z6+ 2751*z2*z3^3*z4*z6+ 1766*z3^4*z4*z6+
    2751*z2*z3^2*z4^2*z6+ 1766*z3^3*z4^2*z6+ 2751*z2*z3*z4^3*z6+
    1766*z3^2*z4^3*z6- 4495*z2*z4^4*z6+ 1766*z3*z4^4*z6- 2740*z4^5*z6-
    1755*z2*z3^3*z5*z6- 4495*z3^4*z5*z6+ 2887*z2*z3^2*z4*z5*z6+
    2751*z3^3*z4*z5*z6+ 2887*z2*z3*z4^2*z5*z6+ 2751*z3^2*z4^2*z5*z6-
    1755*z2*z4^3*z5*z6+ 2751*z3*z4^3*z5*z6- 4495*z4^4*z5*z6- 3588*z2*z3^3-
    318*z3^4- 600*z2*z3^2*z4- 3906*z3^3*z4- 600*z2*z3*z4^2- 3906*z3^2*z4^2-
    3588*z2*z4^3- 3906*z3*z4^3- 318*z4^4+ 2988*z2*z3^2*z5- 3588*z3^3*z5+
    2355*z2*z3*z4*z5- 600*z3^2*z4*z5+ 2988*z2*z4^2*z5- 600*z3*z4^2*z5-
    3588*z4^3*z5+ 2988*z2*z3^2*z6- 3588*z3^3*z6+ 2355*z2*z3*z4*z6- 600*z3^2*z4*z6+
    2988*z2*z4^2*z6- 600*z3*z4^2*z6- 3588*z4^3*z6- 633*z2*z3*z5*z6+
    2988*z3^2*z5*z6- 633*z2*z4*z5*z6+ 2355*z3*z4*z5*z6+ 2988*z4^2*z5*z6+
    2202*z2*z3+ 1776*z3^2+ 2202*z2*z4+ 3978*z3*z4+ 1776*z4^2+ 1068*z2*z5+
    2202*z3*z5+ 2202*z4*z5+ 1068*z2*z6+ 2202*z3*z6+ 2202*z4*z6+ 1068*z5*z6- 3538,
    - 6*z2*z3^13+ 4*z3^14+ 8*z2*z3^12*z4- 6*z3^13*z4+ 2*z2*z3^12*z5- 2*z3^13*z5-
    2*z2*z3^11*z4*z5+ 2*z3^12*z4*z5+ 2*z2*z3^11*z5^2- 2*z3^12*z5^2-
    2*z2*z3^10*z4*z5^2+ 2*z3^11*z4*z5^2+ 2*z2*z3^10*z5^3- 2*z3^11*z5^3-
    2*z2*z3^9*z4*z5^3+ 2*z3^10*z4*z5^3+ 2*z2*z3^9*z5^4- 2*z3^10*z5^4-
    2*z2*z3^8*z4*z5^4+ 2*z3^9*z4*z5^4+ 2*z2*z3^8*z5^5- 2*z3^9*z5^5-
    2*z2*z3^7*z4*z5^5+ 2*z3^8*z4*z5^5+ 2*z2*z3^7*z5^6- 2*z3^8*z5^6-
    2*z2*z3^6*z4*z5^6+ 2*z3^7*z4*z5^6+ 2*z2*z3^6*z5^7- 2*z3^7*z5^7-
    2*z2*z3^5*z4*z5^7+ 2*z3^6*z4*z5^7+ 2*z2*z3^5*z5^8- 2*z3^6*z5^8-
    2*z2*z3^4*z4*z5^8+ 2*z3^5*z4*z5^8+ 2*z2*z3^4*z5^9- 2*z3^5*z5^9-
    2*z2*z3^3*z4*z5^9+ 2*z3^4*z4*z5^9+ 2*z2*z3^3*z5^10- 2*z3^4*z5^10-
    2*z2*z3^2*z4*z5^10+ 2*z3^3*z4*z5^10+ 2*z2*z3^2*z5^11- 2*z3^3*z5^11-
    2*z2*z3*z4*z5^11+ 2*z3^2*z4*z5^11+ 2*z2*z3*z5^12- 2*z3^2*z5^12+ 8*z2*z4*z5^12+
    2*z3*z4*z5^12- 6*z2*z5^13- 2*z3*z5^13- 6*z4*z5^13+ 4*z5^14+ 8*z2*z3^12*z6-
    6*z3^13*z6- 10*z2*z3^11*z4*z6+ 8*z3^12*z4*z6- 2*z2*z3^11*z5*z6+ 2*z3^12*z5*z6+
    2*z2*z3^10*z4*z5*z6- 2*z3^11*z4*z5*z6- 2*z2*z3^10*z5^2*z6+ 2*z3^11*z5^2*z6+
    2*z2*z3^9*z4*z5^2*z6- 2*z3^10*z4*z5^2*z6- 2*z2*z3^9*z5^3*z6+ 2*z3^10*z5^3*z6+
    2*z2*z3^8*z4*z5^3*z6- 2*z3^9*z4*z5^3*z6- 2*z2*z3^8*z5^4*z6+ 2*z3^9*z5^4*z6+
    2*z2*z3^7*z4*z5^4*z6- 2*z3^8*z4*z5^4*z6- 2*z2*z3^7*z5^5*z6+ 2*z3^8*z5^5*z6+
    2*z2*z3^6*z4*z5^5*z6- 2*z3^7*z4*z5^5*z6- 2*z2*z3^6*z5^6*z6+ 2*z3^7*z5^6*z6+
    2*z2*z3^5*z4*z5^6*z6- 2*z3^6*z4*z5^6*z6- 2*z2*z3^5*z5^7*z6+ 2*z3^6*z5^7*z6+
    2*z2*z3^4*z4*z5^7*z6- 2*z3^5*z4*z5^7*z6- 2*z2*z3^4*z5^8*z6+ 2*z3^5*z5^8*z6+
    2*z2*z3^3*z4*z5^8*z6- 2*z3^4*z4*z5^8*z6- 2*z2*z3^3*z5^9*z6+ 2*z3^4*z5^9*z6+
    2*z2*z3^2*z4*z5^9*z6- 2*z3^3*z4*z5^9*z6- 2*z2*z3^2*z5^10*z6+ 2*z3^3*z5^10*z6+
    2*z2*z3*z4*z5^10*z6- 2*z3^2*z4*z5^10*z6- 2*z2*z3*z5^11*z6+ 2*z3^2*z5^11*z6-
    10*z2*z4*z5^11*z6- 2*z3*z4*z5^11*z6+ 8*z2*z5^12*z6+ 2*z3*z5^12*z6+
    8*z4*z5^12*z6- 6*z5^13*z6- 10*z2*z3^11+ 13*z3^12- z2*z3^10*z4- 10*z3^11*z4-
    11*z2*z3^10*z5+ 3*z3^11*z5+ 21*z2*z3^9*z4*z5- 11*z3^10*z4*z5- 11*z2*z3^9*z5^2+
    3*z3^10*z5^2+ 21*z2*z3^8*z4*z5^2- 11*z3^9*z4*z5^2- 11*z2*z3^8*z5^3+
    3*z3^9*z5^3+ 21*z2*z3^7*z4*z5^3- 11*z3^8*z4*z5^3- 11*z2*z3^7*z5^4+
    3*z3^8*z5^4+ 21*z2*z3^6*z4*z5^4- 11*z3^7*z4*z5^4- 11*z2*z3^6*z5^5+
    3*z3^7*z5^5+ 21*z2*z3^5*z4*z5^5- 11*z3^6*z4*z5^5- 11*z2*z3^5*z5^6+
    3*z3^6*z5^6+ 21*z2*z3^4*z4*z5^6- 11*z3^5*z4*z5^6- 11*z2*z3^4*z5^7+
    3*z3^5*z5^7+ 21*z2*z3^3*z4*z5^7- 11*z3^4*z4*z5^7- 11*z2*z3^3*z5^8+
    3*z3^4*z5^8+ 21*z2*z3^2*z4*z5^8- 11*z3^3*z4*z5^8- 11*z2*z3^2*z5^9+
    3*z3^3*z5^9+ 21*z2*z3*z4*z5^9- 11*z3^2*z4*z5^9- 11*z2*z3*z5^10+ 3*z3^2*z5^10-
    z2*z4*z5^10- 11*z3*z4*z5^10- 10*z2*z5^11+ 3*z3*z5^11- 10*z4*z5^11+ 13*z5^12-
    z2*z3^10*z6- 10*z3^11*z6+ 22*z2*z3^9*z4*z6- z3^10*z4*z6+ 21*z2*z3^9*z5*z6-
    11*z3^10*z5*z6- 33*z2*z3^8*z4*z5*z6+ 21*z3^9*z4*z5*z6+ 21*z2*z3^8*z5^2*z6-
    11*z3^9*z5^2*z6- 33*z2*z3^7*z4*z5^2*z6+ 21*z3^8*z4*z5^2*z6+
    21*z2*z3^7*z5^3*z6- 11*z3^8*z5^3*z6- 33*z2*z3^6*z4*z5^3*z6+
    21*z3^7*z4*z5^3*z6+ 21*z2*z3^6*z5^4*z6- 11*z3^7*z5^4*z6-
    33*z2*z3^5*z4*z5^4*z6+ 21*z3^6*z4*z5^4*z6+ 21*z2*z3^5*z5^5*z6-
    11*z3^6*z5^5*z6- 33*z2*z3^4*z4*z5^5*z6+ 21*z3^5*z4*z5^5*z6+
    21*z2*z3^4*z5^6*z6- 11*z3^5*z5^6*z6- 33*z2*z3^3*z4*z5^6*z6+
    21*z3^4*z4*z5^6*z6+ 21*z2*z3^3*z5^7*z6- 11*z3^4*z5^7*z6-
    33*z2*z3^2*z4*z5^7*z6+ 21*z3^3*z4*z5^7*z6+ 21*z2*z3^2*z5^8*z6-
    11*z3^3*z5^8*z6- 33*z2*z3*z4*z5^8*z6+ 21*z3^2*z4*z5^8*z6+ 21*z2*z3*z5^9*z6-
    11*z3^2*z5^9*z6+ 22*z2*z4*z5^9*z6+ 21*z3*z4*z5^9*z6- z2*z5^10*z6-
    11*z3*z5^10*z6- z4*z5^10*z6- 10*z5^11*z6- 1121*z2*z3^9+ 12*z3^10+
    2231*z2*z3^8*z4- 1121*z3^9*z4+ 1110*z2*z3^8*z5- 1109*z3^9*z5-
    1132*z2*z3^7*z4*z5+ 1110*z3^8*z4*z5+ 1110*z2*z3^7*z5^2- 1109*z3^8*z5^2-
    1132*z2*z3^6*z4*z5^2+ 1110*z3^7*z4*z5^2+ 1110*z2*z3^6*z5^3- 1109*z3^7*z5^3-
    1132*z2*z3^5*z4*z5^3+ 1110*z3^6*z4*z5^3+ 1110*z2*z3^5*z5^4- 1109*z3^6*z5^4-
    1132*z2*z3^4*z4*z5^4+ 1110*z3^5*z4*z5^4+ 1110*z2*z3^4*z5^5- 1109*z3^5*z5^5-
    1132*z2*z3^3*z4*z5^5+ 1110*z3^4*z4*z5^5+ 1110*z2*z3^3*z5^6- 1109*z3^4*z5^6-
    1132*z2*z3^2*z4*z5^6+ 1110*z3^3*z4*z5^6+ 1110*z2*z3^2*z5^7- 1109*z3^3*z5^7-
    1132*z2*z3*z4*z5^7+ 1110*z3^2*z4*z5^7+ 1110*z2*z3*z5^8- 1109*z3^2*z5^8+
    2231*z2*z4*z5^8+ 1110*z3*z4*z5^8- 1121*z2*z5^9- 1109*z3*z5^9- 1121*z4*z5^9+
    12*z5^10+ 2231*z2*z3^8*z6- 1121*z3^9*z6- 3363*z2*z3^7*z4*z6+ 2231*z3^8*z4*z6-
    1132*z2*z3^7*z5*z6+ 1110*z3^8*z5*z6+ 1187*z2*z3^6*z4*z5*z6-
    1132*z3^7*z4*z5*z6- 1132*z2*z3^6*z5^2*z6+ 1110*z3^7*z5^2*z6+
    1187*z2*z3^5*z4*z5^2*z6- 1132*z3^6*z4*z5^2*z6- 1132*z2*z3^5*z5^3*z6+
    1110*z3^6*z5^3*z6+ 1187*z2*z3^4*z4*z5^3*z6- 1132*z3^5*z4*z5^3*z6-
    1132*z2*z3^4*z5^4*z6+ 1110*z3^5*z5^4*z6+ 1187*z2*z3^3*z4*z5^4*z6-
    1132*z3^4*z4*z5^4*z6- 1132*z2*z3^3*z5^5*z6+ 1110*z3^4*z5^5*z6+
    1187*z2*z3^2*z4*z5^5*z6- 1132*z3^3*z4*z5^5*z6- 1132*z2*z3^2*z5^6*z6+
    1110*z3^3*z5^6*z6+ 1187*z2*z3*z4*z5^6*z6- 1132*z3^2*z4*z5^6*z6-
    1132*z2*z3*z5^7*z6+ 1110*z3^2*z5^7*z6- 3363*z2*z4*z5^7*z6- 1132*z3*z4*z5^7*z6+
    2231*z2*z5^8*z6+ 1110*z3*z5^8*z6+ 2231*z4*z5^8*z6- 1121*z5^9*z6- 3363*z2*z3^7+
    3374*z3^8+ 1121*z2*z3^6*z4- 3363*z3^7*z4- 2242*z2*z3^6*z5+ 11*z3^7*z5-
    3396*z2*z3^5*z4*z5- 2242*z3^6*z4*z5- 2242*z2*z3^5*z5^2+ 11*z3^6*z5^2-
    3396*z2*z3^4*z4*z5^2- 2242*z3^5*z4*z5^2- 2242*z2*z3^4*z5^3+ 11*z3^5*z5^3-
    3396*z2*z3^3*z4*z5^3- 2242*z3^4*z4*z5^3- 2242*z2*z3^3*z5^4+ 11*z3^4*z5^4-
    3396*z2*z3^2*z4*z5^4- 2242*z3^3*z4*z5^4- 2242*z2*z3^2*z5^5+ 11*z3^3*z5^5-
    3396*z2*z3*z4*z5^5- 2242*z3^2*z4*z5^5- 2242*z2*z3*z5^6+ 11*z3^2*z5^6+
    1121*z2*z4*z5^6- 2242*z3*z4*z5^6- 3363*z2*z5^7+ 11*z3*z5^7- 3363*z4*z5^7+
    3374*z5^8+ 1121*z2*z3^6*z6- 3363*z3^7*z6+ 4484*z2*z3^5*z4*z6+ 1121*z3^6*z4*z6-
    3396*z2*z3^5*z5*z6- 2242*z3^6*z5*z6- 1154*z2*z3^4*z4*z5*z6-
    3396*z3^5*z4*z5*z6- 3396*z2*z3^4*z5^2*z6- 2242*z3^5*z5^2*z6-
    1154*z2*z3^3*z4*z5^2*z6- 3396*z3^4*z4*z5^2*z6- 3396*z2*z3^3*z5^3*z6-
    2242*z3^4*z5^3*z6- 1154*z2*z3^2*z4*z5^3*z6- 3396*z3^3*z4*z5^3*z6-
    3396*z2*z3^2*z5^4*z6- 2242*z3^3*z5^4*z6- 1154*z2*z3*z4*z5^4*z6-
    3396*z3^2*z4*z5^4*z6- 3396*z2*z3*z5^5*z6- 2242*z3^2*z5^5*z6+
    4484*z2*z4*z5^5*z6- 3396*z3*z4*z5^5*z6+ 1121*z2*z5^6*z6- 2242*z3*z5^6*z6+
    1121*z4*z5^6*z6- 3363*z5^7*z6- 2740*z2*z3^5- 147*z3^6- 4495*z2*z3^4*z4-
    2740*z3^5*z4+ 1766*z2*z3^4*z5- 2887*z3^5*z5+ 2751*z2*z3^3*z4*z5+
    1766*z3^4*z4*z5+ 1766*z2*z3^3*z5^2- 2887*z3^4*z5^2+ 2751*z2*z3^2*z4*z5^2+
    1766*z3^3*z4*z5^2+ 1766*z2*z3^2*z5^3- 2887*z3^3*z5^3+ 2751*z2*z3*z4*z5^3+
    1766*z3^2*z4*z5^3+ 1766*z2*z3*z5^4- 2887*z3^2*z5^4- 4495*z2*z4*z5^4+
    1766*z3*z4*z5^4- 2740*z2*z5^5- 2887*z3*z5^5- 2740*z4*z5^5- 147*z5^6-
    4495*z2*z3^4*z6- 2740*z3^5*z6- 1755*z2*z3^3*z4*z6- 4495*z3^4*z4*z6+
    2751*z2*z3^3*z5*z6+ 1766*z3^4*z5*z6+ 2887*z2*z3^2*z4*z5*z6+
    2751*z3^3*z4*z5*z6+ 2751*z2*z3^2*z5^2*z6+ 1766*z3^3*z5^2*z6+
    2887*z2*z3*z4*z5^2*z6+ 2751*z3^2*z4*z5^2*z6+ 2751*z2*z3*z5^3*z6+
    1766*z3^2*z5^3*z6- 1755*z2*z4*z5^3*z6+ 2751*z3*z4*z5^3*z6- 4495*z2*z5^4*z6+
    1766*z3*z5^4*z6- 4495*z4*z5^4*z6- 2740*z5^5*z6- 3588*z2*z3^3- 318*z3^4+
    2988*z2*z3^2*z4- 3588*z3^3*z4- 600*z2*z3^2*z5- 3906*z3^3*z5+ 2355*z2*z3*z4*z5-
    600*z3^2*z4*z5- 600*z2*z3*z5^2- 3906*z3^2*z5^2+ 2988*z2*z4*z5^2-
    600*z3*z4*z5^2- 3588*z2*z5^3- 3906*z3*z5^3- 3588*z4*z5^3- 318*z5^4+
    2988*z2*z3^2*z6- 3588*z3^3*z6- 633*z2*z3*z4*z6+ 2988*z3^2*z4*z6+
    2355*z2*z3*z5*z6- 600*z3^2*z5*z6- 633*z2*z4*z5*z6+ 2355*z3*z4*z5*z6+
    2988*z2*z5^2*z6- 600*z3*z5^2*z6+ 2988*z4*z5^2*z6- 3588*z5^3*z6+ 2202*z2*z3+
    1776*z3^2+ 1068*z2*z4+ 2202*z3*z4+ 2202*z2*z5+ 3978*z3*z5+ 2202*z4*z5+
    1776*z5^2+ 1068*z2*z6+ 2202*z3*z6+ 1068*z4*z6+ 2202*z5*z6- 3538, - 6*z2*z3^13+
    4*z3^14+ 8*z2*z3^12*z4- 6*z3^13*z4+ 8*z2*z3^12*z5- 6*z3^13*z5-
    10*z2*z3^11*z4*z5+ 8*z3^12*z4*z5+ 2*z2*z3^12*z6- 2*z3^13*z6- 2*z2*z3^11*z4*z6+
    2*z3^12*z4*z6- 2*z2*z3^11*z5*z6+ 2*z3^12*z5*z6+ 2*z2*z3^10*z4*z5*z6-
    2*z3^11*z4*z5*z6+ 2*z2*z3^11*z6^2- 2*z3^12*z6^2- 2*z2*z3^10*z4*z6^2+
    2*z3^11*z4*z6^2- 2*z2*z3^10*z5*z6^2+ 2*z3^11*z5*z6^2+ 2*z2*z3^9*z4*z5*z6^2-
    2*z3^10*z4*z5*z6^2+ 2*z2*z3^10*z6^3- 2*z3^11*z6^3- 2*z2*z3^9*z4*z6^3+
    2*z3^10*z4*z6^3- 2*z2*z3^9*z5*z6^3+ 2*z3^10*z5*z6^3+ 2*z2*z3^8*z4*z5*z6^3-
    2*z3^9*z4*z5*z6^3+ 2*z2*z3^9*z6^4- 2*z3^10*z6^4- 2*z2*z3^8*z4*z6^4+
    2*z3^9*z4*z6^4- 2*z2*z3^8*z5*z6^4+ 2*z3^9*z5*z6^4+ 2*z2*z3^7*z4*z5*z6^4-
    2*z3^8*z4*z5*z6^4+ 2*z2*z3^8*z6^5- 2*z3^9*z6^5- 2*z2*z3^7*z4*z6^5+
    2*z3^8*z4*z6^5- 2*z2*z3^7*z5*z6^5+ 2*z3^8*z5*z6^5+ 2*z2*z3^6*z4*z5*z6^5-
    2*z3^7*z4*z5*z6^5+ 2*z2*z3^7*z6^6- 2*z3^8*z6^6- 2*z2*z3^6*z4*z6^6+
    2*z3^7*z4*z6^6- 2*z2*z3^6*z5*z6^6+ 2*z3^7*z5*z6^6+ 2*z2*z3^5*z4*z5*z6^6-
    2*z3^6*z4*z5*z6^6+ 2*z2*z3^6*z6^7- 2*z3^7*z6^7- 2*z2*z3^5*z4*z6^7+
    2*z3^6*z4*z6^7- 2*z2*z3^5*z5*z6^7+ 2*z3^6*z5*z6^7+ 2*z2*z3^4*z4*z5*z6^7-
    2*z3^5*z4*z5*z6^7+ 2*z2*z3^5*z6^8- 2*z3^6*z6^8- 2*z2*z3^4*z4*z6^8+
    2*z3^5*z4*z6^8- 2*z2*z3^4*z5*z6^8+ 2*z3^5*z5*z6^8+ 2*z2*z3^3*z4*z5*z6^8-
    2*z3^4*z4*z5*z6^8+ 2*z2*z3^4*z6^9- 2*z3^5*z6^9- 2*z2*z3^3*z4*z6^9+
    2*z3^4*z4*z6^9- 2*z2*z3^3*z5*z6^9+ 2*z3^4*z5*z6^9+ 2*z2*z3^2*z4*z5*z6^9-
    2*z3^3*z4*z5*z6^9+ 2*z2*z3^3*z6^10- 2*z3^4*z6^10- 2*z2*z3^2*z4*z6^10+
    2*z3^3*z4*z6^10- 2*z2*z3^2*z5*z6^10+ 2*z3^3*z5*z6^10+ 2*z2*z3*z4*z5*z6^10-
    2*z3^2*z4*z5*z6^10+ 2*z2*z3^2*z6^11- 2*z3^3*z6^11- 2*z2*z3*z4*z6^11+
    2*z3^2*z4*z6^11- 2*z2*z3*z5*z6^11+ 2*z3^2*z5*z6^11- 10*z2*z4*z5*z6^11-
    2*z3*z4*z5*z6^11+ 2*z2*z3*z6^12- 2*z3^2*z6^12+ 8*z2*z4*z6^12+ 2*z3*z4*z6^12+
    8*z2*z5*z6^12+ 2*z3*z5*z6^12+ 8*z4*z5*z6^12- 6*z2*z6^13- 2*z3*z6^13-
    6*z4*z6^13- 6*z5*z6^13+ 4*z6^14- 10*z2*z3^11+ 13*z3^12- z2*z3^10*z4-
    10*z3^11*z4- z2*z3^10*z5- 10*z3^11*z5+ 22*z2*z3^9*z4*z5- z3^10*z4*z5-
    11*z2*z3^10*z6+ 3*z3^11*z6+ 21*z2*z3^9*z4*z6- 11*z3^10*z4*z6+
    21*z2*z3^9*z5*z6- 11*z3^10*z5*z6- 33*z2*z3^8*z4*z5*z6+ 21*z3^9*z4*z5*z6-
    11*z2*z3^9*z6^2+ 3*z3^10*z6^2+ 21*z2*z3^8*z4*z6^2- 11*z3^9*z4*z6^2+
    21*z2*z3^8*z5*z6^2- 11*z3^9*z5*z6^2- 33*z2*z3^7*z4*z5*z6^2+
    21*z3^8*z4*z5*z6^2- 11*z2*z3^8*z6^3+ 3*z3^9*z6^3+ 21*z2*z3^7*z4*z6^3-
    11*z3^8*z4*z6^3+ 21*z2*z3^7*z5*z6^3- 11*z3^8*z5*z6^3- 33*z2*z3^6*z4*z5*z6^3+
    21*z3^7*z4*z5*z6^3- 11*z2*z3^7*z6^4+ 3*z3^8*z6^4+ 21*z2*z3^6*z4*z6^4-
    11*z3^7*z4*z6^4+ 21*z2*z3^6*z5*z6^4- 11*z3^7*z5*z6^4- 33*z2*z3^5*z4*z5*z6^4+
    21*z3^6*z4*z5*z6^4- 11*z2*z3^6*z6^5+ 3*z3^7*z6^5+ 21*z2*z3^5*z4*z6^5-
    11*z3^6*z4*z6^5+ 21*z2*z3^5*z5*z6^5- 11*z3^6*z5*z6^5- 33*z2*z3^4*z4*z5*z6^5+
    21*z3^5*z4*z5*z6^5- 11*z2*z3^5*z6^6+ 3*z3^6*z6^6+ 21*z2*z3^4*z4*z6^6-
    11*z3^5*z4*z6^6+ 21*z2*z3^4*z5*z6^6- 11*z3^5*z5*z6^6- 33*z2*z3^3*z4*z5*z6^6+
    21*z3^4*z4*z5*z6^6- 11*z2*z3^4*z6^7+ 3*z3^5*z6^7+ 21*z2*z3^3*z4*z6^7-
    11*z3^4*z4*z6^7+ 21*z2*z3^3*z5*z6^7- 11*z3^4*z5*z6^7- 33*z2*z3^2*z4*z5*z6^7+
    21*z3^3*z4*z5*z6^7- 11*z2*z3^3*z6^8+ 3*z3^4*z6^8+ 21*z2*z3^2*z4*z6^8-
    11*z3^3*z4*z6^8+ 21*z2*z3^2*z5*z6^8- 11*z3^3*z5*z6^8- 33*z2*z3*z4*z5*z6^8+
    21*z3^2*z4*z5*z6^8- 11*z2*z3^2*z6^9+ 3*z3^3*z6^9+ 21*z2*z3*z4*z6^9-
    11*z3^2*z4*z6^9+ 21*z2*z3*z5*z6^9- 11*z3^2*z5*z6^9+ 22*z2*z4*z5*z6^9+
    21*z3*z4*z5*z6^9- 11*z2*z3*z6^10+ 3*z3^2*z6^10- z2*z4*z6^10- 11*z3*z4*z6^10-
    z2*z5*z6^10- 11*z3*z5*z6^10- z4*z5*z6^10- 10*z2*z6^11+ 3*z3*z6^11-
    10*z4*z6^11- 10*z5*z6^11+ 13*z6^12- 1121*z2*z3^9+ 12*z3^10+ 2231*z2*z3^8*z4-
    1121*z3^9*z4+ 2231*z2*z3^8*z5- 1121*z3^9*z5- 3363*z2*z3^7*z4*z5+
    2231*z3^8*z4*z5+ 1110*z2*z3^8*z6- 1109*z3^9*z6- 1132*z2*z3^7*z4*z6+
    1110*z3^8*z4*z6- 1132*z2*z3^7*z5*z6+ 1110*z3^8*z5*z6+ 1187*z2*z3^6*z4*z5*z6-
    1132*z3^7*z4*z5*z6+ 1110*z2*z3^7*z6^2- 1109*z3^8*z6^2- 1132*z2*z3^6*z4*z6^2+
    1110*z3^7*z4*z6^2- 1132*z2*z3^6*z5*z6^2+ 1110*z3^7*z5*z6^2+
    1187*z2*z3^5*z4*z5*z6^2- 1132*z3^6*z4*z5*z6^2+ 1110*z2*z3^6*z6^3-
    1109*z3^7*z6^3- 1132*z2*z3^5*z4*z6^3+ 1110*z3^6*z4*z6^3- 1132*z2*z3^5*z5*z6^3+
    1110*z3^6*z5*z6^3+ 1187*z2*z3^4*z4*z5*z6^3- 1132*z3^5*z4*z5*z6^3+
    1110*z2*z3^5*z6^4- 1109*z3^6*z6^4- 1132*z2*z3^4*z4*z6^4+ 1110*z3^5*z4*z6^4-
    1132*z2*z3^4*z5*z6^4+ 1110*z3^5*z5*z6^4+ 1187*z2*z3^3*z4*z5*z6^4-
    1132*z3^4*z4*z5*z6^4+ 1110*z2*z3^4*z6^5- 1109*z3^5*z6^5- 1132*z2*z3^3*z4*z6^5+
    1110*z3^4*z4*z6^5- 1132*z2*z3^3*z5*z6^5+ 1110*z3^4*z5*z6^5+
    1187*z2*z3^2*z4*z5*z6^5- 1132*z3^3*z4*z5*z6^5+ 1110*z2*z3^3*z6^6-
    1109*z3^4*z6^6- 1132*z2*z3^2*z4*z6^6+ 1110*z3^3*z4*z6^6- 1132*z2*z3^2*z5*z6^6+
    1110*z3^3*z5*z6^6+ 1187*z2*z3*z4*z5*z6^6- 1132*z3^2*z4*z5*z6^6+
    1110*z2*z3^2*z6^7- 1109*z3^3*z6^7- 1132*z2*z3*z4*z6^7+ 1110*z3^2*z4*z6^7-
    1132*z2*z3*z5*z6^7+ 1110*z3^2*z5*z6^7- 3363*z2*z4*z5*z6^7- 1132*z3*z4*z5*z6^7+
    1110*z2*z3*z6^8- 1109*z3^2*z6^8+ 2231*z2*z4*z6^8+ 1110*z3*z4*z6^8+
    2231*z2*z5*z6^8+ 1110*z3*z5*z6^8+ 2231*z4*z5*z6^8- 1121*z2*z6^9- 1109*z3*z6^9-
    1121*z4*z6^9- 1121*z5*z6^9+ 12*z6^10- 3363*z2*z3^7+ 3374*z3^8+
    1121*z2*z3^6*z4- 3363*z3^7*z4+ 1121*z2*z3^6*z5- 3363*z3^7*z5+
    4484*z2*z3^5*z4*z5+ 1121*z3^6*z4*z5- 2242*z2*z3^6*z6+ 11*z3^7*z6-
    3396*z2*z3^5*z4*z6- 2242*z3^6*z4*z6- 3396*z2*z3^5*z5*z6- 2242*z3^6*z5*z6-
    1154*z2*z3^4*z4*z5*z6- 3396*z3^5*z4*z5*z6- 2242*z2*z3^5*z6^2+ 11*z3^6*z6^2-
    3396*z2*z3^4*z4*z6^2- 2242*z3^5*z4*z6^2- 3396*z2*z3^4*z5*z6^2-
    2242*z3^5*z5*z6^2- 1154*z2*z3^3*z4*z5*z6^2- 3396*z3^4*z4*z5*z6^2-
    2242*z2*z3^4*z6^3+ 11*z3^5*z6^3- 3396*z2*z3^3*z4*z6^3- 2242*z3^4*z4*z6^3-
    3396*z2*z3^3*z5*z6^3- 2242*z3^4*z5*z6^3- 1154*z2*z3^2*z4*z5*z6^3-
    3396*z3^3*z4*z5*z6^3- 2242*z2*z3^3*z6^4+ 11*z3^4*z6^4- 3396*z2*z3^2*z4*z6^4-
    2242*z3^3*z4*z6^4- 3396*z2*z3^2*z5*z6^4- 2242*z3^3*z5*z6^4-
    1154*z2*z3*z4*z5*z6^4- 3396*z3^2*z4*z5*z6^4- 2242*z2*z3^2*z6^5+ 11*z3^3*z6^5-
    3396*z2*z3*z4*z6^5- 2242*z3^2*z4*z6^5- 3396*z2*z3*z5*z6^5- 2242*z3^2*z5*z6^5+
    4484*z2*z4*z5*z6^5- 3396*z3*z4*z5*z6^5- 2242*z2*z3*z6^6+ 11*z3^2*z6^6+
    1121*z2*z4*z6^6- 2242*z3*z4*z6^6+ 1121*z2*z5*z6^6- 2242*z3*z5*z6^6+
    1121*z4*z5*z6^6- 3363*z2*z6^7+ 11*z3*z6^7- 3363*z4*z6^7- 3363*z5*z6^7+
    3374*z6^8- 2740*z2*z3^5- 147*z3^6- 4495*z2*z3^4*z4- 2740*z3^5*z4-
    4495*z2*z3^4*z5- 2740*z3^5*z5- 1755*z2*z3^3*z4*z5- 4495*z3^4*z4*z5+
    1766*z2*z3^4*z6- 2887*z3^5*z6+ 2751*z2*z3^3*z4*z6+ 1766*z3^4*z4*z6+
    2751*z2*z3^3*z5*z6+ 1766*z3^4*z5*z6+ 2887*z2*z3^2*z4*z5*z6+
    2751*z3^3*z4*z5*z6+ 1766*z2*z3^3*z6^2- 2887*z3^4*z6^2+ 2751*z2*z3^2*z4*z6^2+
    1766*z3^3*z4*z6^2+ 2751*z2*z3^2*z5*z6^2+ 1766*z3^3*z5*z6^2+
    2887*z2*z3*z4*z5*z6^2+ 2751*z3^2*z4*z5*z6^2+ 1766*z2*z3^2*z6^3-
    2887*z3^3*z6^3+ 2751*z2*z3*z4*z6^3+ 1766*z3^2*z4*z6^3+ 2751*z2*z3*z5*z6^3+
    1766*z3^2*z5*z6^3- 1755*z2*z4*z5*z6^3+ 2751*z3*z4*z5*z6^3+ 1766*z2*z3*z6^4-
    2887*z3^2*z6^4- 4495*z2*z4*z6^4+ 1766*z3*z4*z6^4- 4495*z2*z5*z6^4+
    1766*z3*z5*z6^4- 4495*z4*z5*z6^4- 2740*z2*z6^5- 2887*z3*z6^5- 2740*z4*z6^5-
    2740*z5*z6^5- 147*z6^6- 3588*z2*z3^3- 318*z3^4+ 2988*z2*z3^2*z4- 3588*z3^3*z4+
    2988*z2*z3^2*z5- 3588*z3^3*z5- 633*z2*z3*z4*z5+ 2988*z3^2*z4*z5-
    600*z2*z3^2*z6- 3906*z3^3*z6+ 2355*z2*z3*z4*z6- 600*z3^2*z4*z6+
    2355*z2*z3*z5*z6- 600*z3^2*z5*z6- 633*z2*z4*z5*z6+ 2355*z3*z4*z5*z6-
    600*z2*z3*z6^2- 3906*z3^2*z6^2+ 2988*z2*z4*z6^2- 600*z3*z4*z6^2+
    2988*z2*z5*z6^2- 600*z3*z5*z6^2+ 2988*z4*z5*z6^2- 3588*z2*z6^3- 3906*z3*z6^3-
    3588*z4*z6^3- 3588*z5*z6^3- 318*z6^4+ 2202*z2*z3+ 1776*z3^2+ 1068*z2*z4+
    2202*z3*z4+ 1068*z2*z5+ 2202*z3*z5+ 1068*z4*z5+ 2202*z2*z6+ 3978*z3*z6+
    2202*z4*z6+ 2202*z5*z6+ 1776*z6^2- 3538, 8*z2*z3*z4^12- 6*z2*z4^13-
    6*z3*z4^13+ 4*z4^14- 2*z2*z3*z4^11*z5+ 2*z2*z4^12*z5+ 2*z3*z4^12*z5-
    2*z4^13*z5- 2*z2*z3*z4^10*z5^2+ 2*z2*z4^11*z5^2+ 2*z3*z4^11*z5^2-
    2*z4^12*z5^2- 2*z2*z3*z4^9*z5^3+ 2*z2*z4^10*z5^3+ 2*z3*z4^10*z5^3-
    2*z4^11*z5^3- 2*z2*z3*z4^8*z5^4+ 2*z2*z4^9*z5^4+ 2*z3*z4^9*z5^4- 2*z4^10*z5^4-
    2*z2*z3*z4^7*z5^5+ 2*z2*z4^8*z5^5+ 2*z3*z4^8*z5^5- 2*z4^9*z5^5-
    2*z2*z3*z4^6*z5^6+ 2*z2*z4^7*z5^6+ 2*z3*z4^7*z5^6- 2*z4^8*z5^6-
    2*z2*z3*z4^5*z5^7+ 2*z2*z4^6*z5^7+ 2*z3*z4^6*z5^7- 2*z4^7*z5^7-
    2*z2*z3*z4^4*z5^8+ 2*z2*z4^5*z5^8+ 2*z3*z4^5*z5^8- 2*z4^6*z5^8-
    2*z2*z3*z4^3*z5^9+ 2*z2*z4^4*z5^9+ 2*z3*z4^4*z5^9- 2*z4^5*z5^9-
    2*z2*z3*z4^2*z5^10+ 2*z2*z4^3*z5^10+ 2*z3*z4^3*z5^10- 2*z4^4*z5^10-
    2*z2*z3*z4*z5^11+ 2*z2*z4^2*z5^11+ 2*z3*z4^2*z5^11- 2*z4^3*z5^11+
    8*z2*z3*z5^12+ 2*z2*z4*z5^12+ 2*z3*z4*z5^12- 2*z4^2*z5^12- 6*z2*z5^13-
    6*z3*z5^13- 2*z4*z5^13+ 4*z5^14- 10*z2*z3*z4^11*z6+ 8*z2*z4^12*z6+
    8*z3*z4^12*z6- 6*z4^13*z6+ 2*z2*z3*z4^10*z5*z6- 2*z2*z4^11*z5*z6-
    2*z3*z4^11*z5*z6+ 2*z4^12*z5*z6+ 2*z2*z3*z4^9*z5^2*z6- 2*z2*z4^10*z5^2*z6-
    2*z3*z4^10*z5^2*z6+ 2*z4^11*z5^2*z6+ 2*z2*z3*z4^8*z5^3*z6- 2*z2*z4^9*z5^3*z6-
    2*z3*z4^9*z5^3*z6+ 2*z4^10*z5^3*z6+ 2*z2*z3*z4^7*z5^4*z6- 2*z2*z4^8*z5^4*z6-
    2*z3*z4^8*z5^4*z6+ 2*z4^9*z5^4*z6+ 2*z2*z3*z4^6*z5^5*z6- 2*z2*z4^7*z5^5*z6-
    2*z3*z4^7*z5^5*z6+ 2*z4^8*z5^5*z6+ 2*z2*z3*z4^5*z5^6*z6- 2*z2*z4^6*z5^6*z6-
    2*z3*z4^6*z5^6*z6+ 2*z4^7*z5^6*z6+ 2*z2*z3*z4^4*z5^7*z6- 2*z2*z4^5*z5^7*z6-
    2*z3*z4^5*z5^7*z6+ 2*z4^6*z5^7*z6+ 2*z2*z3*z4^3*z5^8*z6- 2*z2*z4^4*z5^8*z6-
    2*z3*z4^4*z5^8*z6+ 2*z4^5*z5^8*z6+ 2*z2*z3*z4^2*z5^9*z6- 2*z2*z4^3*z5^9*z6-
    2*z3*z4^3*z5^9*z6+ 2*z4^4*z5^9*z6+ 2*z2*z3*z4*z5^10*z6- 2*z2*z4^2*z5^10*z6-
    2*z3*z4^2*z5^10*z6+ 2*z4^3*z5^10*z6- 10*z2*z3*z5^11*z6- 2*z2*z4*z5^11*z6-
    2*z3*z4*z5^11*z6+ 2*z4^2*z5^11*z6+ 8*z2*z5^12*z6+ 8*z3*z5^12*z6+
    2*z4*z5^12*z6- 6*z5^13*z6- z2*z3*z4^10- 10*z2*z4^11- 10*z3*z4^11+ 13*z4^12+
    21*z2*z3*z4^9*z5- 11*z2*z4^10*z5- 11*z3*z4^10*z5+ 3*z4^11*z5+
    21*z2*z3*z4^8*z5^2- 11*z2*z4^9*z5^2- 11*z3*z4^9*z5^2+ 3*z4^10*z5^2+
    21*z2*z3*z4^7*z5^3- 11*z2*z4^8*z5^3- 11*z3*z4^8*z5^3+ 3*z4^9*z5^3+
    21*z2*z3*z4^6*z5^4- 11*z2*z4^7*z5^4- 11*z3*z4^7*z5^4+ 3*z4^8*z5^4+
    21*z2*z3*z4^5*z5^5- 11*z2*z4^6*z5^5- 11*z3*z4^6*z5^5+ 3*z4^7*z5^5+
    21*z2*z3*z4^4*z5^6- 11*z2*z4^5*z5^6- 11*z3*z4^5*z5^6+ 3*z4^6*z5^6+
    21*z2*z3*z4^3*z5^7- 11*z2*z4^4*z5^7- 11*z3*z4^4*z5^7+ 3*z4^5*z5^7+
    21*z2*z3*z4^2*z5^8- 11*z2*z4^3*z5^8- 11*z3*z4^3*z5^8+ 3*z4^4*z5^8+
    21*z2*z3*z4*z5^9- 11*z2*z4^2*z5^9- 11*z3*z4^2*z5^9+ 3*z4^3*z5^9- z2*z3*z5^10-
    11*z2*z4*z5^10- 11*z3*z4*z5^10+ 3*z4^2*z5^10- 10*z2*z5^11- 10*z3*z5^11+
    3*z4*z5^11+ 13*z5^12+ 22*z2*z3*z4^9*z6- z2*z4^10*z6- z3*z4^10*z6- 10*z4^11*z6-
    33*z2*z3*z4^8*z5*z6+ 21*z2*z4^9*z5*z6+ 21*z3*z4^9*z5*z6- 11*z4^10*z5*z6-
    33*z2*z3*z4^7*z5^2*z6+ 21*z2*z4^8*z5^2*z6+ 21*z3*z4^8*z5^2*z6-
    11*z4^9*z5^2*z6- 33*z2*z3*z4^6*z5^3*z6+ 21*z2*z4^7*z5^3*z6+
    21*z3*z4^7*z5^3*z6- 11*z4^8*z5^3*z6- 33*z2*z3*z4^5*z5^4*z6+
    21*z2*z4^6*z5^4*z6+ 21*z3*z4^6*z5^4*z6- 11*z4^7*z5^4*z6-
    33*z2*z3*z4^4*z5^5*z6+ 21*z2*z4^5*z5^5*z6+ 21*z3*z4^5*z5^5*z6-
    11*z4^6*z5^5*z6- 33*z2*z3*z4^3*z5^6*z6+ 21*z2*z4^4*z5^6*z6+
    21*z3*z4^4*z5^6*z6- 11*z4^5*z5^6*z6- 33*z2*z3*z4^2*z5^7*z6+
    21*z2*z4^3*z5^7*z6+ 21*z3*z4^3*z5^7*z6- 11*z4^4*z5^7*z6- 33*z2*z3*z4*z5^8*z6+
    21*z2*z4^2*z5^8*z6+ 21*z3*z4^2*z5^8*z6- 11*z4^3*z5^8*z6+ 22*z2*z3*z5^9*z6+
    21*z2*z4*z5^9*z6+ 21*z3*z4*z5^9*z6- 11*z4^2*z5^9*z6- z2*z5^10*z6- z3*z5^10*z6-
    11*z4*z5^10*z6- 10*z5^11*z6+ 2231*z2*z3*z4^8- 1121*z2*z4^9- 1121*z3*z4^9+
    12*z4^10- 1132*z2*z3*z4^7*z5+ 1110*z2*z4^8*z5+ 1110*z3*z4^8*z5- 1109*z4^9*z5-
    1132*z2*z3*z4^6*z5^2+ 1110*z2*z4^7*z5^2+ 1110*z3*z4^7*z5^2- 1109*z4^8*z5^2-
    1132*z2*z3*z4^5*z5^3+ 1110*z2*z4^6*z5^3+ 1110*z3*z4^6*z5^3- 1109*z4^7*z5^3-
    1132*z2*z3*z4^4*z5^4+ 1110*z2*z4^5*z5^4+ 1110*z3*z4^5*z5^4- 1109*z4^6*z5^4-
    1132*z2*z3*z4^3*z5^5+ 1110*z2*z4^4*z5^5+ 1110*z3*z4^4*z5^5- 1109*z4^5*z5^5-
    1132*z2*z3*z4^2*z5^6+ 1110*z2*z4^3*z5^6+ 1110*z3*z4^3*z5^6- 1109*z4^4*z5^6-
    1132*z2*z3*z4*z5^7+ 1110*z2*z4^2*z5^7+ 1110*z3*z4^2*z5^7- 1109*z4^3*z5^7+
    2231*z2*z3*z5^8+ 1110*z2*z4*z5^8+ 1110*z3*z4*z5^8- 1109*z4^2*z5^8-
    1121*z2*z5^9- 1121*z3*z5^9- 1109*z4*z5^9+ 12*z5^10- 3363*z2*z3*z4^7*z6+
    2231*z2*z4^8*z6+ 2231*z3*z4^8*z6- 1121*z4^9*z6+ 1187*z2*z3*z4^6*z5*z6-
    1132*z2*z4^7*z5*z6- 1132*z3*z4^7*z5*z6+ 1110*z4^8*z5*z6+
    1187*z2*z3*z4^5*z5^2*z6- 1132*z2*z4^6*z5^2*z6- 1132*z3*z4^6*z5^2*z6+
    1110*z4^7*z5^2*z6+ 1187*z2*z3*z4^4*z5^3*z6- 1132*z2*z4^5*z5^3*z6-
    1132*z3*z4^5*z5^3*z6+ 1110*z4^6*z5^3*z6+ 1187*z2*z3*z4^3*z5^4*z6-
    1132*z2*z4^4*z5^4*z6- 1132*z3*z4^4*z5^4*z6+ 1110*z4^5*z5^4*z6+
    1187*z2*z3*z4^2*z5^5*z6- 1132*z2*z4^3*z5^5*z6- 1132*z3*z4^3*z5^5*z6+
    1110*z4^4*z5^5*z6+ 1187*z2*z3*z4*z5^6*z6- 1132*z2*z4^2*z5^6*z6-
    1132*z3*z4^2*z5^6*z6+ 1110*z4^3*z5^6*z6- 3363*z2*z3*z5^7*z6-
    1132*z2*z4*z5^7*z6- 1132*z3*z4*z5^7*z6+ 1110*z4^2*z5^7*z6+ 2231*z2*z5^8*z6+
    2231*z3*z5^8*z6+ 1110*z4*z5^8*z6- 1121*z5^9*z6+ 1121*z2*z3*z4^6- 3363*z2*z4^7-
    3363*z3*z4^7+ 3374*z4^8- 3396*z2*z3*z4^5*z5- 2242*z2*z4^6*z5- 2242*z3*z4^6*z5+
    11*z4^7*z5- 3396*z2*z3*z4^4*z5^2- 2242*z2*z4^5*z5^2- 2242*z3*z4^5*z5^2+
    11*z4^6*z5^2- 3396*z2*z3*z4^3*z5^3- 2242*z2*z4^4*z5^3- 2242*z3*z4^4*z5^3+
    11*z4^5*z5^3- 3396*z2*z3*z4^2*z5^4- 2242*z2*z4^3*z5^4- 2242*z3*z4^3*z5^4+
    11*z4^4*z5^4- 3396*z2*z3*z4*z5^5- 2242*z2*z4^2*z5^5- 2242*z3*z4^2*z5^5+
    11*z4^3*z5^5+ 1121*z2*z3*z5^6- 2242*z2*z4*z5^6- 2242*z3*z4*z5^6+ 11*z4^2*z5^6-
    3363*z2*z5^7- 3363*z3*z5^7+ 11*z4*z5^7+ 3374*z5^8+ 4484*z2*z3*z4^5*z6+
    1121*z2*z4^6*z6+ 1121*z3*z4^6*z6- 3363*z4^7*z6- 1154*z2*z3*z4^4*z5*z6-
    3396*z2*z4^5*z5*z6- 3396*z3*z4^5*z5*z6- 2242*z4^6*z5*z6-
    1154*z2*z3*z4^3*z5^2*z6- 3396*z2*z4^4*z5^2*z6- 3396*z3*z4^4*z5^2*z6-
    2242*z4^5*z5^2*z6- 1154*z2*z3*z4^2*z5^3*z6- 3396*z2*z4^3*z5^3*z6-
    3396*z3*z4^3*z5^3*z6- 2242*z4^4*z5^3*z6- 1154*z2*z3*z4*z5^4*z6-
    3396*z2*z4^2*z5^4*z6- 3396*z3*z4^2*z5^4*z6- 2242*z4^3*z5^4*z6+
    4484*z2*z3*z5^5*z6- 3396*z2*z4*z5^5*z6- 3396*z3*z4*z5^5*z6- 2242*z4^2*z5^5*z6+
    1121*z2*z5^6*z6+ 1121*z3*z5^6*z6- 2242*z4*z5^6*z6- 3363*z5^7*z6-
    4495*z2*z3*z4^4- 2740*z2*z4^5- 2740*z3*z4^5- 147*z4^6+ 2751*z2*z3*z4^3*z5+
    1766*z2*z4^4*z5+ 1766*z3*z4^4*z5- 2887*z4^5*z5+ 2751*z2*z3*z4^2*z5^2+
    1766*z2*z4^3*z5^2+ 1766*z3*z4^3*z5^2- 2887*z4^4*z5^2+ 2751*z2*z3*z4*z5^3+
    1766*z2*z4^2*z5^3+ 1766*z3*z4^2*z5^3- 2887*z4^3*z5^3- 4495*z2*z3*z5^4+
    1766*z2*z4*z5^4+ 1766*z3*z4*z5^4- 2887*z4^2*z5^4- 2740*z2*z5^5- 2740*z3*z5^5-
    2887*z4*z5^5- 147*z5^6- 1755*z2*z3*z4^3*z6- 4495*z2*z4^4*z6- 4495*z3*z4^4*z6-
    2740*z4^5*z6+ 2887*z2*z3*z4^2*z5*z6+ 2751*z2*z4^3*z5*z6+ 2751*z3*z4^3*z5*z6+
    1766*z4^4*z5*z6+ 2887*z2*z3*z4*z5^2*z6+ 2751*z2*z4^2*z5^2*z6+
    2751*z3*z4^2*z5^2*z6+ 1766*z4^3*z5^2*z6- 1755*z2*z3*z5^3*z6+
    2751*z2*z4*z5^3*z6+ 2751*z3*z4*z5^3*z6+ 1766*z4^2*z5^3*z6- 4495*z2*z5^4*z6-
    4495*z3*z5^4*z6+ 1766*z4*z5^4*z6- 2740*z5^5*z6+ 2988*z2*z3*z4^2- 3588*z2*z4^3-
    3588*z3*z4^3- 318*z4^4+ 2355*z2*z3*z4*z5- 600*z2*z4^2*z5- 600*z3*z4^2*z5-
    3906*z4^3*z5+ 2988*z2*z3*z5^2- 600*z2*z4*z5^2- 600*z3*z4*z5^2- 3906*z4^2*z5^2-
    3588*z2*z5^3- 3588*z3*z5^3- 3906*z4*z5^3- 318*z5^4- 633*z2*z3*z4*z6+
    2988*z2*z4^2*z6+ 2988*z3*z4^2*z6- 3588*z4^3*z6- 633*z2*z3*z5*z6+
    2355*z2*z4*z5*z6+ 2355*z3*z4*z5*z6- 600*z4^2*z5*z6+ 2988*z2*z5^2*z6+
    2988*z3*z5^2*z6- 600*z4*z5^2*z6- 3588*z5^3*z6+ 1068*z2*z3+ 2202*z2*z4+
    2202*z3*z4+ 1776*z4^2+ 2202*z2*z5+ 2202*z3*z5+ 3978*z4*z5+ 1776*z5^2+
    1068*z2*z6+ 1068*z3*z6+ 2202*z4*z6+ 2202*z5*z6- 3538, 8*z2*z3*z4^12-
    6*z2*z4^13- 6*z3*z4^13+ 4*z4^14- 10*z2*z3*z4^11*z5+ 8*z2*z4^12*z5+
    8*z3*z4^12*z5- 6*z4^13*z5- 2*z2*z3*z4^11*z6+ 2*z2*z4^12*z6+ 2*z3*z4^12*z6-
    2*z4^13*z6+ 2*z2*z3*z4^10*z5*z6- 2*z2*z4^11*z5*z6- 2*z3*z4^11*z5*z6+
    2*z4^12*z5*z6- 2*z2*z3*z4^10*z6^2+ 2*z2*z4^11*z6^2+ 2*z3*z4^11*z6^2-
    2*z4^12*z6^2+ 2*z2*z3*z4^9*z5*z6^2- 2*z2*z4^10*z5*z6^2- 2*z3*z4^10*z5*z6^2+
    2*z4^11*z5*z6^2- 2*z2*z3*z4^9*z6^3+ 2*z2*z4^10*z6^3+ 2*z3*z4^10*z6^3-
    2*z4^11*z6^3+ 2*z2*z3*z4^8*z5*z6^3- 2*z2*z4^9*z5*z6^3- 2*z3*z4^9*z5*z6^3+
    2*z4^10*z5*z6^3- 2*z2*z3*z4^8*z6^4+ 2*z2*z4^9*z6^4+ 2*z3*z4^9*z6^4-
    2*z4^10*z6^4+ 2*z2*z3*z4^7*z5*z6^4- 2*z2*z4^8*z5*z6^4- 2*z3*z4^8*z5*z6^4+
    2*z4^9*z5*z6^4- 2*z2*z3*z4^7*z6^5+ 2*z2*z4^8*z6^5+ 2*z3*z4^8*z6^5-
    2*z4^9*z6^5+ 2*z2*z3*z4^6*z5*z6^5- 2*z2*z4^7*z5*z6^5- 2*z3*z4^7*z5*z6^5+
    2*z4^8*z5*z6^5- 2*z2*z3*z4^6*z6^6+ 2*z2*z4^7*z6^6+ 2*z3*z4^7*z6^6-
    2*z4^8*z6^6+ 2*z2*z3*z4^5*z5*z6^6- 2*z2*z4^6*z5*z6^6- 2*z3*z4^6*z5*z6^6+
    2*z4^7*z5*z6^6- 2*z2*z3*z4^5*z6^7+ 2*z2*z4^6*z6^7+ 2*z3*z4^6*z6^7-
    2*z4^7*z6^7+ 2*z2*z3*z4^4*z5*z6^7- 2*z2*z4^5*z5*z6^7- 2*z3*z4^5*z5*z6^7+
    2*z4^6*z5*z6^7- 2*z2*z3*z4^4*z6^8+ 2*z2*z4^5*z6^8+ 2*z3*z4^5*z6^8-
    2*z4^6*z6^8+ 2*z2*z3*z4^3*z5*z6^8- 2*z2*z4^4*z5*z6^8- 2*z3*z4^4*z5*z6^8+
    2*z4^5*z5*z6^8- 2*z2*z3*z4^3*z6^9+ 2*z2*z4^4*z6^9+ 2*z3*z4^4*z6^9-
    2*z4^5*z6^9+ 2*z2*z3*z4^2*z5*z6^9- 2*z2*z4^3*z5*z6^9- 2*z3*z4^3*z5*z6^9+
    2*z4^4*z5*z6^9- 2*z2*z3*z4^2*z6^10+ 2*z2*z4^3*z6^10+ 2*z3*z4^3*z6^10-
    2*z4^4*z6^10+ 2*z2*z3*z4*z5*z6^10- 2*z2*z4^2*z5*z6^10- 2*z3*z4^2*z5*z6^10+
    2*z4^3*z5*z6^10- 2*z2*z3*z4*z6^11+ 2*z2*z4^2*z6^11+ 2*z3*z4^2*z6^11-
    2*z4^3*z6^11- 10*z2*z3*z5*z6^11- 2*z2*z4*z5*z6^11- 2*z3*z4*z5*z6^11+
    2*z4^2*z5*z6^11+ 8*z2*z3*z6^12+ 2*z2*z4*z6^12+ 2*z3*z4*z6^12- 2*z4^2*z6^12+
    8*z2*z5*z6^12+ 8*z3*z5*z6^12+ 2*z4*z5*z6^12- 6*z2*z6^13- 6*z3*z6^13-
    2*z4*z6^13- 6*z5*z6^13+ 4*z6^14- z2*z3*z4^10- 10*z2*z4^11- 10*z3*z4^11+
    13*z4^12+ 22*z2*z3*z4^9*z5- z2*z4^10*z5- z3*z4^10*z5- 10*z4^11*z5+
    21*z2*z3*z4^9*z6- 11*z2*z4^10*z6- 11*z3*z4^10*z6+ 3*z4^11*z6-
    33*z2*z3*z4^8*z5*z6+ 21*z2*z4^9*z5*z6+ 21*z3*z4^9*z5*z6- 11*z4^10*z5*z6+
    21*z2*z3*z4^8*z6^2- 11*z2*z4^9*z6^2- 11*z3*z4^9*z6^2+ 3*z4^10*z6^2-
    33*z2*z3*z4^7*z5*z6^2+ 21*z2*z4^8*z5*z6^2+ 21*z3*z4^8*z5*z6^2-
    11*z4^9*z5*z6^2+ 21*z2*z3*z4^7*z6^3- 11*z2*z4^8*z6^3- 11*z3*z4^8*z6^3+
    3*z4^9*z6^3- 33*z2*z3*z4^6*z5*z6^3+ 21*z2*z4^7*z5*z6^3+ 21*z3*z4^7*z5*z6^3-
    11*z4^8*z5*z6^3+ 21*z2*z3*z4^6*z6^4- 11*z2*z4^7*z6^4- 11*z3*z4^7*z6^4+
    3*z4^8*z6^4- 33*z2*z3*z4^5*z5*z6^4+ 21*z2*z4^6*z5*z6^4+ 21*z3*z4^6*z5*z6^4-
    11*z4^7*z5*z6^4+ 21*z2*z3*z4^5*z6^5- 11*z2*z4^6*z6^5- 11*z3*z4^6*z6^5+
    3*z4^7*z6^5- 33*z2*z3*z4^4*z5*z6^5+ 21*z2*z4^5*z5*z6^5+ 21*z3*z4^5*z5*z6^5-
    11*z4^6*z5*z6^5+ 21*z2*z3*z4^4*z6^6- 11*z2*z4^5*z6^6- 11*z3*z4^5*z6^6+
    3*z4^6*z6^6- 33*z2*z3*z4^3*z5*z6^6+ 21*z2*z4^4*z5*z6^6+ 21*z3*z4^4*z5*z6^6-
    11*z4^5*z5*z6^6+ 21*z2*z3*z4^3*z6^7- 11*z2*z4^4*z6^7- 11*z3*z4^4*z6^7+
    3*z4^5*z6^7- 33*z2*z3*z4^2*z5*z6^7+ 21*z2*z4^3*z5*z6^7+ 21*z3*z4^3*z5*z6^7-
    11*z4^4*z5*z6^7+ 21*z2*z3*z4^2*z6^8- 11*z2*z4^3*z6^8- 11*z3*z4^3*z6^8+
    3*z4^4*z6^8- 33*z2*z3*z4*z5*z6^8+ 21*z2*z4^2*z5*z6^8+ 21*z3*z4^2*z5*z6^8-
    11*z4^3*z5*z6^8+ 21*z2*z3*z4*z6^9- 11*z2*z4^2*z6^9- 11*z3*z4^2*z6^9+
    3*z4^3*z6^9+ 22*z2*z3*z5*z6^9+ 21*z2*z4*z5*z6^9+ 21*z3*z4*z5*z6^9-
    11*z4^2*z5*z6^9- z2*z3*z6^10- 11*z2*z4*z6^10- 11*z3*z4*z6^10+ 3*z4^2*z6^10-
    z2*z5*z6^10- z3*z5*z6^10- 11*z4*z5*z6^10- 10*z2*z6^11- 10*z3*z6^11+
    3*z4*z6^11- 10*z5*z6^11+ 13*z6^12+ 2231*z2*z3*z4^8- 1121*z2*z4^9-
    1121*z3*z4^9+ 12*z4^10- 3363*z2*z3*z4^7*z5+ 2231*z2*z4^8*z5+ 2231*z3*z4^8*z5-
    1121*z4^9*z5- 1132*z2*z3*z4^7*z6+ 1110*z2*z4^8*z6+ 1110*z3*z4^8*z6-
    1109*z4^9*z6+ 1187*z2*z3*z4^6*z5*z6- 1132*z2*z4^7*z5*z6- 1132*z3*z4^7*z5*z6+
    1110*z4^8*z5*z6- 1132*z2*z3*z4^6*z6^2+ 1110*z2*z4^7*z6^2+ 1110*z3*z4^7*z6^2-
    1109*z4^8*z6^2+ 1187*z2*z3*z4^5*z5*z6^2- 1132*z2*z4^6*z5*z6^2-
    1132*z3*z4^6*z5*z6^2+ 1110*z4^7*z5*z6^2- 1132*z2*z3*z4^5*z6^3+
    1110*z2*z4^6*z6^3+ 1110*z3*z4^6*z6^3- 1109*z4^7*z6^3+ 1187*z2*z3*z4^4*z5*z6^3-
    1132*z2*z4^5*z5*z6^3- 1132*z3*z4^5*z5*z6^3+ 1110*z4^6*z5*z6^3-
    1132*z2*z3*z4^4*z6^4+ 1110*z2*z4^5*z6^4+ 1110*z3*z4^5*z6^4- 1109*z4^6*z6^4+
    1187*z2*z3*z4^3*z5*z6^4- 1132*z2*z4^4*z5*z6^4- 1132*z3*z4^4*z5*z6^4+
    1110*z4^5*z5*z6^4- 1132*z2*z3*z4^3*z6^5+ 1110*z2*z4^4*z6^5+ 1110*z3*z4^4*z6^5-
    1109*z4^5*z6^5+ 1187*z2*z3*z4^2*z5*z6^5- 1132*z2*z4^3*z5*z6^5-
    1132*z3*z4^3*z5*z6^5+ 1110*z4^4*z5*z6^5- 1132*z2*z3*z4^2*z6^6+
    1110*z2*z4^3*z6^6+ 1110*z3*z4^3*z6^6- 1109*z4^4*z6^6+ 1187*z2*z3*z4*z5*z6^6-
    1132*z2*z4^2*z5*z6^6- 1132*z3*z4^2*z5*z6^6+ 1110*z4^3*z5*z6^6-
    1132*z2*z3*z4*z6^7+ 1110*z2*z4^2*z6^7+ 1110*z3*z4^2*z6^7- 1109*z4^3*z6^7-
    3363*z2*z3*z5*z6^7- 1132*z2*z4*z5*z6^7- 1132*z3*z4*z5*z6^7+ 1110*z4^2*z5*z6^7+
    2231*z2*z3*z6^8+ 1110*z2*z4*z6^8+ 1110*z3*z4*z6^8- 1109*z4^2*z6^8+
    2231*z2*z5*z6^8+ 2231*z3*z5*z6^8+ 1110*z4*z5*z6^8- 1121*z2*z6^9- 1121*z3*z6^9-
    1109*z4*z6^9- 1121*z5*z6^9+ 12*z6^10+ 1121*z2*z3*z4^6- 3363*z2*z4^7-
    3363*z3*z4^7+ 3374*z4^8+ 4484*z2*z3*z4^5*z5+ 1121*z2*z4^6*z5+ 1121*z3*z4^6*z5-
    3363*z4^7*z5- 3396*z2*z3*z4^5*z6- 2242*z2*z4^6*z6- 2242*z3*z4^6*z6+
    11*z4^7*z6- 1154*z2*z3*z4^4*z5*z6- 3396*z2*z4^5*z5*z6- 3396*z3*z4^5*z5*z6-
    2242*z4^6*z5*z6- 3396*z2*z3*z4^4*z6^2- 2242*z2*z4^5*z6^2- 2242*z3*z4^5*z6^2+
    11*z4^6*z6^2- 1154*z2*z3*z4^3*z5*z6^2- 3396*z2*z4^4*z5*z6^2-
    3396*z3*z4^4*z5*z6^2- 2242*z4^5*z5*z6^2- 3396*z2*z3*z4^3*z6^3-
    2242*z2*z4^4*z6^3- 2242*z3*z4^4*z6^3+ 11*z4^5*z6^3- 1154*z2*z3*z4^2*z5*z6^3-
    3396*z2*z4^3*z5*z6^3- 3396*z3*z4^3*z5*z6^3- 2242*z4^4*z5*z6^3-
    3396*z2*z3*z4^2*z6^4- 2242*z2*z4^3*z6^4- 2242*z3*z4^3*z6^4+ 11*z4^4*z6^4-
    1154*z2*z3*z4*z5*z6^4- 3396*z2*z4^2*z5*z6^4- 3396*z3*z4^2*z5*z6^4-
    2242*z4^3*z5*z6^4- 3396*z2*z3*z4*z6^5- 2242*z2*z4^2*z6^5- 2242*z3*z4^2*z6^5+
    11*z4^3*z6^5+ 4484*z2*z3*z5*z6^5- 3396*z2*z4*z5*z6^5- 3396*z3*z4*z5*z6^5-
    2242*z4^2*z5*z6^5+ 1121*z2*z3*z6^6- 2242*z2*z4*z6^6- 2242*z3*z4*z6^6+
    11*z4^2*z6^6+ 1121*z2*z5*z6^6+ 1121*z3*z5*z6^6- 2242*z4*z5*z6^6- 3363*z2*z6^7-
    3363*z3*z6^7+ 11*z4*z6^7- 3363*z5*z6^7+ 3374*z6^8- 4495*z2*z3*z4^4-
    2740*z2*z4^5- 2740*z3*z4^5- 147*z4^6- 1755*z2*z3*z4^3*z5- 4495*z2*z4^4*z5-
    4495*z3*z4^4*z5- 2740*z4^5*z5+ 2751*z2*z3*z4^3*z6+ 1766*z2*z4^4*z6+
    1766*z3*z4^4*z6- 2887*z4^5*z6+ 2887*z2*z3*z4^2*z5*z6+ 2751*z2*z4^3*z5*z6+
    2751*z3*z4^3*z5*z6+ 1766*z4^4*z5*z6+ 2751*z2*z3*z4^2*z6^2+ 1766*z2*z4^3*z6^2+
    1766*z3*z4^3*z6^2- 2887*z4^4*z6^2+ 2887*z2*z3*z4*z5*z6^2+
    2751*z2*z4^2*z5*z6^2+ 2751*z3*z4^2*z5*z6^2+ 1766*z4^3*z5*z6^2+
    2751*z2*z3*z4*z6^3+ 1766*z2*z4^2*z6^3+ 1766*z3*z4^2*z6^3- 2887*z4^3*z6^3-
    1755*z2*z3*z5*z6^3+ 2751*z2*z4*z5*z6^3+ 2751*z3*z4*z5*z6^3+ 1766*z4^2*z5*z6^3-
    4495*z2*z3*z6^4+ 1766*z2*z4*z6^4+ 1766*z3*z4*z6^4- 2887*z4^2*z6^4-
    4495*z2*z5*z6^4- 4495*z3*z5*z6^4+ 1766*z4*z5*z6^4- 2740*z2*z6^5- 2740*z3*z6^5-
    2887*z4*z6^5- 2740*z5*z6^5- 147*z6^6+ 2988*z2*z3*z4^2- 3588*z2*z4^3-
    3588*z3*z4^3- 318*z4^4- 633*z2*z3*z4*z5+ 2988*z2*z4^2*z5+ 2988*z3*z4^2*z5-
    3588*z4^3*z5+ 2355*z2*z3*z4*z6- 600*z2*z4^2*z6- 600*z3*z4^2*z6- 3906*z4^3*z6-
    633*z2*z3*z5*z6+ 2355*z2*z4*z5*z6+ 2355*z3*z4*z5*z6- 600*z4^2*z5*z6+
    2988*z2*z3*z6^2- 600*z2*z4*z6^2- 600*z3*z4*z6^2- 3906*z4^2*z6^2+
    2988*z2*z5*z6^2+ 2988*z3*z5*z6^2- 600*z4*z5*z6^2- 3588*z2*z6^3- 3588*z3*z6^3-
    3906*z4*z6^3- 3588*z5*z6^3- 318*z6^4+ 1068*z2*z3+ 2202*z2*z4+ 2202*z3*z4+
    1776*z4^2+ 1068*z2*z5+ 1068*z3*z5+ 2202*z4*z5+ 2202*z2*z6+ 2202*z3*z6+
    3978*z4*z6+ 2202*z5*z6+ 1776*z6^2- 3538, - 10*z2*z3*z4*z5^11+ 8*z2*z3*z5^12+
    8*z2*z4*z5^12+ 8*z3*z4*z5^12- 6*z2*z5^13- 6*z3*z5^13- 6*z4*z5^13+ 4*z5^14+
    2*z2*z3*z4*z5^10*z6- 2*z2*z3*z5^11*z6- 2*z2*z4*z5^11*z6- 2*z3*z4*z5^11*z6+
    2*z2*z5^12*z6+ 2*z3*z5^12*z6+ 2*z4*z5^12*z6- 2*z5^13*z6+ 2*z2*z3*z4*z5^9*z6^2-
    2*z2*z3*z5^10*z6^2- 2*z2*z4*z5^10*z6^2- 2*z3*z4*z5^10*z6^2+ 2*z2*z5^11*z6^2+
    2*z3*z5^11*z6^2+ 2*z4*z5^11*z6^2- 2*z5^12*z6^2+ 2*z2*z3*z4*z5^8*z6^3-
    2*z2*z3*z5^9*z6^3- 2*z2*z4*z5^9*z6^3- 2*z3*z4*z5^9*z6^3+ 2*z2*z5^10*z6^3+
    2*z3*z5^10*z6^3+ 2*z4*z5^10*z6^3- 2*z5^11*z6^3+ 2*z2*z3*z4*z5^7*z6^4-
    2*z2*z3*z5^8*z6^4- 2*z2*z4*z5^8*z6^4- 2*z3*z4*z5^8*z6^4+ 2*z2*z5^9*z6^4+
    2*z3*z5^9*z6^4+ 2*z4*z5^9*z6^4- 2*z5^10*z6^4+ 2*z2*z3*z4*z5^6*z6^5-
    2*z2*z3*z5^7*z6^5- 2*z2*z4*z5^7*z6^5- 2*z3*z4*z5^7*z6^5+ 2*z2*z5^8*z6^5+
    2*z3*z5^8*z6^5+ 2*z4*z5^8*z6^5- 2*z5^9*z6^5+ 2*z2*z3*z4*z5^5*z6^6-
    2*z2*z3*z5^6*z6^6- 2*z2*z4*z5^6*z6^6- 2*z3*z4*z5^6*z6^6+ 2*z2*z5^7*z6^6+
    2*z3*z5^7*z6^6+ 2*z4*z5^7*z6^6- 2*z5^8*z6^6+ 2*z2*z3*z4*z5^4*z6^7-
    2*z2*z3*z5^5*z6^7- 2*z2*z4*z5^5*z6^7- 2*z3*z4*z5^5*z6^7+ 2*z2*z5^6*z6^7+
    2*z3*z5^6*z6^7+ 2*z4*z5^6*z6^7- 2*z5^7*z6^7+ 2*z2*z3*z4*z5^3*z6^8-
    2*z2*z3*z5^4*z6^8- 2*z2*z4*z5^4*z6^8- 2*z3*z4*z5^4*z6^8+ 2*z2*z5^5*z6^8+
    2*z3*z5^5*z6^8+ 2*z4*z5^5*z6^8- 2*z5^6*z6^8+ 2*z2*z3*z4*z5^2*z6^9-
    2*z2*z3*z5^3*z6^9- 2*z2*z4*z5^3*z6^9- 2*z3*z4*z5^3*z6^9+ 2*z2*z5^4*z6^9+
    2*z3*z5^4*z6^9+ 2*z4*z5^4*z6^9- 2*z5^5*z6^9+ 2*z2*z3*z4*z5*z6^10-
    2*z2*z3*z5^2*z6^10- 2*z2*z4*z5^2*z6^10- 2*z3*z4*z5^2*z6^10+ 2*z2*z5^3*z6^10+
    2*z3*z5^3*z6^10+ 2*z4*z5^3*z6^10- 2*z5^4*z6^10- 10*z2*z3*z4*z6^11-
    2*z2*z3*z5*z6^11- 2*z2*z4*z5*z6^11- 2*z3*z4*z5*z6^11+ 2*z2*z5^2*z6^11+
    2*z3*z5^2*z6^11+ 2*z4*z5^2*z6^11- 2*z5^3*z6^11+ 8*z2*z3*z6^12+ 8*z2*z4*z6^12+
    8*z3*z4*z6^12+ 2*z2*z5*z6^12+ 2*z3*z5*z6^12+ 2*z4*z5*z6^12- 2*z5^2*z6^12-
    6*z2*z6^13- 6*z3*z6^13- 6*z4*z6^13- 2*z5*z6^13+ 4*z6^14+ 22*z2*z3*z4*z5^9-
    z2*z3*z5^10- z2*z4*z5^10- z3*z4*z5^10- 10*z2*z5^11- 10*z3*z5^11- 10*z4*z5^11+
    13*z5^12- 33*z2*z3*z4*z5^8*z6+ 21*z2*z3*z5^9*z6+ 21*z2*z4*z5^9*z6+
    21*z3*z4*z5^9*z6- 11*z2*z5^10*z6- 11*z3*z5^10*z6- 11*z4*z5^10*z6+ 3*z5^11*z6-
    33*z2*z3*z4*z5^7*z6^2+ 21*z2*z3*z5^8*z6^2+ 21*z2*z4*z5^8*z6^2+
    21*z3*z4*z5^8*z6^2- 11*z2*z5^9*z6^2- 11*z3*z5^9*z6^2- 11*z4*z5^9*z6^2+
    3*z5^10*z6^2- 33*z2*z3*z4*z5^6*z6^3+ 21*z2*z3*z5^7*z6^3+ 21*z2*z4*z5^7*z6^3+
    21*z3*z4*z5^7*z6^3- 11*z2*z5^8*z6^3- 11*z3*z5^8*z6^3- 11*z4*z5^8*z6^3+
    3*z5^9*z6^3- 33*z2*z3*z4*z5^5*z6^4+ 21*z2*z3*z5^6*z6^4+ 21*z2*z4*z5^6*z6^4+
    21*z3*z4*z5^6*z6^4- 11*z2*z5^7*z6^4- 11*z3*z5^7*z6^4- 11*z4*z5^7*z6^4+
    3*z5^8*z6^4- 33*z2*z3*z4*z5^4*z6^5+ 21*z2*z3*z5^5*z6^5+ 21*z2*z4*z5^5*z6^5+
    21*z3*z4*z5^5*z6^5- 11*z2*z5^6*z6^5- 11*z3*z5^6*z6^5- 11*z4*z5^6*z6^5+
    3*z5^7*z6^5- 33*z2*z3*z4*z5^3*z6^6+ 21*z2*z3*z5^4*z6^6+ 21*z2*z4*z5^4*z6^6+
    21*z3*z4*z5^4*z6^6- 11*z2*z5^5*z6^6- 11*z3*z5^5*z6^6- 11*z4*z5^5*z6^6+
    3*z5^6*z6^6- 33*z2*z3*z4*z5^2*z6^7+ 21*z2*z3*z5^3*z6^7+ 21*z2*z4*z5^3*z6^7+
    21*z3*z4*z5^3*z6^7- 11*z2*z5^4*z6^7- 11*z3*z5^4*z6^7- 11*z4*z5^4*z6^7+
    3*z5^5*z6^7- 33*z2*z3*z4*z5*z6^8+ 21*z2*z3*z5^2*z6^8+ 21*z2*z4*z5^2*z6^8+
    21*z3*z4*z5^2*z6^8- 11*z2*z5^3*z6^8- 11*z3*z5^3*z6^8- 11*z4*z5^3*z6^8+
    3*z5^4*z6^8+ 22*z2*z3*z4*z6^9+ 21*z2*z3*z5*z6^9+ 21*z2*z4*z5*z6^9+
    21*z3*z4*z5*z6^9- 11*z2*z5^2*z6^9- 11*z3*z5^2*z6^9- 11*z4*z5^2*z6^9+
    3*z5^3*z6^9- z2*z3*z6^10- z2*z4*z6^10- z3*z4*z6^10- 11*z2*z5*z6^10-
    11*z3*z5*z6^10- 11*z4*z5*z6^10+ 3*z5^2*z6^10- 10*z2*z6^11- 10*z3*z6^11-
    10*z4*z6^11+ 3*z5*z6^11+ 13*z6^12- 3363*z2*z3*z4*z5^7+ 2231*z2*z3*z5^8+
    2231*z2*z4*z5^8+ 2231*z3*z4*z5^8- 1121*z2*z5^9- 1121*z3*z5^9- 1121*z4*z5^9+
    12*z5^10+ 1187*z2*z3*z4*z5^6*z6- 1132*z2*z3*z5^7*z6- 1132*z2*z4*z5^7*z6-
    1132*z3*z4*z5^7*z6+ 1110*z2*z5^8*z6+ 1110*z3*z5^8*z6+ 1110*z4*z5^8*z6-
    1109*z5^9*z6+ 1187*z2*z3*z4*z5^5*z6^2- 1132*z2*z3*z5^6*z6^2-
    1132*z2*z4*z5^6*z6^2- 1132*z3*z4*z5^6*z6^2+ 1110*z2*z5^7*z6^2+
    1110*z3*z5^7*z6^2+ 1110*z4*z5^7*z6^2- 1109*z5^8*z6^2+ 1187*z2*z3*z4*z5^4*z6^3-
    1132*z2*z3*z5^5*z6^3- 1132*z2*z4*z5^5*z6^3- 1132*z3*z4*z5^5*z6^3+
    1110*z2*z5^6*z6^3+ 1110*z3*z5^6*z6^3+ 1110*z4*z5^6*z6^3- 1109*z5^7*z6^3+
    1187*z2*z3*z4*z5^3*z6^4- 1132*z2*z3*z5^4*z6^4- 1132*z2*z4*z5^4*z6^4-
    1132*z3*z4*z5^4*z6^4+ 1110*z2*z5^5*z6^4+ 1110*z3*z5^5*z6^4+ 1110*z4*z5^5*z6^4-
    1109*z5^6*z6^4+ 1187*z2*z3*z4*z5^2*z6^5- 1132*z2*z3*z5^3*z6^5-
    1132*z2*z4*z5^3*z6^5- 1132*z3*z4*z5^3*z6^5+ 1110*z2*z5^4*z6^5+
    1110*z3*z5^4*z6^5+ 1110*z4*z5^4*z6^5- 1109*z5^5*z6^5+ 1187*z2*z3*z4*z5*z6^6-
    1132*z2*z3*z5^2*z6^6- 1132*z2*z4*z5^2*z6^6- 1132*z3*z4*z5^2*z6^6+
    1110*z2*z5^3*z6^6+ 1110*z3*z5^3*z6^6+ 1110*z4*z5^3*z6^6- 1109*z5^4*z6^6-
    3363*z2*z3*z4*z6^7- 1132*z2*z3*z5*z6^7- 1132*z2*z4*z5*z6^7-
    1132*z3*z4*z5*z6^7+ 1110*z2*z5^2*z6^7+ 1110*z3*z5^2*z6^7+ 1110*z4*z5^2*z6^7-
    1109*z5^3*z6^7+ 2231*z2*z3*z6^8+ 2231*z2*z4*z6^8+ 2231*z3*z4*z6^8+
    1110*z2*z5*z6^8+ 1110*z3*z5*z6^8+ 1110*z4*z5*z6^8- 1109*z5^2*z6^8-
    1121*z2*z6^9- 1121*z3*z6^9- 1121*z4*z6^9- 1109*z5*z6^9+ 12*z6^10+
    4484*z2*z3*z4*z5^5+ 1121*z2*z3*z5^6+ 1121*z2*z4*z5^6+ 1121*z3*z4*z5^6-
    3363*z2*z5^7- 3363*z3*z5^7- 3363*z4*z5^7+ 3374*z5^8- 1154*z2*z3*z4*z5^4*z6-
    3396*z2*z3*z5^5*z6- 3396*z2*z4*z5^5*z6- 3396*z3*z4*z5^5*z6- 2242*z2*z5^6*z6-
    2242*z3*z5^6*z6- 2242*z4*z5^6*z6+ 11*z5^7*z6- 1154*z2*z3*z4*z5^3*z6^2-
    3396*z2*z3*z5^4*z6^2- 3396*z2*z4*z5^4*z6^2- 3396*z3*z4*z5^4*z6^2-
    2242*z2*z5^5*z6^2- 2242*z3*z5^5*z6^2- 2242*z4*z5^5*z6^2+ 11*z5^6*z6^2-
    1154*z2*z3*z4*z5^2*z6^3- 3396*z2*z3*z5^3*z6^3- 3396*z2*z4*z5^3*z6^3-
    3396*z3*z4*z5^3*z6^3- 2242*z2*z5^4*z6^3- 2242*z3*z5^4*z6^3- 2242*z4*z5^4*z6^3+
    11*z5^5*z6^3- 1154*z2*z3*z4*z5*z6^4- 3396*z2*z3*z5^2*z6^4-
    3396*z2*z4*z5^2*z6^4- 3396*z3*z4*z5^2*z6^4- 2242*z2*z5^3*z6^4-
    2242*z3*z5^3*z6^4- 2242*z4*z5^3*z6^4+ 11*z5^4*z6^4+ 4484*z2*z3*z4*z6^5-
    3396*z2*z3*z5*z6^5- 3396*z2*z4*z5*z6^5- 3396*z3*z4*z5*z6^5- 2242*z2*z5^2*z6^5-
    2242*z3*z5^2*z6^5- 2242*z4*z5^2*z6^5+ 11*z5^3*z6^5+ 1121*z2*z3*z6^6+
    1121*z2*z4*z6^6+ 1121*z3*z4*z6^6- 2242*z2*z5*z6^6- 2242*z3*z5*z6^6-
    2242*z4*z5*z6^6+ 11*z5^2*z6^6- 3363*z2*z6^7- 3363*z3*z6^7- 3363*z4*z6^7+
    11*z5*z6^7+ 3374*z6^8- 1755*z2*z3*z4*z5^3- 4495*z2*z3*z5^4- 4495*z2*z4*z5^4-
    4495*z3*z4*z5^4- 2740*z2*z5^5- 2740*z3*z5^5- 2740*z4*z5^5- 147*z5^6+
    2887*z2*z3*z4*z5^2*z6+ 2751*z2*z3*z5^3*z6+ 2751*z2*z4*z5^3*z6+
    2751*z3*z4*z5^3*z6+ 1766*z2*z5^4*z6+ 1766*z3*z5^4*z6+ 1766*z4*z5^4*z6-
    2887*z5^5*z6+ 2887*z2*z3*z4*z5*z6^2+ 2751*z2*z3*z5^2*z6^2+
    2751*z2*z4*z5^2*z6^2+ 2751*z3*z4*z5^2*z6^2+ 1766*z2*z5^3*z6^2+
    1766*z3*z5^3*z6^2+ 1766*z4*z5^3*z6^2- 2887*z5^4*z6^2- 1755*z2*z3*z4*z6^3+
    2751*z2*z3*z5*z6^3+ 2751*z2*z4*z5*z6^3+ 2751*z3*z4*z5*z6^3+ 1766*z2*z5^2*z6^3+
    1766*z3*z5^2*z6^3+ 1766*z4*z5^2*z6^3- 2887*z5^3*z6^3- 4495*z2*z3*z6^4-
    4495*z2*z4*z6^4- 4495*z3*z4*z6^4+ 1766*z2*z5*z6^4+ 1766*z3*z5*z6^4+
    1766*z4*z5*z6^4- 2887*z5^2*z6^4- 2740*z2*z6^5- 2740*z3*z6^5- 2740*z4*z6^5-
    2887*z5*z6^5- 147*z6^6- 633*z2*z3*z4*z5+ 2988*z2*z3*z5^2+ 2988*z2*z4*z5^2+
    2988*z3*z4*z5^2- 3588*z2*z5^3- 3588*z3*z5^3- 3588*z4*z5^3- 318*z5^4-
    633*z2*z3*z4*z6+ 2355*z2*z3*z5*z6+ 2355*z2*z4*z5*z6+ 2355*z3*z4*z5*z6-
    600*z2*z5^2*z6- 600*z3*z5^2*z6- 600*z4*z5^2*z6- 3906*z5^3*z6+ 2988*z2*z3*z6^2+
    2988*z2*z4*z6^2+ 2988*z3*z4*z6^2- 600*z2*z5*z6^2- 600*z3*z5*z6^2-
    600*z4*z5*z6^2- 3906*z5^2*z6^2- 3588*z2*z6^3- 3588*z3*z6^3- 3588*z4*z6^3-
    3906*z5*z6^3- 318*z6^4+ 1068*z2*z3+ 1068*z2*z4+ 1068*z3*z4+ 2202*z2*z5+
    2202*z3*z5+ 2202*z4*z5+ 1776*z5^2+ 2202*z2*z6+ 2202*z3*z6+ 2202*z4*z6+
    3978*z5*z6+ 1776*z6^2- 3538, z1*z2^2*z3^2*z4^2*z5^2*z6^2-
    2250*z1*z2^2*z3^2*z4^2*z5^2- 2250*z1*z2^2*z3^2*z4^2*z6^2-
    2250*z1*z2^2*z3^2*z5^2*z6^2- 2250*z1*z2^2*z4^2*z5^2*z6^2-
    2250*z1*z3^2*z4^2*z5^2*z6^2+ 3938*z1*z2^2*z3^2*z4^2+ 3938*z1*z2^2*z3^2*z5^2+
    3938*z1*z2^2*z4^2*z5^2+ 3938*z1*z3^2*z4^2*z5^2+ 3938*z1*z2^2*z3^2*z6^2+
    3938*z1*z2^2*z4^2*z6^2+ 3938*z1*z3^2*z4^2*z6^2+ 3938*z1*z2^2*z5^2*z6^2+
    3938*z1*z3^2*z5^2*z6^2+ 3938*z1*z4^2*z5^2*z6^2- 3516*z1*z2^2*z3^2-
    3516*z1*z2^2*z4^2- 3516*z1*z3^2*z4^2- 3516*z1*z2^2*z5^2- 3516*z1*z3^2*z5^2-
    3516*z1*z4^2*z5^2- 3516*z1*z2^2*z6^2- 3516*z1*z3^2*z6^2- 3516*z1*z4^2*z6^2-
    3516*z1*z5^2*z6^2- 879*z1*z2^2- 879*z1*z3^2- 879*z1*z4^2- 879*z1*z5^2-
    879*z1*z6^2- 2470*z1- 1, - z2- z3- z4- z5- z6+ z7, - z2*z3- z2*z4- z3*z4-
    z2*z5- z3*z5- z4*z5- z2*z6- z3*z6- z4*z6- z5*z6+ z8, - z2*z3*z4- z2*z3*z5-
    z2*z4*z5- z3*z4*z5- z2*z3*z6- z2*z4*z6- z3*z4*z6- z2*z5*z6- z3*z5*z6-
    z4*z5*z6+ z9, - z2*z3*z4*z5- z2*z3*z4*z6- z2*z3*z5*z6- z2*z4*z5*z6-
    z3*z4*z5*z6+ z10, - z2*z3*z4*z5*z6+ z11
    )
  R, id
end

function yang_l12_m6(
    char::Int,
    ord::Symbol=:degrevlex
    )
  if (ord != :lex) && (ord != :degrevlex)
    error("Order not known -- No ideal generated.")
  end
  n = 13
  vars = Array{String, 1}(n)
  # generate dummy array of n strings for generating
  # singular polynomial ring
  for i = 1:n
    vars[i] = "z$(i)"
  end
  if char == 0
    R, X = Singular.PolynomialRing(Singular.QQ, vars, ordering = ord)
  else
    R, X = Singular.PolynomialRing(Singular.N_ZpField(char), vars, ordering = ord)
  end
  global X
  # parses X[i] to xi
  [ eval(parse("$s = X[$i]")) for (i, s) in enumerate(vars) ]
  id = Singular.Ideal(R,
    2*z2^16- 4*z2^15*z3- 4*z2^15*z4+ 6*z2^14*z3*z4- 4*z2^15*z5+ 6*z2^14*z3*z5+
    6*z2^14*z4*z5- 8*z2^13*z3*z4*z5- 4*z2^15*z6+ 6*z2^14*z3*z6+ 6*z2^14*z4*z6-
    8*z2^13*z3*z4*z6+ 6*z2^14*z5*z6- 8*z2^13*z3*z5*z6- 8*z2^13*z4*z5*z6+
    10*z2^12*z3*z4*z5*z6- 4*z2^15*z7+ 6*z2^14*z3*z7+ 6*z2^14*z4*z7-
    8*z2^13*z3*z4*z7+ 6*z2^14*z5*z7- 8*z2^13*z3*z5*z7- 8*z2^13*z4*z5*z7+
    10*z2^12*z3*z4*z5*z7+ 6*z2^14*z6*z7- 8*z2^13*z3*z6*z7- 8*z2^13*z4*z6*z7+
    10*z2^12*z3*z4*z6*z7- 8*z2^13*z5*z6*z7+ 10*z2^12*z3*z5*z6*z7+
    10*z2^12*z4*z5*z6*z7- 12*z2^11*z3*z4*z5*z6*z7+ 10*z2^14- 13*z2^13*z3-
    13*z2^13*z4+ 10*z2^12*z3*z4- 13*z2^13*z5+ 10*z2^12*z3*z5+ 10*z2^12*z4*z5+
    z2^11*z3*z4*z5- 13*z2^13*z6+ 10*z2^12*z3*z6+ 10*z2^12*z4*z6+ z2^11*z3*z4*z6+
    10*z2^12*z5*z6+ z2^11*z3*z5*z6+ z2^11*z4*z5*z6- 22*z2^10*z3*z4*z5*z6-
    13*z2^13*z7+ 10*z2^12*z3*z7+ 10*z2^12*z4*z7+ z2^11*z3*z4*z7+ 10*z2^12*z5*z7+
    z2^11*z3*z5*z7+ z2^11*z4*z5*z7- 22*z2^10*z3*z4*z5*z7+ 10*z2^12*z6*z7+
    z2^11*z3*z6*z7+ z2^11*z4*z6*z7- 22*z2^10*z3*z4*z6*z7+ z2^11*z5*z6*z7-
    22*z2^10*z3*z5*z6*z7- 22*z2^10*z4*z5*z6*z7+ 55*z2^9*z3*z4*z5*z6*z7-
    1107*z2^12- 12*z2^11*z3- 12*z2^11*z4+ 1121*z2^10*z3*z4- 12*z2^11*z5+
    1121*z2^10*z3*z5+ 1121*z2^10*z4*z5- 2231*z2^9*z3*z4*z5- 12*z2^11*z6+
    1121*z2^10*z3*z6+ 1121*z2^10*z4*z6- 2231*z2^9*z3*z4*z6+ 1121*z2^10*z5*z6-
    2231*z2^9*z3*z5*z6- 2231*z2^9*z4*z5*z6+ 3363*z2^8*z3*z4*z5*z6- 12*z2^11*z7+
    1121*z2^10*z3*z7+ 1121*z2^10*z4*z7- 2231*z2^9*z3*z4*z7+ 1121*z2^10*z5*z7-
    2231*z2^9*z3*z5*z7- 2231*z2^9*z4*z5*z7+ 3363*z2^8*z3*z4*z5*z7+
    1121*z2^10*z6*z7- 2231*z2^9*z3*z6*z7- 2231*z2^9*z4*z6*z7+
    3363*z2^8*z3*z4*z6*z7- 2231*z2^9*z5*z6*z7+ 3363*z2^8*z3*z5*z6*z7+
    3363*z2^8*z4*z5*z6*z7+ 4451*z2^7*z3*z4*z5*z6*z7+ 2264*z2^10- 3374*z2^9*z3-
    3374*z2^9*z4+ 3363*z2^8*z3*z4- 3374*z2^9*z5+ 3363*z2^8*z3*z5+ 3363*z2^8*z4*z5-
    1121*z2^7*z3*z4*z5- 3374*z2^9*z6+ 3363*z2^8*z3*z6+ 3363*z2^8*z4*z6-
    1121*z2^7*z3*z4*z6+ 3363*z2^8*z5*z6- 1121*z2^7*z3*z5*z6- 1121*z2^7*z4*z5*z6-
    4484*z2^6*z3*z4*z5*z6- 3374*z2^9*z7+ 3363*z2^8*z3*z7+ 3363*z2^8*z4*z7-
    1121*z2^7*z3*z4*z7+ 3363*z2^8*z5*z7- 1121*z2^7*z3*z5*z7- 1121*z2^7*z4*z5*z7-
    4484*z2^6*z3*z4*z5*z7+ 3363*z2^8*z6*z7- 1121*z2^7*z3*z6*z7-
    1121*z2^7*z4*z6*z7- 4484*z2^6*z3*z4*z6*z7- 1121*z2^7*z5*z6*z7-
    4484*z2^6*z3*z5*z6*z7- 4484*z2^6*z4*z5*z6*z7- 3363*z2^5*z3*z4*z5*z6*z7+
    2604*z2^8+ 147*z2^7*z3+ 147*z2^7*z4+ 2740*z2^6*z3*z4+ 147*z2^7*z5+
    2740*z2^6*z3*z5+ 2740*z2^6*z4*z5+ 4495*z2^5*z3*z4*z5+ 147*z2^7*z6+
    2740*z2^6*z3*z6+ 2740*z2^6*z4*z6+ 4495*z2^5*z3*z4*z6+ 2740*z2^6*z5*z6+
    4495*z2^5*z3*z5*z6+ 4495*z2^5*z4*z5*z6+ 1755*z2^4*z3*z4*z5*z6+ 147*z2^7*z7+
    2740*z2^6*z3*z7+ 2740*z2^6*z4*z7+ 4495*z2^5*z3*z4*z7+ 2740*z2^6*z5*z7+
    4495*z2^5*z3*z5*z7+ 4495*z2^5*z4*z5*z7+ 1755*z2^4*z3*z4*z5*z7+
    2740*z2^6*z6*z7+ 4495*z2^5*z3*z6*z7+ 4495*z2^5*z4*z6*z7+
    1755*z2^4*z3*z4*z6*z7+ 4495*z2^5*z5*z6*z7+ 1755*z2^4*z3*z5*z6*z7+
    1755*z2^4*z4*z5*z6*z7+ 4359*z2^3*z3*z4*z5*z6*z7+ 2037*z2^6+ 318*z2^5*z3+
    318*z2^5*z4+ 3588*z2^4*z3*z4+ 318*z2^5*z5+ 3588*z2^4*z3*z5+ 3588*z2^4*z4*z5-
    2988*z2^3*z3*z4*z5+ 318*z2^5*z6+ 3588*z2^4*z3*z6+ 3588*z2^4*z4*z6-
    2988*z2^3*z3*z4*z6+ 3588*z2^4*z5*z6- 2988*z2^3*z3*z5*z6- 2988*z2^3*z4*z5*z6+
    633*z2^2*z3*z4*z5*z6+ 318*z2^5*z7+ 3588*z2^4*z3*z7+ 3588*z2^4*z4*z7-
    2988*z2^3*z3*z4*z7+ 3588*z2^4*z5*z7- 2988*z2^3*z3*z5*z7- 2988*z2^3*z4*z5*z7+
    633*z2^2*z3*z4*z5*z7+ 3588*z2^4*z6*z7- 2988*z2^3*z3*z6*z7- 2988*z2^3*z4*z6*z7+
    633*z2^2*z3*z4*z6*z7- 2988*z2^3*z5*z6*z7+ 633*z2^2*z3*z5*z6*z7+
    633*z2^2*z4*z5*z6*z7- 2637*z2*z3*z4*z5*z6*z7+ 2166*z2^4- 1776*z2^3*z3-
    1776*z2^3*z4- 2202*z2^2*z3*z4- 1776*z2^3*z5- 2202*z2^2*z3*z5- 2202*z2^2*z4*z5+
    167*z2*z3*z4*z5- 1776*z2^3*z6- 2202*z2^2*z3*z6- 2202*z2^2*z4*z6+
    167*z2*z3*z4*z6- 2202*z2^2*z5*z6+ 167*z2*z3*z5*z6+ 167*z2*z4*z5*z6+
    1235*z3*z4*z5*z6- 1776*z2^3*z7- 2202*z2^2*z3*z7- 2202*z2^2*z4*z7+
    167*z2*z3*z4*z7- 2202*z2^2*z5*z7+ 167*z2*z3*z5*z7+ 167*z2*z4*z5*z7+
    1235*z3*z4*z5*z7- 2202*z2^2*z6*z7+ 167*z2*z3*z6*z7+ 167*z2*z4*z6*z7+
    1235*z3*z4*z6*z7+ 167*z2*z5*z6*z7+ 1235*z3*z5*z6*z7+ 1235*z4*z5*z6*z7-
    1169*z2^2+ 2303*z2*z3+ 2303*z2*z4- 1235*z3*z4+ 2303*z2*z5- 1235*z3*z5-
    1235*z4*z5+ 2303*z2*z6- 1235*z3*z6- 1235*z4*z6- 1235*z5*z6+ 2303*z2*z7-
    1235*z3*z7- 1235*z4*z7- 1235*z5*z7- 1235*z6*z7+ 1235, - 4*z2*z3^15+ 2*z3^16+
    6*z2*z3^14*z4- 4*z3^15*z4+ 6*z2*z3^14*z5- 4*z3^15*z5- 8*z2*z3^13*z4*z5+
    6*z3^14*z4*z5+ 6*z2*z3^14*z6- 4*z3^15*z6- 8*z2*z3^13*z4*z6+ 6*z3^14*z4*z6-
    8*z2*z3^13*z5*z6+ 6*z3^14*z5*z6+ 10*z2*z3^12*z4*z5*z6- 8*z3^13*z4*z5*z6+
    6*z2*z3^14*z7- 4*z3^15*z7- 8*z2*z3^13*z4*z7+ 6*z3^14*z4*z7- 8*z2*z3^13*z5*z7+
    6*z3^14*z5*z7+ 10*z2*z3^12*z4*z5*z7- 8*z3^13*z4*z5*z7- 8*z2*z3^13*z6*z7+
    6*z3^14*z6*z7+ 10*z2*z3^12*z4*z6*z7- 8*z3^13*z4*z6*z7+ 10*z2*z3^12*z5*z6*z7-
    8*z3^13*z5*z6*z7- 12*z2*z3^11*z4*z5*z6*z7+ 10*z3^12*z4*z5*z6*z7- 13*z2*z3^13+
    10*z3^14+ 10*z2*z3^12*z4- 13*z3^13*z4+ 10*z2*z3^12*z5- 13*z3^13*z5+
    z2*z3^11*z4*z5+ 10*z3^12*z4*z5+ 10*z2*z3^12*z6- 13*z3^13*z6+ z2*z3^11*z4*z6+
    10*z3^12*z4*z6+ z2*z3^11*z5*z6+ 10*z3^12*z5*z6- 22*z2*z3^10*z4*z5*z6+
    z3^11*z4*z5*z6+ 10*z2*z3^12*z7- 13*z3^13*z7+ z2*z3^11*z4*z7+ 10*z3^12*z4*z7+
    z2*z3^11*z5*z7+ 10*z3^12*z5*z7- 22*z2*z3^10*z4*z5*z7+ z3^11*z4*z5*z7+
    z2*z3^11*z6*z7+ 10*z3^12*z6*z7- 22*z2*z3^10*z4*z6*z7+ z3^11*z4*z6*z7-
    22*z2*z3^10*z5*z6*z7+ z3^11*z5*z6*z7+ 55*z2*z3^9*z4*z5*z6*z7-
    22*z3^10*z4*z5*z6*z7- 12*z2*z3^11- 1107*z3^12+ 1121*z2*z3^10*z4- 12*z3^11*z4+
    1121*z2*z3^10*z5- 12*z3^11*z5- 2231*z2*z3^9*z4*z5+ 1121*z3^10*z4*z5+
    1121*z2*z3^10*z6- 12*z3^11*z6- 2231*z2*z3^9*z4*z6+ 1121*z3^10*z4*z6-
    2231*z2*z3^9*z5*z6+ 1121*z3^10*z5*z6+ 3363*z2*z3^8*z4*z5*z6-
    2231*z3^9*z4*z5*z6+ 1121*z2*z3^10*z7- 12*z3^11*z7- 2231*z2*z3^9*z4*z7+
    1121*z3^10*z4*z7- 2231*z2*z3^9*z5*z7+ 1121*z3^10*z5*z7+ 3363*z2*z3^8*z4*z5*z7-
    2231*z3^9*z4*z5*z7- 2231*z2*z3^9*z6*z7+ 1121*z3^10*z6*z7+
    3363*z2*z3^8*z4*z6*z7- 2231*z3^9*z4*z6*z7+ 3363*z2*z3^8*z5*z6*z7-
    2231*z3^9*z5*z6*z7+ 4451*z2*z3^7*z4*z5*z6*z7+ 3363*z3^8*z4*z5*z6*z7-
    3374*z2*z3^9+ 2264*z3^10+ 3363*z2*z3^8*z4- 3374*z3^9*z4+ 3363*z2*z3^8*z5-
    3374*z3^9*z5- 1121*z2*z3^7*z4*z5+ 3363*z3^8*z4*z5+ 3363*z2*z3^8*z6-
    3374*z3^9*z6- 1121*z2*z3^7*z4*z6+ 3363*z3^8*z4*z6- 1121*z2*z3^7*z5*z6+
    3363*z3^8*z5*z6- 4484*z2*z3^6*z4*z5*z6- 1121*z3^7*z4*z5*z6+ 3363*z2*z3^8*z7-
    3374*z3^9*z7- 1121*z2*z3^7*z4*z7+ 3363*z3^8*z4*z7- 1121*z2*z3^7*z5*z7+
    3363*z3^8*z5*z7- 4484*z2*z3^6*z4*z5*z7- 1121*z3^7*z4*z5*z7-
    1121*z2*z3^7*z6*z7+ 3363*z3^8*z6*z7- 4484*z2*z3^6*z4*z6*z7-
    1121*z3^7*z4*z6*z7- 4484*z2*z3^6*z5*z6*z7- 1121*z3^7*z5*z6*z7-
    3363*z2*z3^5*z4*z5*z6*z7- 4484*z3^6*z4*z5*z6*z7+ 147*z2*z3^7+ 2604*z3^8+
    2740*z2*z3^6*z4+ 147*z3^7*z4+ 2740*z2*z3^6*z5+ 147*z3^7*z5+
    4495*z2*z3^5*z4*z5+ 2740*z3^6*z4*z5+ 2740*z2*z3^6*z6+ 147*z3^7*z6+
    4495*z2*z3^5*z4*z6+ 2740*z3^6*z4*z6+ 4495*z2*z3^5*z5*z6+ 2740*z3^6*z5*z6+
    1755*z2*z3^4*z4*z5*z6+ 4495*z3^5*z4*z5*z6+ 2740*z2*z3^6*z7+ 147*z3^7*z7+
    4495*z2*z3^5*z4*z7+ 2740*z3^6*z4*z7+ 4495*z2*z3^5*z5*z7+ 2740*z3^6*z5*z7+
    1755*z2*z3^4*z4*z5*z7+ 4495*z3^5*z4*z5*z7+ 4495*z2*z3^5*z6*z7+
    2740*z3^6*z6*z7+ 1755*z2*z3^4*z4*z6*z7+ 4495*z3^5*z4*z6*z7+
    1755*z2*z3^4*z5*z6*z7+ 4495*z3^5*z5*z6*z7+ 4359*z2*z3^3*z4*z5*z6*z7+
    1755*z3^4*z4*z5*z6*z7+ 318*z2*z3^5+ 2037*z3^6+ 3588*z2*z3^4*z4+ 318*z3^5*z4+
    3588*z2*z3^4*z5+ 318*z3^5*z5- 2988*z2*z3^3*z4*z5+ 3588*z3^4*z4*z5+
    3588*z2*z3^4*z6+ 318*z3^5*z6- 2988*z2*z3^3*z4*z6+ 3588*z3^4*z4*z6-
    2988*z2*z3^3*z5*z6+ 3588*z3^4*z5*z6+ 633*z2*z3^2*z4*z5*z6- 2988*z3^3*z4*z5*z6+
    3588*z2*z3^4*z7+ 318*z3^5*z7- 2988*z2*z3^3*z4*z7+ 3588*z3^4*z4*z7-
    2988*z2*z3^3*z5*z7+ 3588*z3^4*z5*z7+ 633*z2*z3^2*z4*z5*z7- 2988*z3^3*z4*z5*z7-
    2988*z2*z3^3*z6*z7+ 3588*z3^4*z6*z7+ 633*z2*z3^2*z4*z6*z7- 2988*z3^3*z4*z6*z7+
    633*z2*z3^2*z5*z6*z7- 2988*z3^3*z5*z6*z7- 2637*z2*z3*z4*z5*z6*z7+
    633*z3^2*z4*z5*z6*z7- 1776*z2*z3^3+ 2166*z3^4- 2202*z2*z3^2*z4- 1776*z3^3*z4-
    2202*z2*z3^2*z5- 1776*z3^3*z5+ 167*z2*z3*z4*z5- 2202*z3^2*z4*z5-
    2202*z2*z3^2*z6- 1776*z3^3*z6+ 167*z2*z3*z4*z6- 2202*z3^2*z4*z6+
    167*z2*z3*z5*z6- 2202*z3^2*z5*z6+ 1235*z2*z4*z5*z6+ 167*z3*z4*z5*z6-
    2202*z2*z3^2*z7- 1776*z3^3*z7+ 167*z2*z3*z4*z7- 2202*z3^2*z4*z7+
    167*z2*z3*z5*z7- 2202*z3^2*z5*z7+ 1235*z2*z4*z5*z7+ 167*z3*z4*z5*z7+
    167*z2*z3*z6*z7- 2202*z3^2*z6*z7+ 1235*z2*z4*z6*z7+ 167*z3*z4*z6*z7+
    1235*z2*z5*z6*z7+ 167*z3*z5*z6*z7+ 1235*z4*z5*z6*z7+ 2303*z2*z3- 1169*z3^2-
    1235*z2*z4+ 2303*z3*z4- 1235*z2*z5+ 2303*z3*z5- 1235*z4*z5- 1235*z2*z6+
    2303*z3*z6- 1235*z4*z6- 1235*z5*z6- 1235*z2*z7+ 2303*z3*z7- 1235*z4*z7-
    1235*z5*z7- 1235*z6*z7+ 1235, 6*z2*z3*z4^14- 4*z2*z4^15- 4*z3*z4^15+ 2*z4^16-
    8*z2*z3*z4^13*z5+ 6*z2*z4^14*z5+ 6*z3*z4^14*z5- 4*z4^15*z5- 8*z2*z3*z4^13*z6+
    6*z2*z4^14*z6+ 6*z3*z4^14*z6- 4*z4^15*z6+ 10*z2*z3*z4^12*z5*z6-
    8*z2*z4^13*z5*z6- 8*z3*z4^13*z5*z6+ 6*z4^14*z5*z6- 8*z2*z3*z4^13*z7+
    6*z2*z4^14*z7+ 6*z3*z4^14*z7- 4*z4^15*z7+ 10*z2*z3*z4^12*z5*z7-
    8*z2*z4^13*z5*z7- 8*z3*z4^13*z5*z7+ 6*z4^14*z5*z7+ 10*z2*z3*z4^12*z6*z7-
    8*z2*z4^13*z6*z7- 8*z3*z4^13*z6*z7+ 6*z4^14*z6*z7- 12*z2*z3*z4^11*z5*z6*z7+
    10*z2*z4^12*z5*z6*z7+ 10*z3*z4^12*z5*z6*z7- 8*z4^13*z5*z6*z7+ 10*z2*z3*z4^12-
    13*z2*z4^13- 13*z3*z4^13+ 10*z4^14+ z2*z3*z4^11*z5+ 10*z2*z4^12*z5+
    10*z3*z4^12*z5- 13*z4^13*z5+ z2*z3*z4^11*z6+ 10*z2*z4^12*z6+ 10*z3*z4^12*z6-
    13*z4^13*z6- 22*z2*z3*z4^10*z5*z6+ z2*z4^11*z5*z6+ z3*z4^11*z5*z6+
    10*z4^12*z5*z6+ z2*z3*z4^11*z7+ 10*z2*z4^12*z7+ 10*z3*z4^12*z7- 13*z4^13*z7-
    22*z2*z3*z4^10*z5*z7+ z2*z4^11*z5*z7+ z3*z4^11*z5*z7+ 10*z4^12*z5*z7-
    22*z2*z3*z4^10*z6*z7+ z2*z4^11*z6*z7+ z3*z4^11*z6*z7+ 10*z4^12*z6*z7+
    55*z2*z3*z4^9*z5*z6*z7- 22*z2*z4^10*z5*z6*z7- 22*z3*z4^10*z5*z6*z7+
    z4^11*z5*z6*z7+ 1121*z2*z3*z4^10- 12*z2*z4^11- 12*z3*z4^11- 1107*z4^12-
    2231*z2*z3*z4^9*z5+ 1121*z2*z4^10*z5+ 1121*z3*z4^10*z5- 12*z4^11*z5-
    2231*z2*z3*z4^9*z6+ 1121*z2*z4^10*z6+ 1121*z3*z4^10*z6- 12*z4^11*z6+
    3363*z2*z3*z4^8*z5*z6- 2231*z2*z4^9*z5*z6- 2231*z3*z4^9*z5*z6+
    1121*z4^10*z5*z6- 2231*z2*z3*z4^9*z7+ 1121*z2*z4^10*z7+ 1121*z3*z4^10*z7-
    12*z4^11*z7+ 3363*z2*z3*z4^8*z5*z7- 2231*z2*z4^9*z5*z7- 2231*z3*z4^9*z5*z7+
    1121*z4^10*z5*z7+ 3363*z2*z3*z4^8*z6*z7- 2231*z2*z4^9*z6*z7-
    2231*z3*z4^9*z6*z7+ 1121*z4^10*z6*z7+ 4451*z2*z3*z4^7*z5*z6*z7+
    3363*z2*z4^8*z5*z6*z7+ 3363*z3*z4^8*z5*z6*z7- 2231*z4^9*z5*z6*z7+
    3363*z2*z3*z4^8- 3374*z2*z4^9- 3374*z3*z4^9+ 2264*z4^10- 1121*z2*z3*z4^7*z5+
    3363*z2*z4^8*z5+ 3363*z3*z4^8*z5- 3374*z4^9*z5- 1121*z2*z3*z4^7*z6+
    3363*z2*z4^8*z6+ 3363*z3*z4^8*z6- 3374*z4^9*z6- 4484*z2*z3*z4^6*z5*z6-
    1121*z2*z4^7*z5*z6- 1121*z3*z4^7*z5*z6+ 3363*z4^8*z5*z6- 1121*z2*z3*z4^7*z7+
    3363*z2*z4^8*z7+ 3363*z3*z4^8*z7- 3374*z4^9*z7- 4484*z2*z3*z4^6*z5*z7-
    1121*z2*z4^7*z5*z7- 1121*z3*z4^7*z5*z7+ 3363*z4^8*z5*z7-
    4484*z2*z3*z4^6*z6*z7- 1121*z2*z4^7*z6*z7- 1121*z3*z4^7*z6*z7+
    3363*z4^8*z6*z7- 3363*z2*z3*z4^5*z5*z6*z7- 4484*z2*z4^6*z5*z6*z7-
    4484*z3*z4^6*z5*z6*z7- 1121*z4^7*z5*z6*z7+ 2740*z2*z3*z4^6+ 147*z2*z4^7+
    147*z3*z4^7+ 2604*z4^8+ 4495*z2*z3*z4^5*z5+ 2740*z2*z4^6*z5+ 2740*z3*z4^6*z5+
    147*z4^7*z5+ 4495*z2*z3*z4^5*z6+ 2740*z2*z4^6*z6+ 2740*z3*z4^6*z6+
    147*z4^7*z6+ 1755*z2*z3*z4^4*z5*z6+ 4495*z2*z4^5*z5*z6+ 4495*z3*z4^5*z5*z6+
    2740*z4^6*z5*z6+ 4495*z2*z3*z4^5*z7+ 2740*z2*z4^6*z7+ 2740*z3*z4^6*z7+
    147*z4^7*z7+ 1755*z2*z3*z4^4*z5*z7+ 4495*z2*z4^5*z5*z7+ 4495*z3*z4^5*z5*z7+
    2740*z4^6*z5*z7+ 1755*z2*z3*z4^4*z6*z7+ 4495*z2*z4^5*z6*z7+
    4495*z3*z4^5*z6*z7+ 2740*z4^6*z6*z7+ 4359*z2*z3*z4^3*z5*z6*z7+
    1755*z2*z4^4*z5*z6*z7+ 1755*z3*z4^4*z5*z6*z7+ 4495*z4^5*z5*z6*z7+
    3588*z2*z3*z4^4+ 318*z2*z4^5+ 318*z3*z4^5+ 2037*z4^6- 2988*z2*z3*z4^3*z5+
    3588*z2*z4^4*z5+ 3588*z3*z4^4*z5+ 318*z4^5*z5- 2988*z2*z3*z4^3*z6+
    3588*z2*z4^4*z6+ 3588*z3*z4^4*z6+ 318*z4^5*z6+ 633*z2*z3*z4^2*z5*z6-
    2988*z2*z4^3*z5*z6- 2988*z3*z4^3*z5*z6+ 3588*z4^4*z5*z6- 2988*z2*z3*z4^3*z7+
    3588*z2*z4^4*z7+ 3588*z3*z4^4*z7+ 318*z4^5*z7+ 633*z2*z3*z4^2*z5*z7-
    2988*z2*z4^3*z5*z7- 2988*z3*z4^3*z5*z7+ 3588*z4^4*z5*z7+ 633*z2*z3*z4^2*z6*z7-
    2988*z2*z4^3*z6*z7- 2988*z3*z4^3*z6*z7+ 3588*z4^4*z6*z7-
    2637*z2*z3*z4*z5*z6*z7+ 633*z2*z4^2*z5*z6*z7+ 633*z3*z4^2*z5*z6*z7-
    2988*z4^3*z5*z6*z7- 2202*z2*z3*z4^2- 1776*z2*z4^3- 1776*z3*z4^3+ 2166*z4^4+
    167*z2*z3*z4*z5- 2202*z2*z4^2*z5- 2202*z3*z4^2*z5- 1776*z4^3*z5+
    167*z2*z3*z4*z6- 2202*z2*z4^2*z6- 2202*z3*z4^2*z6- 1776*z4^3*z6+
    1235*z2*z3*z5*z6+ 167*z2*z4*z5*z6+ 167*z3*z4*z5*z6- 2202*z4^2*z5*z6+
    167*z2*z3*z4*z7- 2202*z2*z4^2*z7- 2202*z3*z4^2*z7- 1776*z4^3*z7+
    1235*z2*z3*z5*z7+ 167*z2*z4*z5*z7+ 167*z3*z4*z5*z7- 2202*z4^2*z5*z7+
    1235*z2*z3*z6*z7+ 167*z2*z4*z6*z7+ 167*z3*z4*z6*z7- 2202*z4^2*z6*z7+
    1235*z2*z5*z6*z7+ 1235*z3*z5*z6*z7+ 167*z4*z5*z6*z7- 1235*z2*z3+ 2303*z2*z4+
    2303*z3*z4- 1169*z4^2- 1235*z2*z5- 1235*z3*z5+ 2303*z4*z5- 1235*z2*z6-
    1235*z3*z6+ 2303*z4*z6- 1235*z5*z6- 1235*z2*z7- 1235*z3*z7+ 2303*z4*z7-
    1235*z5*z7- 1235*z6*z7+ 1235, - 8*z2*z3*z4*z5^13+ 6*z2*z3*z5^14+
    6*z2*z4*z5^14+ 6*z3*z4*z5^14- 4*z2*z5^15- 4*z3*z5^15- 4*z4*z5^15+ 2*z5^16+
    10*z2*z3*z4*z5^12*z6- 8*z2*z3*z5^13*z6- 8*z2*z4*z5^13*z6- 8*z3*z4*z5^13*z6+
    6*z2*z5^14*z6+ 6*z3*z5^14*z6+ 6*z4*z5^14*z6- 4*z5^15*z6+ 10*z2*z3*z4*z5^12*z7-
    8*z2*z3*z5^13*z7- 8*z2*z4*z5^13*z7- 8*z3*z4*z5^13*z7+ 6*z2*z5^14*z7+
    6*z3*z5^14*z7+ 6*z4*z5^14*z7- 4*z5^15*z7- 12*z2*z3*z4*z5^11*z6*z7+
    10*z2*z3*z5^12*z6*z7+ 10*z2*z4*z5^12*z6*z7+ 10*z3*z4*z5^12*z6*z7-
    8*z2*z5^13*z6*z7- 8*z3*z5^13*z6*z7- 8*z4*z5^13*z6*z7+ 6*z5^14*z6*z7+
    z2*z3*z4*z5^11+ 10*z2*z3*z5^12+ 10*z2*z4*z5^12+ 10*z3*z4*z5^12- 13*z2*z5^13-
    13*z3*z5^13- 13*z4*z5^13+ 10*z5^14- 22*z2*z3*z4*z5^10*z6+ z2*z3*z5^11*z6+
    z2*z4*z5^11*z6+ z3*z4*z5^11*z6+ 10*z2*z5^12*z6+ 10*z3*z5^12*z6+
    10*z4*z5^12*z6- 13*z5^13*z6- 22*z2*z3*z4*z5^10*z7+ z2*z3*z5^11*z7+
    z2*z4*z5^11*z7+ z3*z4*z5^11*z7+ 10*z2*z5^12*z7+ 10*z3*z5^12*z7+
    10*z4*z5^12*z7- 13*z5^13*z7+ 55*z2*z3*z4*z5^9*z6*z7- 22*z2*z3*z5^10*z6*z7-
    22*z2*z4*z5^10*z6*z7- 22*z3*z4*z5^10*z6*z7+ z2*z5^11*z6*z7+ z3*z5^11*z6*z7+
    z4*z5^11*z6*z7+ 10*z5^12*z6*z7- 2231*z2*z3*z4*z5^9+ 1121*z2*z3*z5^10+
    1121*z2*z4*z5^10+ 1121*z3*z4*z5^10- 12*z2*z5^11- 12*z3*z5^11- 12*z4*z5^11-
    1107*z5^12+ 3363*z2*z3*z4*z5^8*z6- 2231*z2*z3*z5^9*z6- 2231*z2*z4*z5^9*z6-
    2231*z3*z4*z5^9*z6+ 1121*z2*z5^10*z6+ 1121*z3*z5^10*z6+ 1121*z4*z5^10*z6-
    12*z5^11*z6+ 3363*z2*z3*z4*z5^8*z7- 2231*z2*z3*z5^9*z7- 2231*z2*z4*z5^9*z7-
    2231*z3*z4*z5^9*z7+ 1121*z2*z5^10*z7+ 1121*z3*z5^10*z7+ 1121*z4*z5^10*z7-
    12*z5^11*z7+ 4451*z2*z3*z4*z5^7*z6*z7+ 3363*z2*z3*z5^8*z6*z7+
    3363*z2*z4*z5^8*z6*z7+ 3363*z3*z4*z5^8*z6*z7- 2231*z2*z5^9*z6*z7-
    2231*z3*z5^9*z6*z7- 2231*z4*z5^9*z6*z7+ 1121*z5^10*z6*z7- 1121*z2*z3*z4*z5^7+
    3363*z2*z3*z5^8+ 3363*z2*z4*z5^8+ 3363*z3*z4*z5^8- 3374*z2*z5^9- 3374*z3*z5^9-
    3374*z4*z5^9+ 2264*z5^10- 4484*z2*z3*z4*z5^6*z6- 1121*z2*z3*z5^7*z6-
    1121*z2*z4*z5^7*z6- 1121*z3*z4*z5^7*z6+ 3363*z2*z5^8*z6+ 3363*z3*z5^8*z6+
    3363*z4*z5^8*z6- 3374*z5^9*z6- 4484*z2*z3*z4*z5^6*z7- 1121*z2*z3*z5^7*z7-
    1121*z2*z4*z5^7*z7- 1121*z3*z4*z5^7*z7+ 3363*z2*z5^8*z7+ 3363*z3*z5^8*z7+
    3363*z4*z5^8*z7- 3374*z5^9*z7- 3363*z2*z3*z4*z5^5*z6*z7-
    4484*z2*z3*z5^6*z6*z7- 4484*z2*z4*z5^6*z6*z7- 4484*z3*z4*z5^6*z6*z7-
    1121*z2*z5^7*z6*z7- 1121*z3*z5^7*z6*z7- 1121*z4*z5^7*z6*z7+ 3363*z5^8*z6*z7+
    4495*z2*z3*z4*z5^5+ 2740*z2*z3*z5^6+ 2740*z2*z4*z5^6+ 2740*z3*z4*z5^6+
    147*z2*z5^7+ 147*z3*z5^7+ 147*z4*z5^7+ 2604*z5^8+ 1755*z2*z3*z4*z5^4*z6+
    4495*z2*z3*z5^5*z6+ 4495*z2*z4*z5^5*z6+ 4495*z3*z4*z5^5*z6+ 2740*z2*z5^6*z6+
    2740*z3*z5^6*z6+ 2740*z4*z5^6*z6+ 147*z5^7*z6+ 1755*z2*z3*z4*z5^4*z7+
    4495*z2*z3*z5^5*z7+ 4495*z2*z4*z5^5*z7+ 4495*z3*z4*z5^5*z7+ 2740*z2*z5^6*z7+
    2740*z3*z5^6*z7+ 2740*z4*z5^6*z7+ 147*z5^7*z7+ 4359*z2*z3*z4*z5^3*z6*z7+
    1755*z2*z3*z5^4*z6*z7+ 1755*z2*z4*z5^4*z6*z7+ 1755*z3*z4*z5^4*z6*z7+
    4495*z2*z5^5*z6*z7+ 4495*z3*z5^5*z6*z7+ 4495*z4*z5^5*z6*z7+ 2740*z5^6*z6*z7-
    2988*z2*z3*z4*z5^3+ 3588*z2*z3*z5^4+ 3588*z2*z4*z5^4+ 3588*z3*z4*z5^4+
    318*z2*z5^5+ 318*z3*z5^5+ 318*z4*z5^5+ 2037*z5^6+ 633*z2*z3*z4*z5^2*z6-
    2988*z2*z3*z5^3*z6- 2988*z2*z4*z5^3*z6- 2988*z3*z4*z5^3*z6+ 3588*z2*z5^4*z6+
    3588*z3*z5^4*z6+ 3588*z4*z5^4*z6+ 318*z5^5*z6+ 633*z2*z3*z4*z5^2*z7-
    2988*z2*z3*z5^3*z7- 2988*z2*z4*z5^3*z7- 2988*z3*z4*z5^3*z7+ 3588*z2*z5^4*z7+
    3588*z3*z5^4*z7+ 3588*z4*z5^4*z7+ 318*z5^5*z7- 2637*z2*z3*z4*z5*z6*z7+
    633*z2*z3*z5^2*z6*z7+ 633*z2*z4*z5^2*z6*z7+ 633*z3*z4*z5^2*z6*z7-
    2988*z2*z5^3*z6*z7- 2988*z3*z5^3*z6*z7- 2988*z4*z5^3*z6*z7+ 3588*z5^4*z6*z7+
    167*z2*z3*z4*z5- 2202*z2*z3*z5^2- 2202*z2*z4*z5^2- 2202*z3*z4*z5^2-
    1776*z2*z5^3- 1776*z3*z5^3- 1776*z4*z5^3+ 2166*z5^4+ 1235*z2*z3*z4*z6+
    167*z2*z3*z5*z6+ 167*z2*z4*z5*z6+ 167*z3*z4*z5*z6- 2202*z2*z5^2*z6-
    2202*z3*z5^2*z6- 2202*z4*z5^2*z6- 1776*z5^3*z6+ 1235*z2*z3*z4*z7+
    167*z2*z3*z5*z7+ 167*z2*z4*z5*z7+ 167*z3*z4*z5*z7- 2202*z2*z5^2*z7-
    2202*z3*z5^2*z7- 2202*z4*z5^2*z7- 1776*z5^3*z7+ 1235*z2*z3*z6*z7+
    1235*z2*z4*z6*z7+ 1235*z3*z4*z6*z7+ 167*z2*z5*z6*z7+ 167*z3*z5*z6*z7+
    167*z4*z5*z6*z7- 2202*z5^2*z6*z7- 1235*z2*z3- 1235*z2*z4- 1235*z3*z4+
    2303*z2*z5+ 2303*z3*z5+ 2303*z4*z5- 1169*z5^2- 1235*z2*z6- 1235*z3*z6-
    1235*z4*z6+ 2303*z5*z6- 1235*z2*z7- 1235*z3*z7- 1235*z4*z7+ 2303*z5*z7-
    1235*z6*z7+ 1235, 10*z2*z3*z4*z5*z6^12- 8*z2*z3*z4*z6^13- 8*z2*z3*z5*z6^13-
    8*z2*z4*z5*z6^13- 8*z3*z4*z5*z6^13+ 6*z2*z3*z6^14+ 6*z2*z4*z6^14+
    6*z3*z4*z6^14+ 6*z2*z5*z6^14+ 6*z3*z5*z6^14+ 6*z4*z5*z6^14- 4*z2*z6^15-
    4*z3*z6^15- 4*z4*z6^15- 4*z5*z6^15+ 2*z6^16- 12*z2*z3*z4*z5*z6^11*z7+
    10*z2*z3*z4*z6^12*z7+ 10*z2*z3*z5*z6^12*z7+ 10*z2*z4*z5*z6^12*z7+
    10*z3*z4*z5*z6^12*z7- 8*z2*z3*z6^13*z7- 8*z2*z4*z6^13*z7- 8*z3*z4*z6^13*z7-
    8*z2*z5*z6^13*z7- 8*z3*z5*z6^13*z7- 8*z4*z5*z6^13*z7+ 6*z2*z6^14*z7+
    6*z3*z6^14*z7+ 6*z4*z6^14*z7+ 6*z5*z6^14*z7- 4*z6^15*z7- 22*z2*z3*z4*z5*z6^10+
    z2*z3*z4*z6^11+ z2*z3*z5*z6^11+ z2*z4*z5*z6^11+ z3*z4*z5*z6^11+
    10*z2*z3*z6^12+ 10*z2*z4*z6^12+ 10*z3*z4*z6^12+ 10*z2*z5*z6^12+
    10*z3*z5*z6^12+ 10*z4*z5*z6^12- 13*z2*z6^13- 13*z3*z6^13- 13*z4*z6^13-
    13*z5*z6^13+ 10*z6^14+ 55*z2*z3*z4*z5*z6^9*z7- 22*z2*z3*z4*z6^10*z7-
    22*z2*z3*z5*z6^10*z7- 22*z2*z4*z5*z6^10*z7- 22*z3*z4*z5*z6^10*z7+
    z2*z3*z6^11*z7+ z2*z4*z6^11*z7+ z3*z4*z6^11*z7+ z2*z5*z6^11*z7+
    z3*z5*z6^11*z7+ z4*z5*z6^11*z7+ 10*z2*z6^12*z7+ 10*z3*z6^12*z7+
    10*z4*z6^12*z7+ 10*z5*z6^12*z7- 13*z6^13*z7+ 3363*z2*z3*z4*z5*z6^8-
    2231*z2*z3*z4*z6^9- 2231*z2*z3*z5*z6^9- 2231*z2*z4*z5*z6^9-
    2231*z3*z4*z5*z6^9+ 1121*z2*z3*z6^10+ 1121*z2*z4*z6^10+ 1121*z3*z4*z6^10+
    1121*z2*z5*z6^10+ 1121*z3*z5*z6^10+ 1121*z4*z5*z6^10- 12*z2*z6^11-
    12*z3*z6^11- 12*z4*z6^11- 12*z5*z6^11- 1107*z6^12+ 4451*z2*z3*z4*z5*z6^7*z7+
    3363*z2*z3*z4*z6^8*z7+ 3363*z2*z3*z5*z6^8*z7+ 3363*z2*z4*z5*z6^8*z7+
    3363*z3*z4*z5*z6^8*z7- 2231*z2*z3*z6^9*z7- 2231*z2*z4*z6^9*z7-
    2231*z3*z4*z6^9*z7- 2231*z2*z5*z6^9*z7- 2231*z3*z5*z6^9*z7-
    2231*z4*z5*z6^9*z7+ 1121*z2*z6^10*z7+ 1121*z3*z6^10*z7+ 1121*z4*z6^10*z7+
    1121*z5*z6^10*z7- 12*z6^11*z7- 4484*z2*z3*z4*z5*z6^6- 1121*z2*z3*z4*z6^7-
    1121*z2*z3*z5*z6^7- 1121*z2*z4*z5*z6^7- 1121*z3*z4*z5*z6^7+ 3363*z2*z3*z6^8+
    3363*z2*z4*z6^8+ 3363*z3*z4*z6^8+ 3363*z2*z5*z6^8+ 3363*z3*z5*z6^8+
    3363*z4*z5*z6^8- 3374*z2*z6^9- 3374*z3*z6^9- 3374*z4*z6^9- 3374*z5*z6^9+
    2264*z6^10- 3363*z2*z3*z4*z5*z6^5*z7- 4484*z2*z3*z4*z6^6*z7-
    4484*z2*z3*z5*z6^6*z7- 4484*z2*z4*z5*z6^6*z7- 4484*z3*z4*z5*z6^6*z7-
    1121*z2*z3*z6^7*z7- 1121*z2*z4*z6^7*z7- 1121*z3*z4*z6^7*z7-
    1121*z2*z5*z6^7*z7- 1121*z3*z5*z6^7*z7- 1121*z4*z5*z6^7*z7+ 3363*z2*z6^8*z7+
    3363*z3*z6^8*z7+ 3363*z4*z6^8*z7+ 3363*z5*z6^8*z7- 3374*z6^9*z7+
    1755*z2*z3*z4*z5*z6^4+ 4495*z2*z3*z4*z6^5+ 4495*z2*z3*z5*z6^5+
    4495*z2*z4*z5*z6^5+ 4495*z3*z4*z5*z6^5+ 2740*z2*z3*z6^6+ 2740*z2*z4*z6^6+
    2740*z3*z4*z6^6+ 2740*z2*z5*z6^6+ 2740*z3*z5*z6^6+ 2740*z4*z5*z6^6+
    147*z2*z6^7+ 147*z3*z6^7+ 147*z4*z6^7+ 147*z5*z6^7+ 2604*z6^8+
    4359*z2*z3*z4*z5*z6^3*z7+ 1755*z2*z3*z4*z6^4*z7+ 1755*z2*z3*z5*z6^4*z7+
    1755*z2*z4*z5*z6^4*z7+ 1755*z3*z4*z5*z6^4*z7+ 4495*z2*z3*z6^5*z7+
    4495*z2*z4*z6^5*z7+ 4495*z3*z4*z6^5*z7+ 4495*z2*z5*z6^5*z7+
    4495*z3*z5*z6^5*z7+ 4495*z4*z5*z6^5*z7+ 2740*z2*z6^6*z7+ 2740*z3*z6^6*z7+
    2740*z4*z6^6*z7+ 2740*z5*z6^6*z7+ 147*z6^7*z7+ 633*z2*z3*z4*z5*z6^2-
    2988*z2*z3*z4*z6^3- 2988*z2*z3*z5*z6^3- 2988*z2*z4*z5*z6^3-
    2988*z3*z4*z5*z6^3+ 3588*z2*z3*z6^4+ 3588*z2*z4*z6^4+ 3588*z3*z4*z6^4+
    3588*z2*z5*z6^4+ 3588*z3*z5*z6^4+ 3588*z4*z5*z6^4+ 318*z2*z6^5+ 318*z3*z6^5+
    318*z4*z6^5+ 318*z5*z6^5+ 2037*z6^6- 2637*z2*z3*z4*z5*z6*z7+
    633*z2*z3*z4*z6^2*z7+ 633*z2*z3*z5*z6^2*z7+ 633*z2*z4*z5*z6^2*z7+
    633*z3*z4*z5*z6^2*z7- 2988*z2*z3*z6^3*z7- 2988*z2*z4*z6^3*z7-
    2988*z3*z4*z6^3*z7- 2988*z2*z5*z6^3*z7- 2988*z3*z5*z6^3*z7-
    2988*z4*z5*z6^3*z7+ 3588*z2*z6^4*z7+ 3588*z3*z6^4*z7+ 3588*z4*z6^4*z7+
    3588*z5*z6^4*z7+ 318*z6^5*z7+ 1235*z2*z3*z4*z5+ 167*z2*z3*z4*z6+
    167*z2*z3*z5*z6+ 167*z2*z4*z5*z6+ 167*z3*z4*z5*z6- 2202*z2*z3*z6^2-
    2202*z2*z4*z6^2- 2202*z3*z4*z6^2- 2202*z2*z5*z6^2- 2202*z3*z5*z6^2-
    2202*z4*z5*z6^2- 1776*z2*z6^3- 1776*z3*z6^3- 1776*z4*z6^3- 1776*z5*z6^3+
    2166*z6^4+ 1235*z2*z3*z4*z7+ 1235*z2*z3*z5*z7+ 1235*z2*z4*z5*z7+
    1235*z3*z4*z5*z7+ 167*z2*z3*z6*z7+ 167*z2*z4*z6*z7+ 167*z3*z4*z6*z7+
    167*z2*z5*z6*z7+ 167*z3*z5*z6*z7+ 167*z4*z5*z6*z7- 2202*z2*z6^2*z7-
    2202*z3*z6^2*z7- 2202*z4*z6^2*z7- 2202*z5*z6^2*z7- 1776*z6^3*z7- 1235*z2*z3-
    1235*z2*z4- 1235*z3*z4- 1235*z2*z5- 1235*z3*z5- 1235*z4*z5+ 2303*z2*z6+
    2303*z3*z6+ 2303*z4*z6+ 2303*z5*z6- 1169*z6^2- 1235*z2*z7- 1235*z3*z7-
    1235*z4*z7- 1235*z5*z7+ 2303*z6*z7+ 1235, - 12*z2*z3*z4*z5*z6*z7^11+
    10*z2*z3*z4*z5*z7^12+ 10*z2*z3*z4*z6*z7^12+ 10*z2*z3*z5*z6*z7^12+
    10*z2*z4*z5*z6*z7^12+ 10*z3*z4*z5*z6*z7^12- 8*z2*z3*z4*z7^13-
    8*z2*z3*z5*z7^13- 8*z2*z4*z5*z7^13- 8*z3*z4*z5*z7^13- 8*z2*z3*z6*z7^13-
    8*z2*z4*z6*z7^13- 8*z3*z4*z6*z7^13- 8*z2*z5*z6*z7^13- 8*z3*z5*z6*z7^13-
    8*z4*z5*z6*z7^13+ 6*z2*z3*z7^14+ 6*z2*z4*z7^14+ 6*z3*z4*z7^14+ 6*z2*z5*z7^14+
    6*z3*z5*z7^14+ 6*z4*z5*z7^14+ 6*z2*z6*z7^14+ 6*z3*z6*z7^14+ 6*z4*z6*z7^14+
    6*z5*z6*z7^14- 4*z2*z7^15- 4*z3*z7^15- 4*z4*z7^15- 4*z5*z7^15- 4*z6*z7^15+
    2*z7^16+ 55*z2*z3*z4*z5*z6*z7^9- 22*z2*z3*z4*z5*z7^10- 22*z2*z3*z4*z6*z7^10-
    22*z2*z3*z5*z6*z7^10- 22*z2*z4*z5*z6*z7^10- 22*z3*z4*z5*z6*z7^10+
    z2*z3*z4*z7^11+ z2*z3*z5*z7^11+ z2*z4*z5*z7^11+ z3*z4*z5*z7^11+
    z2*z3*z6*z7^11+ z2*z4*z6*z7^11+ z3*z4*z6*z7^11+ z2*z5*z6*z7^11+
    z3*z5*z6*z7^11+ z4*z5*z6*z7^11+ 10*z2*z3*z7^12+ 10*z2*z4*z7^12+
    10*z3*z4*z7^12+ 10*z2*z5*z7^12+ 10*z3*z5*z7^12+ 10*z4*z5*z7^12+
    10*z2*z6*z7^12+ 10*z3*z6*z7^12+ 10*z4*z6*z7^12+ 10*z5*z6*z7^12- 13*z2*z7^13-
    13*z3*z7^13- 13*z4*z7^13- 13*z5*z7^13- 13*z6*z7^13+ 10*z7^14+
    4451*z2*z3*z4*z5*z6*z7^7+ 3363*z2*z3*z4*z5*z7^8+ 3363*z2*z3*z4*z6*z7^8+
    3363*z2*z3*z5*z6*z7^8+ 3363*z2*z4*z5*z6*z7^8+ 3363*z3*z4*z5*z6*z7^8-
    2231*z2*z3*z4*z7^9- 2231*z2*z3*z5*z7^9- 2231*z2*z4*z5*z7^9-
    2231*z3*z4*z5*z7^9- 2231*z2*z3*z6*z7^9- 2231*z2*z4*z6*z7^9-
    2231*z3*z4*z6*z7^9- 2231*z2*z5*z6*z7^9- 2231*z3*z5*z6*z7^9-
    2231*z4*z5*z6*z7^9+ 1121*z2*z3*z7^10+ 1121*z2*z4*z7^10+ 1121*z3*z4*z7^10+
    1121*z2*z5*z7^10+ 1121*z3*z5*z7^10+ 1121*z4*z5*z7^10+ 1121*z2*z6*z7^10+
    1121*z3*z6*z7^10+ 1121*z4*z6*z7^10+ 1121*z5*z6*z7^10- 12*z2*z7^11-
    12*z3*z7^11- 12*z4*z7^11- 12*z5*z7^11- 12*z6*z7^11- 1107*z7^12-
    3363*z2*z3*z4*z5*z6*z7^5- 4484*z2*z3*z4*z5*z7^6- 4484*z2*z3*z4*z6*z7^6-
    4484*z2*z3*z5*z6*z7^6- 4484*z2*z4*z5*z6*z7^6- 4484*z3*z4*z5*z6*z7^6-
    1121*z2*z3*z4*z7^7- 1121*z2*z3*z5*z7^7- 1121*z2*z4*z5*z7^7-
    1121*z3*z4*z5*z7^7- 1121*z2*z3*z6*z7^7- 1121*z2*z4*z6*z7^7-
    1121*z3*z4*z6*z7^7- 1121*z2*z5*z6*z7^7- 1121*z3*z5*z6*z7^7-
    1121*z4*z5*z6*z7^7+ 3363*z2*z3*z7^8+ 3363*z2*z4*z7^8+ 3363*z3*z4*z7^8+
    3363*z2*z5*z7^8+ 3363*z3*z5*z7^8+ 3363*z4*z5*z7^8+ 3363*z2*z6*z7^8+
    3363*z3*z6*z7^8+ 3363*z4*z6*z7^8+ 3363*z5*z6*z7^8- 3374*z2*z7^9- 3374*z3*z7^9-
    3374*z4*z7^9- 3374*z5*z7^9- 3374*z6*z7^9+ 2264*z7^10+
    4359*z2*z3*z4*z5*z6*z7^3+ 1755*z2*z3*z4*z5*z7^4+ 1755*z2*z3*z4*z6*z7^4+
    1755*z2*z3*z5*z6*z7^4+ 1755*z2*z4*z5*z6*z7^4+ 1755*z3*z4*z5*z6*z7^4+
    4495*z2*z3*z4*z7^5+ 4495*z2*z3*z5*z7^5+ 4495*z2*z4*z5*z7^5+
    4495*z3*z4*z5*z7^5+ 4495*z2*z3*z6*z7^5+ 4495*z2*z4*z6*z7^5+
    4495*z3*z4*z6*z7^5+ 4495*z2*z5*z6*z7^5+ 4495*z3*z5*z6*z7^5+
    4495*z4*z5*z6*z7^5+ 2740*z2*z3*z7^6+ 2740*z2*z4*z7^6+ 2740*z3*z4*z7^6+
    2740*z2*z5*z7^6+ 2740*z3*z5*z7^6+ 2740*z4*z5*z7^6+ 2740*z2*z6*z7^6+
    2740*z3*z6*z7^6+ 2740*z4*z6*z7^6+ 2740*z5*z6*z7^6+ 147*z2*z7^7+ 147*z3*z7^7+
    147*z4*z7^7+ 147*z5*z7^7+ 147*z6*z7^7+ 2604*z7^8- 2637*z2*z3*z4*z5*z6*z7+
    633*z2*z3*z4*z5*z7^2+ 633*z2*z3*z4*z6*z7^2+ 633*z2*z3*z5*z6*z7^2+
    633*z2*z4*z5*z6*z7^2+ 633*z3*z4*z5*z6*z7^2- 2988*z2*z3*z4*z7^3-
    2988*z2*z3*z5*z7^3- 2988*z2*z4*z5*z7^3- 2988*z3*z4*z5*z7^3-
    2988*z2*z3*z6*z7^3- 2988*z2*z4*z6*z7^3- 2988*z3*z4*z6*z7^3-
    2988*z2*z5*z6*z7^3- 2988*z3*z5*z6*z7^3- 2988*z4*z5*z6*z7^3+ 3588*z2*z3*z7^4+
    3588*z2*z4*z7^4+ 3588*z3*z4*z7^4+ 3588*z2*z5*z7^4+ 3588*z3*z5*z7^4+
    3588*z4*z5*z7^4+ 3588*z2*z6*z7^4+ 3588*z3*z6*z7^4+ 3588*z4*z6*z7^4+
    3588*z5*z6*z7^4+ 318*z2*z7^5+ 318*z3*z7^5+ 318*z4*z7^5+ 318*z5*z7^5+
    318*z6*z7^5+ 2037*z7^6+ 1235*z2*z3*z4*z5+ 1235*z2*z3*z4*z6+ 1235*z2*z3*z5*z6+
    1235*z2*z4*z5*z6+ 1235*z3*z4*z5*z6+ 167*z2*z3*z4*z7+ 167*z2*z3*z5*z7+
    167*z2*z4*z5*z7+ 167*z3*z4*z5*z7+ 167*z2*z3*z6*z7+ 167*z2*z4*z6*z7+
    167*z3*z4*z6*z7+ 167*z2*z5*z6*z7+ 167*z3*z5*z6*z7+ 167*z4*z5*z6*z7-
    2202*z2*z3*z7^2- 2202*z2*z4*z7^2- 2202*z3*z4*z7^2- 2202*z2*z5*z7^2-
    2202*z3*z5*z7^2- 2202*z4*z5*z7^2- 2202*z2*z6*z7^2- 2202*z3*z6*z7^2-
    2202*z4*z6*z7^2- 2202*z5*z6*z7^2- 1776*z2*z7^3- 1776*z3*z7^3- 1776*z4*z7^3-
    1776*z5*z7^3- 1776*z6*z7^3+ 2166*z7^4- 1235*z2*z3- 1235*z2*z4- 1235*z3*z4-
    1235*z2*z5- 1235*z3*z5- 1235*z4*z5- 1235*z2*z6- 1235*z3*z6- 1235*z4*z6-
    1235*z5*z6+ 2303*z2*z7+ 2303*z3*z7+ 2303*z4*z7+ 2303*z5*z7+ 2303*z6*z7-
    1169*z7^2+ 1235, 2*z2^15- 2*z2^14*z3- 2*z2^13*z3^2- 2*z2^12*z3^3-
    2*z2^11*z3^4- 2*z2^10*z3^5- 2*z2^9*z3^6- 2*z2^8*z3^7- 2*z2^7*z3^8-
    2*z2^6*z3^9- 2*z2^5*z3^10- 2*z2^4*z3^11- 2*z2^3*z3^12- 2*z2^2*z3^13-
    2*z2*z3^14+ 2*z3^15- 4*z2^14*z4+ 2*z2^13*z3*z4+ 2*z2^12*z3^2*z4+
    2*z2^11*z3^3*z4+ 2*z2^10*z3^4*z4+ 2*z2^9*z3^5*z4+ 2*z2^8*z3^6*z4+
    2*z2^7*z3^7*z4+ 2*z2^6*z3^8*z4+ 2*z2^5*z3^9*z4+ 2*z2^4*z3^10*z4+
    2*z2^3*z3^11*z4+ 2*z2^2*z3^12*z4+ 2*z2*z3^13*z4- 4*z3^14*z4- 4*z2^14*z5+
    2*z2^13*z3*z5+ 2*z2^12*z3^2*z5+ 2*z2^11*z3^3*z5+ 2*z2^10*z3^4*z5+
    2*z2^9*z3^5*z5+ 2*z2^8*z3^6*z5+ 2*z2^7*z3^7*z5+ 2*z2^6*z3^8*z5+
    2*z2^5*z3^9*z5+ 2*z2^4*z3^10*z5+ 2*z2^3*z3^11*z5+ 2*z2^2*z3^12*z5+
    2*z2*z3^13*z5- 4*z3^14*z5+ 6*z2^13*z4*z5- 2*z2^12*z3*z4*z5-
    2*z2^11*z3^2*z4*z5- 2*z2^10*z3^3*z4*z5- 2*z2^9*z3^4*z4*z5- 2*z2^8*z3^5*z4*z5-
    2*z2^7*z3^6*z4*z5- 2*z2^6*z3^7*z4*z5- 2*z2^5*z3^8*z4*z5- 2*z2^4*z3^9*z4*z5-
    2*z2^3*z3^10*z4*z5- 2*z2^2*z3^11*z4*z5- 2*z2*z3^12*z4*z5+ 6*z3^13*z4*z5-
    4*z2^14*z6+ 2*z2^13*z3*z6+ 2*z2^12*z3^2*z6+ 2*z2^11*z3^3*z6+ 2*z2^10*z3^4*z6+
    2*z2^9*z3^5*z6+ 2*z2^8*z3^6*z6+ 2*z2^7*z3^7*z6+ 2*z2^6*z3^8*z6+
    2*z2^5*z3^9*z6+ 2*z2^4*z3^10*z6+ 2*z2^3*z3^11*z6+ 2*z2^2*z3^12*z6+
    2*z2*z3^13*z6- 4*z3^14*z6+ 6*z2^13*z4*z6- 2*z2^12*z3*z4*z6-
    2*z2^11*z3^2*z4*z6- 2*z2^10*z3^3*z4*z6- 2*z2^9*z3^4*z4*z6- 2*z2^8*z3^5*z4*z6-
    2*z2^7*z3^6*z4*z6- 2*z2^6*z3^7*z4*z6- 2*z2^5*z3^8*z4*z6- 2*z2^4*z3^9*z4*z6-
    2*z2^3*z3^10*z4*z6- 2*z2^2*z3^11*z4*z6- 2*z2*z3^12*z4*z6+ 6*z3^13*z4*z6+
    6*z2^13*z5*z6- 2*z2^12*z3*z5*z6- 2*z2^11*z3^2*z5*z6- 2*z2^10*z3^3*z5*z6-
    2*z2^9*z3^4*z5*z6- 2*z2^8*z3^5*z5*z6- 2*z2^7*z3^6*z5*z6- 2*z2^6*z3^7*z5*z6-
    2*z2^5*z3^8*z5*z6- 2*z2^4*z3^9*z5*z6- 2*z2^3*z3^10*z5*z6- 2*z2^2*z3^11*z5*z6-
    2*z2*z3^12*z5*z6+ 6*z3^13*z5*z6- 8*z2^12*z4*z5*z6+ 2*z2^11*z3*z4*z5*z6+
    2*z2^10*z3^2*z4*z5*z6+ 2*z2^9*z3^3*z4*z5*z6+ 2*z2^8*z3^4*z4*z5*z6+
    2*z2^7*z3^5*z4*z5*z6+ 2*z2^6*z3^6*z4*z5*z6+ 2*z2^5*z3^7*z4*z5*z6+
    2*z2^4*z3^8*z4*z5*z6+ 2*z2^3*z3^9*z4*z5*z6+ 2*z2^2*z3^10*z4*z5*z6+
    2*z2*z3^11*z4*z5*z6- 8*z3^12*z4*z5*z6- 4*z2^14*z7+ 2*z2^13*z3*z7+
    2*z2^12*z3^2*z7+ 2*z2^11*z3^3*z7+ 2*z2^10*z3^4*z7+ 2*z2^9*z3^5*z7+
    2*z2^8*z3^6*z7+ 2*z2^7*z3^7*z7+ 2*z2^6*z3^8*z7+ 2*z2^5*z3^9*z7+
    2*z2^4*z3^10*z7+ 2*z2^3*z3^11*z7+ 2*z2^2*z3^12*z7+ 2*z2*z3^13*z7- 4*z3^14*z7+
    6*z2^13*z4*z7- 2*z2^12*z3*z4*z7- 2*z2^11*z3^2*z4*z7- 2*z2^10*z3^3*z4*z7-
    2*z2^9*z3^4*z4*z7- 2*z2^8*z3^5*z4*z7- 2*z2^7*z3^6*z4*z7- 2*z2^6*z3^7*z4*z7-
    2*z2^5*z3^8*z4*z7- 2*z2^4*z3^9*z4*z7- 2*z2^3*z3^10*z4*z7- 2*z2^2*z3^11*z4*z7-
    2*z2*z3^12*z4*z7+ 6*z3^13*z4*z7+ 6*z2^13*z5*z7- 2*z2^12*z3*z5*z7-
    2*z2^11*z3^2*z5*z7- 2*z2^10*z3^3*z5*z7- 2*z2^9*z3^4*z5*z7- 2*z2^8*z3^5*z5*z7-
    2*z2^7*z3^6*z5*z7- 2*z2^6*z3^7*z5*z7- 2*z2^5*z3^8*z5*z7- 2*z2^4*z3^9*z5*z7-
    2*z2^3*z3^10*z5*z7- 2*z2^2*z3^11*z5*z7- 2*z2*z3^12*z5*z7+ 6*z3^13*z5*z7-
    8*z2^12*z4*z5*z7+ 2*z2^11*z3*z4*z5*z7+ 2*z2^10*z3^2*z4*z5*z7+
    2*z2^9*z3^3*z4*z5*z7+ 2*z2^8*z3^4*z4*z5*z7+ 2*z2^7*z3^5*z4*z5*z7+
    2*z2^6*z3^6*z4*z5*z7+ 2*z2^5*z3^7*z4*z5*z7+ 2*z2^4*z3^8*z4*z5*z7+
    2*z2^3*z3^9*z4*z5*z7+ 2*z2^2*z3^10*z4*z5*z7+ 2*z2*z3^11*z4*z5*z7-
    8*z3^12*z4*z5*z7+ 6*z2^13*z6*z7- 2*z2^12*z3*z6*z7- 2*z2^11*z3^2*z6*z7-
    2*z2^10*z3^3*z6*z7- 2*z2^9*z3^4*z6*z7- 2*z2^8*z3^5*z6*z7- 2*z2^7*z3^6*z6*z7-
    2*z2^6*z3^7*z6*z7- 2*z2^5*z3^8*z6*z7- 2*z2^4*z3^9*z6*z7- 2*z2^3*z3^10*z6*z7-
    2*z2^2*z3^11*z6*z7- 2*z2*z3^12*z6*z7+ 6*z3^13*z6*z7- 8*z2^12*z4*z6*z7+
    2*z2^11*z3*z4*z6*z7+ 2*z2^10*z3^2*z4*z6*z7+ 2*z2^9*z3^3*z4*z6*z7+
    2*z2^8*z3^4*z4*z6*z7+ 2*z2^7*z3^5*z4*z6*z7+ 2*z2^6*z3^6*z4*z6*z7+
    2*z2^5*z3^7*z4*z6*z7+ 2*z2^4*z3^8*z4*z6*z7+ 2*z2^3*z3^9*z4*z6*z7+
    2*z2^2*z3^10*z4*z6*z7+ 2*z2*z3^11*z4*z6*z7- 8*z3^12*z4*z6*z7-
    8*z2^12*z5*z6*z7+ 2*z2^11*z3*z5*z6*z7+ 2*z2^10*z3^2*z5*z6*z7+
    2*z2^9*z3^3*z5*z6*z7+ 2*z2^8*z3^4*z5*z6*z7+ 2*z2^7*z3^5*z5*z6*z7+
    2*z2^6*z3^6*z5*z6*z7+ 2*z2^5*z3^7*z5*z6*z7+ 2*z2^4*z3^8*z5*z6*z7+
    2*z2^3*z3^9*z5*z6*z7+ 2*z2^2*z3^10*z5*z6*z7+ 2*z2*z3^11*z5*z6*z7-
    8*z3^12*z5*z6*z7+ 10*z2^11*z4*z5*z6*z7- 2*z2^10*z3*z4*z5*z6*z7-
    2*z2^9*z3^2*z4*z5*z6*z7- 2*z2^8*z3^3*z4*z5*z6*z7- 2*z2^7*z3^4*z4*z5*z6*z7-
    2*z2^6*z3^5*z4*z5*z6*z7- 2*z2^5*z3^6*z4*z5*z6*z7- 2*z2^4*z3^7*z4*z5*z6*z7-
    2*z2^3*z3^8*z4*z5*z6*z7- 2*z2^2*z3^9*z4*z5*z6*z7- 2*z2*z3^10*z4*z5*z6*z7+
    10*z3^11*z4*z5*z6*z7+ 10*z2^13- 3*z2^12*z3- 3*z2^11*z3^2- 3*z2^10*z3^3-
    3*z2^9*z3^4- 3*z2^8*z3^5- 3*z2^7*z3^6- 3*z2^6*z3^7- 3*z2^5*z3^8- 3*z2^4*z3^9-
    3*z2^3*z3^10- 3*z2^2*z3^11- 3*z2*z3^12+ 10*z3^13- 13*z2^12*z4- 3*z2^11*z3*z4-
    3*z2^10*z3^2*z4- 3*z2^9*z3^3*z4- 3*z2^8*z3^4*z4- 3*z2^7*z3^5*z4-
    3*z2^6*z3^6*z4- 3*z2^5*z3^7*z4- 3*z2^4*z3^8*z4- 3*z2^3*z3^9*z4-
    3*z2^2*z3^10*z4- 3*z2*z3^11*z4- 13*z3^12*z4- 13*z2^12*z5- 3*z2^11*z3*z5-
    3*z2^10*z3^2*z5- 3*z2^9*z3^3*z5- 3*z2^8*z3^4*z5- 3*z2^7*z3^5*z5-
    3*z2^6*z3^6*z5- 3*z2^5*z3^7*z5- 3*z2^4*z3^8*z5- 3*z2^3*z3^9*z5-
    3*z2^2*z3^10*z5- 3*z2*z3^11*z5- 13*z3^12*z5+ 10*z2^11*z4*z5+
    11*z2^10*z3*z4*z5+ 11*z2^9*z3^2*z4*z5+ 11*z2^8*z3^3*z4*z5+ 11*z2^7*z3^4*z4*z5+
    11*z2^6*z3^5*z4*z5+ 11*z2^5*z3^6*z4*z5+ 11*z2^4*z3^7*z4*z5+
    11*z2^3*z3^8*z4*z5+ 11*z2^2*z3^9*z4*z5+ 11*z2*z3^10*z4*z5+ 10*z3^11*z4*z5-
    13*z2^12*z6- 3*z2^11*z3*z6- 3*z2^10*z3^2*z6- 3*z2^9*z3^3*z6- 3*z2^8*z3^4*z6-
    3*z2^7*z3^5*z6- 3*z2^6*z3^6*z6- 3*z2^5*z3^7*z6- 3*z2^4*z3^8*z6-
    3*z2^3*z3^9*z6- 3*z2^2*z3^10*z6- 3*z2*z3^11*z6- 13*z3^12*z6+ 10*z2^11*z4*z6+
    11*z2^10*z3*z4*z6+ 11*z2^9*z3^2*z4*z6+ 11*z2^8*z3^3*z4*z6+ 11*z2^7*z3^4*z4*z6+
    11*z2^6*z3^5*z4*z6+ 11*z2^5*z3^6*z4*z6+ 11*z2^4*z3^7*z4*z6+
    11*z2^3*z3^8*z4*z6+ 11*z2^2*z3^9*z4*z6+ 11*z2*z3^10*z4*z6+ 10*z3^11*z4*z6+
    10*z2^11*z5*z6+ 11*z2^10*z3*z5*z6+ 11*z2^9*z3^2*z5*z6+ 11*z2^8*z3^3*z5*z6+
    11*z2^7*z3^4*z5*z6+ 11*z2^6*z3^5*z5*z6+ 11*z2^5*z3^6*z5*z6+
    11*z2^4*z3^7*z5*z6+ 11*z2^3*z3^8*z5*z6+ 11*z2^2*z3^9*z5*z6+ 11*z2*z3^10*z5*z6+
    10*z3^11*z5*z6+ z2^10*z4*z5*z6- 21*z2^9*z3*z4*z5*z6- 21*z2^8*z3^2*z4*z5*z6-
    21*z2^7*z3^3*z4*z5*z6- 21*z2^6*z3^4*z4*z5*z6- 21*z2^5*z3^5*z4*z5*z6-
    21*z2^4*z3^6*z4*z5*z6- 21*z2^3*z3^7*z4*z5*z6- 21*z2^2*z3^8*z4*z5*z6-
    21*z2*z3^9*z4*z5*z6+ z3^10*z4*z5*z6- 13*z2^12*z7- 3*z2^11*z3*z7-
    3*z2^10*z3^2*z7- 3*z2^9*z3^3*z7- 3*z2^8*z3^4*z7- 3*z2^7*z3^5*z7-
    3*z2^6*z3^6*z7- 3*z2^5*z3^7*z7- 3*z2^4*z3^8*z7- 3*z2^3*z3^9*z7-
    3*z2^2*z3^10*z7- 3*z2*z3^11*z7- 13*z3^12*z7+ 10*z2^11*z4*z7+
    11*z2^10*z3*z4*z7+ 11*z2^9*z3^2*z4*z7+ 11*z2^8*z3^3*z4*z7+ 11*z2^7*z3^4*z4*z7+
    11*z2^6*z3^5*z4*z7+ 11*z2^5*z3^6*z4*z7+ 11*z2^4*z3^7*z4*z7+
    11*z2^3*z3^8*z4*z7+ 11*z2^2*z3^9*z4*z7+ 11*z2*z3^10*z4*z7+ 10*z3^11*z4*z7+
    10*z2^11*z5*z7+ 11*z2^10*z3*z5*z7+ 11*z2^9*z3^2*z5*z7+ 11*z2^8*z3^3*z5*z7+
    11*z2^7*z3^4*z5*z7+ 11*z2^6*z3^5*z5*z7+ 11*z2^5*z3^6*z5*z7+
    11*z2^4*z3^7*z5*z7+ 11*z2^3*z3^8*z5*z7+ 11*z2^2*z3^9*z5*z7+ 11*z2*z3^10*z5*z7+
    10*z3^11*z5*z7+ z2^10*z4*z5*z7- 21*z2^9*z3*z4*z5*z7- 21*z2^8*z3^2*z4*z5*z7-
    21*z2^7*z3^3*z4*z5*z7- 21*z2^6*z3^4*z4*z5*z7- 21*z2^5*z3^5*z4*z5*z7-
    21*z2^4*z3^6*z4*z5*z7- 21*z2^3*z3^7*z4*z5*z7- 21*z2^2*z3^8*z4*z5*z7-
    21*z2*z3^9*z4*z5*z7+ z3^10*z4*z5*z7+ 10*z2^11*z6*z7+ 11*z2^10*z3*z6*z7+
    11*z2^9*z3^2*z6*z7+ 11*z2^8*z3^3*z6*z7+ 11*z2^7*z3^4*z6*z7+
    11*z2^6*z3^5*z6*z7+ 11*z2^5*z3^6*z6*z7+ 11*z2^4*z3^7*z6*z7+
    11*z2^3*z3^8*z6*z7+ 11*z2^2*z3^9*z6*z7+ 11*z2*z3^10*z6*z7+ 10*z3^11*z6*z7+
    z2^10*z4*z6*z7- 21*z2^9*z3*z4*z6*z7- 21*z2^8*z3^2*z4*z6*z7-
    21*z2^7*z3^3*z4*z6*z7- 21*z2^6*z3^4*z4*z6*z7- 21*z2^5*z3^5*z4*z6*z7-
    21*z2^4*z3^6*z4*z6*z7- 21*z2^3*z3^7*z4*z6*z7- 21*z2^2*z3^8*z4*z6*z7-
    21*z2*z3^9*z4*z6*z7+ z3^10*z4*z6*z7+ z2^10*z5*z6*z7- 21*z2^9*z3*z5*z6*z7-
    21*z2^8*z3^2*z5*z6*z7- 21*z2^7*z3^3*z5*z6*z7- 21*z2^6*z3^4*z5*z6*z7-
    21*z2^5*z3^5*z5*z6*z7- 21*z2^4*z3^6*z5*z6*z7- 21*z2^3*z3^7*z5*z6*z7-
    21*z2^2*z3^8*z5*z6*z7- 21*z2*z3^9*z5*z6*z7+ z3^10*z5*z6*z7-
    22*z2^9*z4*z5*z6*z7+ 33*z2^8*z3*z4*z5*z6*z7+ 33*z2^7*z3^2*z4*z5*z6*z7+
    33*z2^6*z3^3*z4*z5*z6*z7+ 33*z2^5*z3^4*z4*z5*z6*z7+ 33*z2^4*z3^5*z4*z5*z6*z7+
    33*z2^3*z3^6*z4*z5*z6*z7+ 33*z2^2*z3^7*z4*z5*z6*z7+ 33*z2*z3^8*z4*z5*z6*z7-
    22*z3^9*z4*z5*z6*z7- 1107*z2^11- 1119*z2^10*z3- 1119*z2^9*z3^2-
    1119*z2^8*z3^3- 1119*z2^7*z3^4- 1119*z2^6*z3^5- 1119*z2^5*z3^6-
    1119*z2^4*z3^7- 1119*z2^3*z3^8- 1119*z2^2*z3^9- 1119*z2*z3^10- 1107*z3^11-
    12*z2^10*z4+ 1109*z2^9*z3*z4+ 1109*z2^8*z3^2*z4+ 1109*z2^7*z3^3*z4+
    1109*z2^6*z3^4*z4+ 1109*z2^5*z3^5*z4+ 1109*z2^4*z3^6*z4+ 1109*z2^3*z3^7*z4+
    1109*z2^2*z3^8*z4+ 1109*z2*z3^9*z4- 12*z3^10*z4- 12*z2^10*z5+ 1109*z2^9*z3*z5+
    1109*z2^8*z3^2*z5+ 1109*z2^7*z3^3*z5+ 1109*z2^6*z3^4*z5+ 1109*z2^5*z3^5*z5+
    1109*z2^4*z3^6*z5+ 1109*z2^3*z3^7*z5+ 1109*z2^2*z3^8*z5+ 1109*z2*z3^9*z5-
    12*z3^10*z5+ 1121*z2^9*z4*z5- 1110*z2^8*z3*z4*z5- 1110*z2^7*z3^2*z4*z5-
    1110*z2^6*z3^3*z4*z5- 1110*z2^5*z3^4*z4*z5- 1110*z2^4*z3^5*z4*z5-
    1110*z2^3*z3^6*z4*z5- 1110*z2^2*z3^7*z4*z5- 1110*z2*z3^8*z4*z5+
    1121*z3^9*z4*z5- 12*z2^10*z6+ 1109*z2^9*z3*z6+ 1109*z2^8*z3^2*z6+
    1109*z2^7*z3^3*z6+ 1109*z2^6*z3^4*z6+ 1109*z2^5*z3^5*z6+ 1109*z2^4*z3^6*z6+
    1109*z2^3*z3^7*z6+ 1109*z2^2*z3^8*z6+ 1109*z2*z3^9*z6- 12*z3^10*z6+
    1121*z2^9*z4*z6- 1110*z2^8*z3*z4*z6- 1110*z2^7*z3^2*z4*z6-
    1110*z2^6*z3^3*z4*z6- 1110*z2^5*z3^4*z4*z6- 1110*z2^4*z3^5*z4*z6-
    1110*z2^3*z3^6*z4*z6- 1110*z2^2*z3^7*z4*z6- 1110*z2*z3^8*z4*z6+
    1121*z3^9*z4*z6+ 1121*z2^9*z5*z6- 1110*z2^8*z3*z5*z6- 1110*z2^7*z3^2*z5*z6-
    1110*z2^6*z3^3*z5*z6- 1110*z2^5*z3^4*z5*z6- 1110*z2^4*z3^5*z5*z6-
    1110*z2^3*z3^6*z5*z6- 1110*z2^2*z3^7*z5*z6- 1110*z2*z3^8*z5*z6+
    1121*z3^9*z5*z6- 2231*z2^8*z4*z5*z6+ 1132*z2^7*z3*z4*z5*z6+
    1132*z2^6*z3^2*z4*z5*z6+ 1132*z2^5*z3^3*z4*z5*z6+ 1132*z2^4*z3^4*z4*z5*z6+
    1132*z2^3*z3^5*z4*z5*z6+ 1132*z2^2*z3^6*z4*z5*z6+ 1132*z2*z3^7*z4*z5*z6-
    2231*z3^8*z4*z5*z6- 12*z2^10*z7+ 1109*z2^9*z3*z7+ 1109*z2^8*z3^2*z7+
    1109*z2^7*z3^3*z7+ 1109*z2^6*z3^4*z7+ 1109*z2^5*z3^5*z7+ 1109*z2^4*z3^6*z7+
    1109*z2^3*z3^7*z7+ 1109*z2^2*z3^8*z7+ 1109*z2*z3^9*z7- 12*z3^10*z7+
    1121*z2^9*z4*z7- 1110*z2^8*z3*z4*z7- 1110*z2^7*z3^2*z4*z7-
    1110*z2^6*z3^3*z4*z7- 1110*z2^5*z3^4*z4*z7- 1110*z2^4*z3^5*z4*z7-
    1110*z2^3*z3^6*z4*z7- 1110*z2^2*z3^7*z4*z7- 1110*z2*z3^8*z4*z7+
    1121*z3^9*z4*z7+ 1121*z2^9*z5*z7- 1110*z2^8*z3*z5*z7- 1110*z2^7*z3^2*z5*z7-
    1110*z2^6*z3^3*z5*z7- 1110*z2^5*z3^4*z5*z7- 1110*z2^4*z3^5*z5*z7-
    1110*z2^3*z3^6*z5*z7- 1110*z2^2*z3^7*z5*z7- 1110*z2*z3^8*z5*z7+
    1121*z3^9*z5*z7- 2231*z2^8*z4*z5*z7+ 1132*z2^7*z3*z4*z5*z7+
    1132*z2^6*z3^2*z4*z5*z7+ 1132*z2^5*z3^3*z4*z5*z7+ 1132*z2^4*z3^4*z4*z5*z7+
    1132*z2^3*z3^5*z4*z5*z7+ 1132*z2^2*z3^6*z4*z5*z7+ 1132*z2*z3^7*z4*z5*z7-
    2231*z3^8*z4*z5*z7+ 1121*z2^9*z6*z7- 1110*z2^8*z3*z6*z7- 1110*z2^7*z3^2*z6*z7-
    1110*z2^6*z3^3*z6*z7- 1110*z2^5*z3^4*z6*z7- 1110*z2^4*z3^5*z6*z7-
    1110*z2^3*z3^6*z6*z7- 1110*z2^2*z3^7*z6*z7- 1110*z2*z3^8*z6*z7+
    1121*z3^9*z6*z7- 2231*z2^8*z4*z6*z7+ 1132*z2^7*z3*z4*z6*z7+
    1132*z2^6*z3^2*z4*z6*z7+ 1132*z2^5*z3^3*z4*z6*z7+ 1132*z2^4*z3^4*z4*z6*z7+
    1132*z2^3*z3^5*z4*z6*z7+ 1132*z2^2*z3^6*z4*z6*z7+ 1132*z2*z3^7*z4*z6*z7-
    2231*z3^8*z4*z6*z7- 2231*z2^8*z5*z6*z7+ 1132*z2^7*z3*z5*z6*z7+
    1132*z2^6*z3^2*z5*z6*z7+ 1132*z2^5*z3^3*z5*z6*z7+ 1132*z2^4*z3^4*z5*z6*z7+
    1132*z2^3*z3^5*z5*z6*z7+ 1132*z2^2*z3^6*z5*z6*z7+ 1132*z2*z3^7*z5*z6*z7-
    2231*z3^8*z5*z6*z7+ 3363*z2^7*z4*z5*z6*z7- 1187*z2^6*z3*z4*z5*z6*z7-
    1187*z2^5*z3^2*z4*z5*z6*z7- 1187*z2^4*z3^3*z4*z5*z6*z7-
    1187*z2^3*z3^4*z4*z5*z6*z7- 1187*z2^2*z3^5*z4*z5*z6*z7-
    1187*z2*z3^6*z4*z5*z6*z7+ 3363*z3^7*z4*z5*z6*z7+ 2264*z2^9- 1110*z2^8*z3-
    1110*z2^7*z3^2- 1110*z2^6*z3^3- 1110*z2^5*z3^4- 1110*z2^4*z3^5-
    1110*z2^3*z3^6- 1110*z2^2*z3^7- 1110*z2*z3^8+ 2264*z3^9- 3374*z2^8*z4-
    11*z2^7*z3*z4- 11*z2^6*z3^2*z4- 11*z2^5*z3^3*z4- 11*z2^4*z3^4*z4-
    11*z2^3*z3^5*z4- 11*z2^2*z3^6*z4- 11*z2*z3^7*z4- 3374*z3^8*z4- 3374*z2^8*z5-
    11*z2^7*z3*z5- 11*z2^6*z3^2*z5- 11*z2^5*z3^3*z5- 11*z2^4*z3^4*z5-
    11*z2^3*z3^5*z5- 11*z2^2*z3^6*z5- 11*z2*z3^7*z5- 3374*z3^8*z5+
    3363*z2^7*z4*z5+ 2242*z2^6*z3*z4*z5+ 2242*z2^5*z3^2*z4*z5+
    2242*z2^4*z3^3*z4*z5+ 2242*z2^3*z3^4*z4*z5+ 2242*z2^2*z3^5*z4*z5+
    2242*z2*z3^6*z4*z5+ 3363*z3^7*z4*z5- 3374*z2^8*z6- 11*z2^7*z3*z6-
    11*z2^6*z3^2*z6- 11*z2^5*z3^3*z6- 11*z2^4*z3^4*z6- 11*z2^3*z3^5*z6-
    11*z2^2*z3^6*z6- 11*z2*z3^7*z6- 3374*z3^8*z6+ 3363*z2^7*z4*z6+
    2242*z2^6*z3*z4*z6+ 2242*z2^5*z3^2*z4*z6+ 2242*z2^4*z3^3*z4*z6+
    2242*z2^3*z3^4*z4*z6+ 2242*z2^2*z3^5*z4*z6+ 2242*z2*z3^6*z4*z6+
    3363*z3^7*z4*z6+ 3363*z2^7*z5*z6+ 2242*z2^6*z3*z5*z6+ 2242*z2^5*z3^2*z5*z6+
    2242*z2^4*z3^3*z5*z6+ 2242*z2^3*z3^4*z5*z6+ 2242*z2^2*z3^5*z5*z6+
    2242*z2*z3^6*z5*z6+ 3363*z3^7*z5*z6- 1121*z2^6*z4*z5*z6+
    3396*z2^5*z3*z4*z5*z6+ 3396*z2^4*z3^2*z4*z5*z6+ 3396*z2^3*z3^3*z4*z5*z6+
    3396*z2^2*z3^4*z4*z5*z6+ 3396*z2*z3^5*z4*z5*z6- 1121*z3^6*z4*z5*z6-
    3374*z2^8*z7- 11*z2^7*z3*z7- 11*z2^6*z3^2*z7- 11*z2^5*z3^3*z7-
    11*z2^4*z3^4*z7- 11*z2^3*z3^5*z7- 11*z2^2*z3^6*z7- 11*z2*z3^7*z7-
    3374*z3^8*z7+ 3363*z2^7*z4*z7+ 2242*z2^6*z3*z4*z7+ 2242*z2^5*z3^2*z4*z7+
    2242*z2^4*z3^3*z4*z7+ 2242*z2^3*z3^4*z4*z7+ 2242*z2^2*z3^5*z4*z7+
    2242*z2*z3^6*z4*z7+ 3363*z3^7*z4*z7+ 3363*z2^7*z5*z7+ 2242*z2^6*z3*z5*z7+
    2242*z2^5*z3^2*z5*z7+ 2242*z2^4*z3^3*z5*z7+ 2242*z2^3*z3^4*z5*z7+
    2242*z2^2*z3^5*z5*z7+ 2242*z2*z3^6*z5*z7+ 3363*z3^7*z5*z7- 1121*z2^6*z4*z5*z7+
    3396*z2^5*z3*z4*z5*z7+ 3396*z2^4*z3^2*z4*z5*z7+ 3396*z2^3*z3^3*z4*z5*z7+
    3396*z2^2*z3^4*z4*z5*z7+ 3396*z2*z3^5*z4*z5*z7- 1121*z3^6*z4*z5*z7+
    3363*z2^7*z6*z7+ 2242*z2^6*z3*z6*z7+ 2242*z2^5*z3^2*z6*z7+
    2242*z2^4*z3^3*z6*z7+ 2242*z2^3*z3^4*z6*z7+ 2242*z2^2*z3^5*z6*z7+
    2242*z2*z3^6*z6*z7+ 3363*z3^7*z6*z7- 1121*z2^6*z4*z6*z7+
    3396*z2^5*z3*z4*z6*z7+ 3396*z2^4*z3^2*z4*z6*z7+ 3396*z2^3*z3^3*z4*z6*z7+
    3396*z2^2*z3^4*z4*z6*z7+ 3396*z2*z3^5*z4*z6*z7- 1121*z3^6*z4*z6*z7-
    1121*z2^6*z5*z6*z7+ 3396*z2^5*z3*z5*z6*z7+ 3396*z2^4*z3^2*z5*z6*z7+
    3396*z2^3*z3^3*z5*z6*z7+ 3396*z2^2*z3^4*z5*z6*z7+ 3396*z2*z3^5*z5*z6*z7-
    1121*z3^6*z5*z6*z7- 4484*z2^5*z4*z5*z6*z7+ 1154*z2^4*z3*z4*z5*z6*z7+
    1154*z2^3*z3^2*z4*z5*z6*z7+ 1154*z2^2*z3^3*z4*z5*z6*z7+
    1154*z2*z3^4*z4*z5*z6*z7- 4484*z3^5*z4*z5*z6*z7+ 2604*z2^7+ 2751*z2^6*z3+
    2751*z2^5*z3^2+ 2751*z2^4*z3^3+ 2751*z2^3*z3^4+ 2751*z2^2*z3^5+ 2751*z2*z3^6+
    2604*z3^7+ 147*z2^6*z4+ 2887*z2^5*z3*z4+ 2887*z2^4*z3^2*z4+ 2887*z2^3*z3^3*z4+
    2887*z2^2*z3^4*z4+ 2887*z2*z3^5*z4+ 147*z3^6*z4+ 147*z2^6*z5+ 2887*z2^5*z3*z5+
    2887*z2^4*z3^2*z5+ 2887*z2^3*z3^3*z5+ 2887*z2^2*z3^4*z5+ 2887*z2*z3^5*z5+
    147*z3^6*z5+ 2740*z2^5*z4*z5- 1766*z2^4*z3*z4*z5- 1766*z2^3*z3^2*z4*z5-
    1766*z2^2*z3^3*z4*z5- 1766*z2*z3^4*z4*z5+ 2740*z3^5*z4*z5+ 147*z2^6*z6+
    2887*z2^5*z3*z6+ 2887*z2^4*z3^2*z6+ 2887*z2^3*z3^3*z6+ 2887*z2^2*z3^4*z6+
    2887*z2*z3^5*z6+ 147*z3^6*z6+ 2740*z2^5*z4*z6- 1766*z2^4*z3*z4*z6-
    1766*z2^3*z3^2*z4*z6- 1766*z2^2*z3^3*z4*z6- 1766*z2*z3^4*z4*z6+
    2740*z3^5*z4*z6+ 2740*z2^5*z5*z6- 1766*z2^4*z3*z5*z6- 1766*z2^3*z3^2*z5*z6-
    1766*z2^2*z3^3*z5*z6- 1766*z2*z3^4*z5*z6+ 2740*z3^5*z5*z6+ 4495*z2^4*z4*z5*z6-
    2751*z2^3*z3*z4*z5*z6- 2751*z2^2*z3^2*z4*z5*z6- 2751*z2*z3^3*z4*z5*z6+
    4495*z3^4*z4*z5*z6+ 147*z2^6*z7+ 2887*z2^5*z3*z7+ 2887*z2^4*z3^2*z7+
    2887*z2^3*z3^3*z7+ 2887*z2^2*z3^4*z7+ 2887*z2*z3^5*z7+ 147*z3^6*z7+
    2740*z2^5*z4*z7- 1766*z2^4*z3*z4*z7- 1766*z2^3*z3^2*z4*z7-
    1766*z2^2*z3^3*z4*z7- 1766*z2*z3^4*z4*z7+ 2740*z3^5*z4*z7+ 2740*z2^5*z5*z7-
    1766*z2^4*z3*z5*z7- 1766*z2^3*z3^2*z5*z7- 1766*z2^2*z3^3*z5*z7-
    1766*z2*z3^4*z5*z7+ 2740*z3^5*z5*z7+ 4495*z2^4*z4*z5*z7-
    2751*z2^3*z3*z4*z5*z7- 2751*z2^2*z3^2*z4*z5*z7- 2751*z2*z3^3*z4*z5*z7+
    4495*z3^4*z4*z5*z7+ 2740*z2^5*z6*z7- 1766*z2^4*z3*z6*z7- 1766*z2^3*z3^2*z6*z7-
    1766*z2^2*z3^3*z6*z7- 1766*z2*z3^4*z6*z7+ 2740*z3^5*z6*z7+ 4495*z2^4*z4*z6*z7-
    2751*z2^3*z3*z4*z6*z7- 2751*z2^2*z3^2*z4*z6*z7- 2751*z2*z3^3*z4*z6*z7+
    4495*z3^4*z4*z6*z7+ 4495*z2^4*z5*z6*z7- 2751*z2^3*z3*z5*z6*z7-
    2751*z2^2*z3^2*z5*z6*z7- 2751*z2*z3^3*z5*z6*z7+ 4495*z3^4*z5*z6*z7+
    1755*z2^3*z4*z5*z6*z7- 2887*z2^2*z3*z4*z5*z6*z7- 2887*z2*z3^2*z4*z5*z6*z7+
    1755*z3^3*z4*z5*z6*z7+ 2037*z2^5+ 2355*z2^4*z3+ 2355*z2^3*z3^2+
    2355*z2^2*z3^3+ 2355*z2*z3^4+ 2037*z3^5+ 318*z2^4*z4+ 3906*z2^3*z3*z4+
    3906*z2^2*z3^2*z4+ 3906*z2*z3^3*z4+ 318*z3^4*z4+ 318*z2^4*z5+ 3906*z2^3*z3*z5+
    3906*z2^2*z3^2*z5+ 3906*z2*z3^3*z5+ 318*z3^4*z5+ 3588*z2^3*z4*z5+
    600*z2^2*z3*z4*z5+ 600*z2*z3^2*z4*z5+ 3588*z3^3*z4*z5+ 318*z2^4*z6+
    3906*z2^3*z3*z6+ 3906*z2^2*z3^2*z6+ 3906*z2*z3^3*z6+ 318*z3^4*z6+
    3588*z2^3*z4*z6+ 600*z2^2*z3*z4*z6+ 600*z2*z3^2*z4*z6+ 3588*z3^3*z4*z6+
    3588*z2^3*z5*z6+ 600*z2^2*z3*z5*z6+ 600*z2*z3^2*z5*z6+ 3588*z3^3*z5*z6-
    2988*z2^2*z4*z5*z6- 2355*z2*z3*z4*z5*z6- 2988*z3^2*z4*z5*z6+ 318*z2^4*z7+
    3906*z2^3*z3*z7+ 3906*z2^2*z3^2*z7+ 3906*z2*z3^3*z7+ 318*z3^4*z7+
    3588*z2^3*z4*z7+ 600*z2^2*z3*z4*z7+ 600*z2*z3^2*z4*z7+ 3588*z3^3*z4*z7+
    3588*z2^3*z5*z7+ 600*z2^2*z3*z5*z7+ 600*z2*z3^2*z5*z7+ 3588*z3^3*z5*z7-
    2988*z2^2*z4*z5*z7- 2355*z2*z3*z4*z5*z7- 2988*z3^2*z4*z5*z7+ 3588*z2^3*z6*z7+
    600*z2^2*z3*z6*z7+ 600*z2*z3^2*z6*z7+ 3588*z3^3*z6*z7- 2988*z2^2*z4*z6*z7-
    2355*z2*z3*z4*z6*z7- 2988*z3^2*z4*z6*z7- 2988*z2^2*z5*z6*z7-
    2355*z2*z3*z5*z6*z7- 2988*z3^2*z5*z6*z7+ 633*z2*z4*z5*z6*z7+
    633*z3*z4*z5*z6*z7+ 2166*z2^3+ 390*z2^2*z3+ 390*z2*z3^2+ 2166*z3^3-
    1776*z2^2*z4- 3978*z2*z3*z4- 1776*z3^2*z4- 1776*z2^2*z5- 3978*z2*z3*z5-
    1776*z3^2*z5- 2202*z2*z4*z5- 2202*z3*z4*z5- 1776*z2^2*z6- 3978*z2*z3*z6-
    1776*z3^2*z6- 2202*z2*z4*z6- 2202*z3*z4*z6- 2202*z2*z5*z6- 2202*z3*z5*z6-
    1068*z4*z5*z6- 1776*z2^2*z7- 3978*z2*z3*z7- 1776*z3^2*z7- 2202*z2*z4*z7-
    2202*z3*z4*z7- 2202*z2*z5*z7- 2202*z3*z5*z7- 1068*z4*z5*z7- 2202*z2*z6*z7-
    2202*z3*z6*z7- 1068*z4*z6*z7- 1068*z5*z6*z7- 1169*z2- 1169*z3+ 3538*z4+
    3538*z5+ 3538*z6+ 3538*z7, 2*z2^15- 4*z2^14*z3- 2*z2^14*z4+ 2*z2^13*z3*z4-
    2*z2^13*z4^2+ 2*z2^12*z3*z4^2- 2*z2^12*z4^3+ 2*z2^11*z3*z4^3- 2*z2^11*z4^4+
    2*z2^10*z3*z4^4- 2*z2^10*z4^5+ 2*z2^9*z3*z4^5- 2*z2^9*z4^6+ 2*z2^8*z3*z4^6-
    2*z2^8*z4^7+ 2*z2^7*z3*z4^7- 2*z2^7*z4^8+ 2*z2^6*z3*z4^8- 2*z2^6*z4^9+
    2*z2^5*z3*z4^9- 2*z2^5*z4^10+ 2*z2^4*z3*z4^10- 2*z2^4*z4^11+ 2*z2^3*z3*z4^11-
    2*z2^3*z4^12+ 2*z2^2*z3*z4^12- 2*z2^2*z4^13+ 2*z2*z3*z4^13- 2*z2*z4^14-
    4*z3*z4^14+ 2*z4^15- 4*z2^14*z5+ 6*z2^13*z3*z5+ 2*z2^13*z4*z5-
    2*z2^12*z3*z4*z5+ 2*z2^12*z4^2*z5- 2*z2^11*z3*z4^2*z5+ 2*z2^11*z4^3*z5-
    2*z2^10*z3*z4^3*z5+ 2*z2^10*z4^4*z5- 2*z2^9*z3*z4^4*z5+ 2*z2^9*z4^5*z5-
    2*z2^8*z3*z4^5*z5+ 2*z2^8*z4^6*z5- 2*z2^7*z3*z4^6*z5+ 2*z2^7*z4^7*z5-
    2*z2^6*z3*z4^7*z5+ 2*z2^6*z4^8*z5- 2*z2^5*z3*z4^8*z5+ 2*z2^5*z4^9*z5-
    2*z2^4*z3*z4^9*z5+ 2*z2^4*z4^10*z5- 2*z2^3*z3*z4^10*z5+ 2*z2^3*z4^11*z5-
    2*z2^2*z3*z4^11*z5+ 2*z2^2*z4^12*z5- 2*z2*z3*z4^12*z5+ 2*z2*z4^13*z5+
    6*z3*z4^13*z5- 4*z4^14*z5- 4*z2^14*z6+ 6*z2^13*z3*z6+ 2*z2^13*z4*z6-
    2*z2^12*z3*z4*z6+ 2*z2^12*z4^2*z6- 2*z2^11*z3*z4^2*z6+ 2*z2^11*z4^3*z6-
    2*z2^10*z3*z4^3*z6+ 2*z2^10*z4^4*z6- 2*z2^9*z3*z4^4*z6+ 2*z2^9*z4^5*z6-
    2*z2^8*z3*z4^5*z6+ 2*z2^8*z4^6*z6- 2*z2^7*z3*z4^6*z6+ 2*z2^7*z4^7*z6-
    2*z2^6*z3*z4^7*z6+ 2*z2^6*z4^8*z6- 2*z2^5*z3*z4^8*z6+ 2*z2^5*z4^9*z6-
    2*z2^4*z3*z4^9*z6+ 2*z2^4*z4^10*z6- 2*z2^3*z3*z4^10*z6+ 2*z2^3*z4^11*z6-
    2*z2^2*z3*z4^11*z6+ 2*z2^2*z4^12*z6- 2*z2*z3*z4^12*z6+ 2*z2*z4^13*z6+
    6*z3*z4^13*z6- 4*z4^14*z6+ 6*z2^13*z5*z6- 8*z2^12*z3*z5*z6- 2*z2^12*z4*z5*z6+
    2*z2^11*z3*z4*z5*z6- 2*z2^11*z4^2*z5*z6+ 2*z2^10*z3*z4^2*z5*z6-
    2*z2^10*z4^3*z5*z6+ 2*z2^9*z3*z4^3*z5*z6- 2*z2^9*z4^4*z5*z6+
    2*z2^8*z3*z4^4*z5*z6- 2*z2^8*z4^5*z5*z6+ 2*z2^7*z3*z4^5*z5*z6-
    2*z2^7*z4^6*z5*z6+ 2*z2^6*z3*z4^6*z5*z6- 2*z2^6*z4^7*z5*z6+
    2*z2^5*z3*z4^7*z5*z6- 2*z2^5*z4^8*z5*z6+ 2*z2^4*z3*z4^8*z5*z6-
    2*z2^4*z4^9*z5*z6+ 2*z2^3*z3*z4^9*z5*z6- 2*z2^3*z4^10*z5*z6+
    2*z2^2*z3*z4^10*z5*z6- 2*z2^2*z4^11*z5*z6+ 2*z2*z3*z4^11*z5*z6-
    2*z2*z4^12*z5*z6- 8*z3*z4^12*z5*z6+ 6*z4^13*z5*z6- 4*z2^14*z7+ 6*z2^13*z3*z7+
    2*z2^13*z4*z7- 2*z2^12*z3*z4*z7+ 2*z2^12*z4^2*z7- 2*z2^11*z3*z4^2*z7+
    2*z2^11*z4^3*z7- 2*z2^10*z3*z4^3*z7+ 2*z2^10*z4^4*z7- 2*z2^9*z3*z4^4*z7+
    2*z2^9*z4^5*z7- 2*z2^8*z3*z4^5*z7+ 2*z2^8*z4^6*z7- 2*z2^7*z3*z4^6*z7+
    2*z2^7*z4^7*z7- 2*z2^6*z3*z4^7*z7+ 2*z2^6*z4^8*z7- 2*z2^5*z3*z4^8*z7+
    2*z2^5*z4^9*z7- 2*z2^4*z3*z4^9*z7+ 2*z2^4*z4^10*z7- 2*z2^3*z3*z4^10*z7+
    2*z2^3*z4^11*z7- 2*z2^2*z3*z4^11*z7+ 2*z2^2*z4^12*z7- 2*z2*z3*z4^12*z7+
    2*z2*z4^13*z7+ 6*z3*z4^13*z7- 4*z4^14*z7+ 6*z2^13*z5*z7- 8*z2^12*z3*z5*z7-
    2*z2^12*z4*z5*z7+ 2*z2^11*z3*z4*z5*z7- 2*z2^11*z4^2*z5*z7+
    2*z2^10*z3*z4^2*z5*z7- 2*z2^10*z4^3*z5*z7+ 2*z2^9*z3*z4^3*z5*z7-
    2*z2^9*z4^4*z5*z7+ 2*z2^8*z3*z4^4*z5*z7- 2*z2^8*z4^5*z5*z7+
    2*z2^7*z3*z4^5*z5*z7- 2*z2^7*z4^6*z5*z7+ 2*z2^6*z3*z4^6*z5*z7-
    2*z2^6*z4^7*z5*z7+ 2*z2^5*z3*z4^7*z5*z7- 2*z2^5*z4^8*z5*z7+
    2*z2^4*z3*z4^8*z5*z7- 2*z2^4*z4^9*z5*z7+ 2*z2^3*z3*z4^9*z5*z7-
    2*z2^3*z4^10*z5*z7+ 2*z2^2*z3*z4^10*z5*z7- 2*z2^2*z4^11*z5*z7+
    2*z2*z3*z4^11*z5*z7- 2*z2*z4^12*z5*z7- 8*z3*z4^12*z5*z7+ 6*z4^13*z5*z7+
    6*z2^13*z6*z7- 8*z2^12*z3*z6*z7- 2*z2^12*z4*z6*z7+ 2*z2^11*z3*z4*z6*z7-
    2*z2^11*z4^2*z6*z7+ 2*z2^10*z3*z4^2*z6*z7- 2*z2^10*z4^3*z6*z7+
    2*z2^9*z3*z4^3*z6*z7- 2*z2^9*z4^4*z6*z7+ 2*z2^8*z3*z4^4*z6*z7-
    2*z2^8*z4^5*z6*z7+ 2*z2^7*z3*z4^5*z6*z7- 2*z2^7*z4^6*z6*z7+
    2*z2^6*z3*z4^6*z6*z7- 2*z2^6*z4^7*z6*z7+ 2*z2^5*z3*z4^7*z6*z7-
    2*z2^5*z4^8*z6*z7+ 2*z2^4*z3*z4^8*z6*z7- 2*z2^4*z4^9*z6*z7+
    2*z2^3*z3*z4^9*z6*z7- 2*z2^3*z4^10*z6*z7+ 2*z2^2*z3*z4^10*z6*z7-
    2*z2^2*z4^11*z6*z7+ 2*z2*z3*z4^11*z6*z7- 2*z2*z4^12*z6*z7- 8*z3*z4^12*z6*z7+
    6*z4^13*z6*z7- 8*z2^12*z5*z6*z7+ 10*z2^11*z3*z5*z6*z7+ 2*z2^11*z4*z5*z6*z7-
    2*z2^10*z3*z4*z5*z6*z7+ 2*z2^10*z4^2*z5*z6*z7- 2*z2^9*z3*z4^2*z5*z6*z7+
    2*z2^9*z4^3*z5*z6*z7- 2*z2^8*z3*z4^3*z5*z6*z7+ 2*z2^8*z4^4*z5*z6*z7-
    2*z2^7*z3*z4^4*z5*z6*z7+ 2*z2^7*z4^5*z5*z6*z7- 2*z2^6*z3*z4^5*z5*z6*z7+
    2*z2^6*z4^6*z5*z6*z7- 2*z2^5*z3*z4^6*z5*z6*z7+ 2*z2^5*z4^7*z5*z6*z7-
    2*z2^4*z3*z4^7*z5*z6*z7+ 2*z2^4*z4^8*z5*z6*z7- 2*z2^3*z3*z4^8*z5*z6*z7+
    2*z2^3*z4^9*z5*z6*z7- 2*z2^2*z3*z4^9*z5*z6*z7+ 2*z2^2*z4^10*z5*z6*z7-
    2*z2*z3*z4^10*z5*z6*z7+ 2*z2*z4^11*z5*z6*z7+ 10*z3*z4^11*z5*z6*z7-
    8*z4^12*z5*z6*z7+ 10*z2^13- 13*z2^12*z3- 3*z2^12*z4- 3*z2^11*z3*z4-
    3*z2^11*z4^2- 3*z2^10*z3*z4^2- 3*z2^10*z4^3- 3*z2^9*z3*z4^3- 3*z2^9*z4^4-
    3*z2^8*z3*z4^4- 3*z2^8*z4^5- 3*z2^7*z3*z4^5- 3*z2^7*z4^6- 3*z2^6*z3*z4^6-
    3*z2^6*z4^7- 3*z2^5*z3*z4^7- 3*z2^5*z4^8- 3*z2^4*z3*z4^8- 3*z2^4*z4^9-
    3*z2^3*z3*z4^9- 3*z2^3*z4^10- 3*z2^2*z3*z4^10- 3*z2^2*z4^11- 3*z2*z3*z4^11-
    3*z2*z4^12- 13*z3*z4^12+ 10*z4^13- 13*z2^12*z5+ 10*z2^11*z3*z5- 3*z2^11*z4*z5+
    11*z2^10*z3*z4*z5- 3*z2^10*z4^2*z5+ 11*z2^9*z3*z4^2*z5- 3*z2^9*z4^3*z5+
    11*z2^8*z3*z4^3*z5- 3*z2^8*z4^4*z5+ 11*z2^7*z3*z4^4*z5- 3*z2^7*z4^5*z5+
    11*z2^6*z3*z4^5*z5- 3*z2^6*z4^6*z5+ 11*z2^5*z3*z4^6*z5- 3*z2^5*z4^7*z5+
    11*z2^4*z3*z4^7*z5- 3*z2^4*z4^8*z5+ 11*z2^3*z3*z4^8*z5- 3*z2^3*z4^9*z5+
    11*z2^2*z3*z4^9*z5- 3*z2^2*z4^10*z5+ 11*z2*z3*z4^10*z5- 3*z2*z4^11*z5+
    10*z3*z4^11*z5- 13*z4^12*z5- 13*z2^12*z6+ 10*z2^11*z3*z6- 3*z2^11*z4*z6+
    11*z2^10*z3*z4*z6- 3*z2^10*z4^2*z6+ 11*z2^9*z3*z4^2*z6- 3*z2^9*z4^3*z6+
    11*z2^8*z3*z4^3*z6- 3*z2^8*z4^4*z6+ 11*z2^7*z3*z4^4*z6- 3*z2^7*z4^5*z6+
    11*z2^6*z3*z4^5*z6- 3*z2^6*z4^6*z6+ 11*z2^5*z3*z4^6*z6- 3*z2^5*z4^7*z6+
    11*z2^4*z3*z4^7*z6- 3*z2^4*z4^8*z6+ 11*z2^3*z3*z4^8*z6- 3*z2^3*z4^9*z6+
    11*z2^2*z3*z4^9*z6- 3*z2^2*z4^10*z6+ 11*z2*z3*z4^10*z6- 3*z2*z4^11*z6+
    10*z3*z4^11*z6- 13*z4^12*z6+ 10*z2^11*z5*z6+ z2^10*z3*z5*z6+
    11*z2^10*z4*z5*z6- 21*z2^9*z3*z4*z5*z6+ 11*z2^9*z4^2*z5*z6-
    21*z2^8*z3*z4^2*z5*z6+ 11*z2^8*z4^3*z5*z6- 21*z2^7*z3*z4^3*z5*z6+
    11*z2^7*z4^4*z5*z6- 21*z2^6*z3*z4^4*z5*z6+ 11*z2^6*z4^5*z5*z6-
    21*z2^5*z3*z4^5*z5*z6+ 11*z2^5*z4^6*z5*z6- 21*z2^4*z3*z4^6*z5*z6+
    11*z2^4*z4^7*z5*z6- 21*z2^3*z3*z4^7*z5*z6+ 11*z2^3*z4^8*z5*z6-
    21*z2^2*z3*z4^8*z5*z6+ 11*z2^2*z4^9*z5*z6- 21*z2*z3*z4^9*z5*z6+
    11*z2*z4^10*z5*z6+ z3*z4^10*z5*z6+ 10*z4^11*z5*z6- 13*z2^12*z7+
    10*z2^11*z3*z7- 3*z2^11*z4*z7+ 11*z2^10*z3*z4*z7- 3*z2^10*z4^2*z7+
    11*z2^9*z3*z4^2*z7- 3*z2^9*z4^3*z7+ 11*z2^8*z3*z4^3*z7- 3*z2^8*z4^4*z7+
    11*z2^7*z3*z4^4*z7- 3*z2^7*z4^5*z7+ 11*z2^6*z3*z4^5*z7- 3*z2^6*z4^6*z7+
    11*z2^5*z3*z4^6*z7- 3*z2^5*z4^7*z7+ 11*z2^4*z3*z4^7*z7- 3*z2^4*z4^8*z7+
    11*z2^3*z3*z4^8*z7- 3*z2^3*z4^9*z7+ 11*z2^2*z3*z4^9*z7- 3*z2^2*z4^10*z7+
    11*z2*z3*z4^10*z7- 3*z2*z4^11*z7+ 10*z3*z4^11*z7- 13*z4^12*z7+ 10*z2^11*z5*z7+
    z2^10*z3*z5*z7+ 11*z2^10*z4*z5*z7- 21*z2^9*z3*z4*z5*z7+ 11*z2^9*z4^2*z5*z7-
    21*z2^8*z3*z4^2*z5*z7+ 11*z2^8*z4^3*z5*z7- 21*z2^7*z3*z4^3*z5*z7+
    11*z2^7*z4^4*z5*z7- 21*z2^6*z3*z4^4*z5*z7+ 11*z2^6*z4^5*z5*z7-
    21*z2^5*z3*z4^5*z5*z7+ 11*z2^5*z4^6*z5*z7- 21*z2^4*z3*z4^6*z5*z7+
    11*z2^4*z4^7*z5*z7- 21*z2^3*z3*z4^7*z5*z7+ 11*z2^3*z4^8*z5*z7-
    21*z2^2*z3*z4^8*z5*z7+ 11*z2^2*z4^9*z5*z7- 21*z2*z3*z4^9*z5*z7+
    11*z2*z4^10*z5*z7+ z3*z4^10*z5*z7+ 10*z4^11*z5*z7+ 10*z2^11*z6*z7+
    z2^10*z3*z6*z7+ 11*z2^10*z4*z6*z7- 21*z2^9*z3*z4*z6*z7+ 11*z2^9*z4^2*z6*z7-
    21*z2^8*z3*z4^2*z6*z7+ 11*z2^8*z4^3*z6*z7- 21*z2^7*z3*z4^3*z6*z7+
    11*z2^7*z4^4*z6*z7- 21*z2^6*z3*z4^4*z6*z7+ 11*z2^6*z4^5*z6*z7-
    21*z2^5*z3*z4^5*z6*z7+ 11*z2^5*z4^6*z6*z7- 21*z2^4*z3*z4^6*z6*z7+
    11*z2^4*z4^7*z6*z7- 21*z2^3*z3*z4^7*z6*z7+ 11*z2^3*z4^8*z6*z7-
    21*z2^2*z3*z4^8*z6*z7+ 11*z2^2*z4^9*z6*z7- 21*z2*z3*z4^9*z6*z7+
    11*z2*z4^10*z6*z7+ z3*z4^10*z6*z7+ 10*z4^11*z6*z7+ z2^10*z5*z6*z7-
    22*z2^9*z3*z5*z6*z7- 21*z2^9*z4*z5*z6*z7+ 33*z2^8*z3*z4*z5*z6*z7-
    21*z2^8*z4^2*z5*z6*z7+ 33*z2^7*z3*z4^2*z5*z6*z7- 21*z2^7*z4^3*z5*z6*z7+
    33*z2^6*z3*z4^3*z5*z6*z7- 21*z2^6*z4^4*z5*z6*z7+ 33*z2^5*z3*z4^4*z5*z6*z7-
    21*z2^5*z4^5*z5*z6*z7+ 33*z2^4*z3*z4^5*z5*z6*z7- 21*z2^4*z4^6*z5*z6*z7+
    33*z2^3*z3*z4^6*z5*z6*z7- 21*z2^3*z4^7*z5*z6*z7+ 33*z2^2*z3*z4^7*z5*z6*z7-
    21*z2^2*z4^8*z5*z6*z7+ 33*z2*z3*z4^8*z5*z6*z7- 21*z2*z4^9*z5*z6*z7-
    22*z3*z4^9*z5*z6*z7+ z4^10*z5*z6*z7- 1107*z2^11- 12*z2^10*z3- 1119*z2^10*z4+
    1109*z2^9*z3*z4- 1119*z2^9*z4^2+ 1109*z2^8*z3*z4^2- 1119*z2^8*z4^3+
    1109*z2^7*z3*z4^3- 1119*z2^7*z4^4+ 1109*z2^6*z3*z4^4- 1119*z2^6*z4^5+
    1109*z2^5*z3*z4^5- 1119*z2^5*z4^6+ 1109*z2^4*z3*z4^6- 1119*z2^4*z4^7+
    1109*z2^3*z3*z4^7- 1119*z2^3*z4^8+ 1109*z2^2*z3*z4^8- 1119*z2^2*z4^9+
    1109*z2*z3*z4^9- 1119*z2*z4^10- 12*z3*z4^10- 1107*z4^11- 12*z2^10*z5+
    1121*z2^9*z3*z5+ 1109*z2^9*z4*z5- 1110*z2^8*z3*z4*z5+ 1109*z2^8*z4^2*z5-
    1110*z2^7*z3*z4^2*z5+ 1109*z2^7*z4^3*z5- 1110*z2^6*z3*z4^3*z5+
    1109*z2^6*z4^4*z5- 1110*z2^5*z3*z4^4*z5+ 1109*z2^5*z4^5*z5-
    1110*z2^4*z3*z4^5*z5+ 1109*z2^4*z4^6*z5- 1110*z2^3*z3*z4^6*z5+
    1109*z2^3*z4^7*z5- 1110*z2^2*z3*z4^7*z5+ 1109*z2^2*z4^8*z5-
    1110*z2*z3*z4^8*z5+ 1109*z2*z4^9*z5+ 1121*z3*z4^9*z5- 12*z4^10*z5-
    12*z2^10*z6+ 1121*z2^9*z3*z6+ 1109*z2^9*z4*z6- 1110*z2^8*z3*z4*z6+
    1109*z2^8*z4^2*z6- 1110*z2^7*z3*z4^2*z6+ 1109*z2^7*z4^3*z6-
    1110*z2^6*z3*z4^3*z6+ 1109*z2^6*z4^4*z6- 1110*z2^5*z3*z4^4*z6+
    1109*z2^5*z4^5*z6- 1110*z2^4*z3*z4^5*z6+ 1109*z2^4*z4^6*z6-
    1110*z2^3*z3*z4^6*z6+ 1109*z2^3*z4^7*z6- 1110*z2^2*z3*z4^7*z6+
    1109*z2^2*z4^8*z6- 1110*z2*z3*z4^8*z6+ 1109*z2*z4^9*z6+ 1121*z3*z4^9*z6-
    12*z4^10*z6+ 1121*z2^9*z5*z6- 2231*z2^8*z3*z5*z6- 1110*z2^8*z4*z5*z6+
    1132*z2^7*z3*z4*z5*z6- 1110*z2^7*z4^2*z5*z6+ 1132*z2^6*z3*z4^2*z5*z6-
    1110*z2^6*z4^3*z5*z6+ 1132*z2^5*z3*z4^3*z5*z6- 1110*z2^5*z4^4*z5*z6+
    1132*z2^4*z3*z4^4*z5*z6- 1110*z2^4*z4^5*z5*z6+ 1132*z2^3*z3*z4^5*z5*z6-
    1110*z2^3*z4^6*z5*z6+ 1132*z2^2*z3*z4^6*z5*z6- 1110*z2^2*z4^7*z5*z6+
    1132*z2*z3*z4^7*z5*z6- 1110*z2*z4^8*z5*z6- 2231*z3*z4^8*z5*z6+
    1121*z4^9*z5*z6- 12*z2^10*z7+ 1121*z2^9*z3*z7+ 1109*z2^9*z4*z7-
    1110*z2^8*z3*z4*z7+ 1109*z2^8*z4^2*z7- 1110*z2^7*z3*z4^2*z7+
    1109*z2^7*z4^3*z7- 1110*z2^6*z3*z4^3*z7+ 1109*z2^6*z4^4*z7-
    1110*z2^5*z3*z4^4*z7+ 1109*z2^5*z4^5*z7- 1110*z2^4*z3*z4^5*z7+
    1109*z2^4*z4^6*z7- 1110*z2^3*z3*z4^6*z7+ 1109*z2^3*z4^7*z7-
    1110*z2^2*z3*z4^7*z7+ 1109*z2^2*z4^8*z7- 1110*z2*z3*z4^8*z7+ 1109*z2*z4^9*z7+
    1121*z3*z4^9*z7- 12*z4^10*z7+ 1121*z2^9*z5*z7- 2231*z2^8*z3*z5*z7-
    1110*z2^8*z4*z5*z7+ 1132*z2^7*z3*z4*z5*z7- 1110*z2^7*z4^2*z5*z7+
    1132*z2^6*z3*z4^2*z5*z7- 1110*z2^6*z4^3*z5*z7+ 1132*z2^5*z3*z4^3*z5*z7-
    1110*z2^5*z4^4*z5*z7+ 1132*z2^4*z3*z4^4*z5*z7- 1110*z2^4*z4^5*z5*z7+
    1132*z2^3*z3*z4^5*z5*z7- 1110*z2^3*z4^6*z5*z7+ 1132*z2^2*z3*z4^6*z5*z7-
    1110*z2^2*z4^7*z5*z7+ 1132*z2*z3*z4^7*z5*z7- 1110*z2*z4^8*z5*z7-
    2231*z3*z4^8*z5*z7+ 1121*z4^9*z5*z7+ 1121*z2^9*z6*z7- 2231*z2^8*z3*z6*z7-
    1110*z2^8*z4*z6*z7+ 1132*z2^7*z3*z4*z6*z7- 1110*z2^7*z4^2*z6*z7+
    1132*z2^6*z3*z4^2*z6*z7- 1110*z2^6*z4^3*z6*z7+ 1132*z2^5*z3*z4^3*z6*z7-
    1110*z2^5*z4^4*z6*z7+ 1132*z2^4*z3*z4^4*z6*z7- 1110*z2^4*z4^5*z6*z7+
    1132*z2^3*z3*z4^5*z6*z7- 1110*z2^3*z4^6*z6*z7+ 1132*z2^2*z3*z4^6*z6*z7-
    1110*z2^2*z4^7*z6*z7+ 1132*z2*z3*z4^7*z6*z7- 1110*z2*z4^8*z6*z7-
    2231*z3*z4^8*z6*z7+ 1121*z4^9*z6*z7- 2231*z2^8*z5*z6*z7+
    3363*z2^7*z3*z5*z6*z7+ 1132*z2^7*z4*z5*z6*z7- 1187*z2^6*z3*z4*z5*z6*z7+
    1132*z2^6*z4^2*z5*z6*z7- 1187*z2^5*z3*z4^2*z5*z6*z7+ 1132*z2^5*z4^3*z5*z6*z7-
    1187*z2^4*z3*z4^3*z5*z6*z7+ 1132*z2^4*z4^4*z5*z6*z7-
    1187*z2^3*z3*z4^4*z5*z6*z7+ 1132*z2^3*z4^5*z5*z6*z7-
    1187*z2^2*z3*z4^5*z5*z6*z7+ 1132*z2^2*z4^6*z5*z6*z7- 1187*z2*z3*z4^6*z5*z6*z7+
    1132*z2*z4^7*z5*z6*z7+ 3363*z3*z4^7*z5*z6*z7- 2231*z4^8*z5*z6*z7+ 2264*z2^9-
    3374*z2^8*z3- 1110*z2^8*z4- 11*z2^7*z3*z4- 1110*z2^7*z4^2- 11*z2^6*z3*z4^2-
    1110*z2^6*z4^3- 11*z2^5*z3*z4^3- 1110*z2^5*z4^4- 11*z2^4*z3*z4^4-
    1110*z2^4*z4^5- 11*z2^3*z3*z4^5- 1110*z2^3*z4^6- 11*z2^2*z3*z4^6-
    1110*z2^2*z4^7- 11*z2*z3*z4^7- 1110*z2*z4^8- 3374*z3*z4^8+ 2264*z4^9-
    3374*z2^8*z5+ 3363*z2^7*z3*z5- 11*z2^7*z4*z5+ 2242*z2^6*z3*z4*z5-
    11*z2^6*z4^2*z5+ 2242*z2^5*z3*z4^2*z5- 11*z2^5*z4^3*z5+ 2242*z2^4*z3*z4^3*z5-
    11*z2^4*z4^4*z5+ 2242*z2^3*z3*z4^4*z5- 11*z2^3*z4^5*z5+ 2242*z2^2*z3*z4^5*z5-
    11*z2^2*z4^6*z5+ 2242*z2*z3*z4^6*z5- 11*z2*z4^7*z5+ 3363*z3*z4^7*z5-
    3374*z4^8*z5- 3374*z2^8*z6+ 3363*z2^7*z3*z6- 11*z2^7*z4*z6+
    2242*z2^6*z3*z4*z6- 11*z2^6*z4^2*z6+ 2242*z2^5*z3*z4^2*z6- 11*z2^5*z4^3*z6+
    2242*z2^4*z3*z4^3*z6- 11*z2^4*z4^4*z6+ 2242*z2^3*z3*z4^4*z6- 11*z2^3*z4^5*z6+
    2242*z2^2*z3*z4^5*z6- 11*z2^2*z4^6*z6+ 2242*z2*z3*z4^6*z6- 11*z2*z4^7*z6+
    3363*z3*z4^7*z6- 3374*z4^8*z6+ 3363*z2^7*z5*z6- 1121*z2^6*z3*z5*z6+
    2242*z2^6*z4*z5*z6+ 3396*z2^5*z3*z4*z5*z6+ 2242*z2^5*z4^2*z5*z6+
    3396*z2^4*z3*z4^2*z5*z6+ 2242*z2^4*z4^3*z5*z6+ 3396*z2^3*z3*z4^3*z5*z6+
    2242*z2^3*z4^4*z5*z6+ 3396*z2^2*z3*z4^4*z5*z6+ 2242*z2^2*z4^5*z5*z6+
    3396*z2*z3*z4^5*z5*z6+ 2242*z2*z4^6*z5*z6- 1121*z3*z4^6*z5*z6+
    3363*z4^7*z5*z6- 3374*z2^8*z7+ 3363*z2^7*z3*z7- 11*z2^7*z4*z7+
    2242*z2^6*z3*z4*z7- 11*z2^6*z4^2*z7+ 2242*z2^5*z3*z4^2*z7- 11*z2^5*z4^3*z7+
    2242*z2^4*z3*z4^3*z7- 11*z2^4*z4^4*z7+ 2242*z2^3*z3*z4^4*z7- 11*z2^3*z4^5*z7+
    2242*z2^2*z3*z4^5*z7- 11*z2^2*z4^6*z7+ 2242*z2*z3*z4^6*z7- 11*z2*z4^7*z7+
    3363*z3*z4^7*z7- 3374*z4^8*z7+ 3363*z2^7*z5*z7- 1121*z2^6*z3*z5*z7+
    2242*z2^6*z4*z5*z7+ 3396*z2^5*z3*z4*z5*z7+ 2242*z2^5*z4^2*z5*z7+
    3396*z2^4*z3*z4^2*z5*z7+ 2242*z2^4*z4^3*z5*z7+ 3396*z2^3*z3*z4^3*z5*z7+
    2242*z2^3*z4^4*z5*z7+ 3396*z2^2*z3*z4^4*z5*z7+ 2242*z2^2*z4^5*z5*z7+
    3396*z2*z3*z4^5*z5*z7+ 2242*z2*z4^6*z5*z7- 1121*z3*z4^6*z5*z7+
    3363*z4^7*z5*z7+ 3363*z2^7*z6*z7- 1121*z2^6*z3*z6*z7+ 2242*z2^6*z4*z6*z7+
    3396*z2^5*z3*z4*z6*z7+ 2242*z2^5*z4^2*z6*z7+ 3396*z2^4*z3*z4^2*z6*z7+
    2242*z2^4*z4^3*z6*z7+ 3396*z2^3*z3*z4^3*z6*z7+ 2242*z2^3*z4^4*z6*z7+
    3396*z2^2*z3*z4^4*z6*z7+ 2242*z2^2*z4^5*z6*z7+ 3396*z2*z3*z4^5*z6*z7+
    2242*z2*z4^6*z6*z7- 1121*z3*z4^6*z6*z7+ 3363*z4^7*z6*z7- 1121*z2^6*z5*z6*z7-
    4484*z2^5*z3*z5*z6*z7+ 3396*z2^5*z4*z5*z6*z7+ 1154*z2^4*z3*z4*z5*z6*z7+
    3396*z2^4*z4^2*z5*z6*z7+ 1154*z2^3*z3*z4^2*z5*z6*z7+ 3396*z2^3*z4^3*z5*z6*z7+
    1154*z2^2*z3*z4^3*z5*z6*z7+ 3396*z2^2*z4^4*z5*z6*z7+ 1154*z2*z3*z4^4*z5*z6*z7+
    3396*z2*z4^5*z5*z6*z7- 4484*z3*z4^5*z5*z6*z7- 1121*z4^6*z5*z6*z7+ 2604*z2^7+
    147*z2^6*z3+ 2751*z2^6*z4+ 2887*z2^5*z3*z4+ 2751*z2^5*z4^2+ 2887*z2^4*z3*z4^2+
    2751*z2^4*z4^3+ 2887*z2^3*z3*z4^3+ 2751*z2^3*z4^4+ 2887*z2^2*z3*z4^4+
    2751*z2^2*z4^5+ 2887*z2*z3*z4^5+ 2751*z2*z4^6+ 147*z3*z4^6+ 2604*z4^7+
    147*z2^6*z5+ 2740*z2^5*z3*z5+ 2887*z2^5*z4*z5- 1766*z2^4*z3*z4*z5+
    2887*z2^4*z4^2*z5- 1766*z2^3*z3*z4^2*z5+ 2887*z2^3*z4^3*z5-
    1766*z2^2*z3*z4^3*z5+ 2887*z2^2*z4^4*z5- 1766*z2*z3*z4^4*z5+ 2887*z2*z4^5*z5+
    2740*z3*z4^5*z5+ 147*z4^6*z5+ 147*z2^6*z6+ 2740*z2^5*z3*z6+ 2887*z2^5*z4*z6-
    1766*z2^4*z3*z4*z6+ 2887*z2^4*z4^2*z6- 1766*z2^3*z3*z4^2*z6+
    2887*z2^3*z4^3*z6- 1766*z2^2*z3*z4^3*z6+ 2887*z2^2*z4^4*z6-
    1766*z2*z3*z4^4*z6+ 2887*z2*z4^5*z6+ 2740*z3*z4^5*z6+ 147*z4^6*z6+
    2740*z2^5*z5*z6+ 4495*z2^4*z3*z5*z6- 1766*z2^4*z4*z5*z6-
    2751*z2^3*z3*z4*z5*z6- 1766*z2^3*z4^2*z5*z6- 2751*z2^2*z3*z4^2*z5*z6-
    1766*z2^2*z4^3*z5*z6- 2751*z2*z3*z4^3*z5*z6- 1766*z2*z4^4*z5*z6+
    4495*z3*z4^4*z5*z6+ 2740*z4^5*z5*z6+ 147*z2^6*z7+ 2740*z2^5*z3*z7+
    2887*z2^5*z4*z7- 1766*z2^4*z3*z4*z7+ 2887*z2^4*z4^2*z7- 1766*z2^3*z3*z4^2*z7+
    2887*z2^3*z4^3*z7- 1766*z2^2*z3*z4^3*z7+ 2887*z2^2*z4^4*z7-
    1766*z2*z3*z4^4*z7+ 2887*z2*z4^5*z7+ 2740*z3*z4^5*z7+ 147*z4^6*z7+
    2740*z2^5*z5*z7+ 4495*z2^4*z3*z5*z7- 1766*z2^4*z4*z5*z7-
    2751*z2^3*z3*z4*z5*z7- 1766*z2^3*z4^2*z5*z7- 2751*z2^2*z3*z4^2*z5*z7-
    1766*z2^2*z4^3*z5*z7- 2751*z2*z3*z4^3*z5*z7- 1766*z2*z4^4*z5*z7+
    4495*z3*z4^4*z5*z7+ 2740*z4^5*z5*z7+ 2740*z2^5*z6*z7+ 4495*z2^4*z3*z6*z7-
    1766*z2^4*z4*z6*z7- 2751*z2^3*z3*z4*z6*z7- 1766*z2^3*z4^2*z6*z7-
    2751*z2^2*z3*z4^2*z6*z7- 1766*z2^2*z4^3*z6*z7- 2751*z2*z3*z4^3*z6*z7-
    1766*z2*z4^4*z6*z7+ 4495*z3*z4^4*z6*z7+ 2740*z4^5*z6*z7+ 4495*z2^4*z5*z6*z7+
    1755*z2^3*z3*z5*z6*z7- 2751*z2^3*z4*z5*z6*z7- 2887*z2^2*z3*z4*z5*z6*z7-
    2751*z2^2*z4^2*z5*z6*z7- 2887*z2*z3*z4^2*z5*z6*z7- 2751*z2*z4^3*z5*z6*z7+
    1755*z3*z4^3*z5*z6*z7+ 4495*z4^4*z5*z6*z7+ 2037*z2^5+ 318*z2^4*z3+
    2355*z2^4*z4+ 3906*z2^3*z3*z4+ 2355*z2^3*z4^2+ 3906*z2^2*z3*z4^2+
    2355*z2^2*z4^3+ 3906*z2*z3*z4^3+ 2355*z2*z4^4+ 318*z3*z4^4+ 2037*z4^5+
    318*z2^4*z5+ 3588*z2^3*z3*z5+ 3906*z2^3*z4*z5+ 600*z2^2*z3*z4*z5+
    3906*z2^2*z4^2*z5+ 600*z2*z3*z4^2*z5+ 3906*z2*z4^3*z5+ 3588*z3*z4^3*z5+
    318*z4^4*z5+ 318*z2^4*z6+ 3588*z2^3*z3*z6+ 3906*z2^3*z4*z6+ 600*z2^2*z3*z4*z6+
    3906*z2^2*z4^2*z6+ 600*z2*z3*z4^2*z6+ 3906*z2*z4^3*z6+ 3588*z3*z4^3*z6+
    318*z4^4*z6+ 3588*z2^3*z5*z6- 2988*z2^2*z3*z5*z6+ 600*z2^2*z4*z5*z6-
    2355*z2*z3*z4*z5*z6+ 600*z2*z4^2*z5*z6- 2988*z3*z4^2*z5*z6+ 3588*z4^3*z5*z6+
    318*z2^4*z7+ 3588*z2^3*z3*z7+ 3906*z2^3*z4*z7+ 600*z2^2*z3*z4*z7+
    3906*z2^2*z4^2*z7+ 600*z2*z3*z4^2*z7+ 3906*z2*z4^3*z7+ 3588*z3*z4^3*z7+
    318*z4^4*z7+ 3588*z2^3*z5*z7- 2988*z2^2*z3*z5*z7+ 600*z2^2*z4*z5*z7-
    2355*z2*z3*z4*z5*z7+ 600*z2*z4^2*z5*z7- 2988*z3*z4^2*z5*z7+ 3588*z4^3*z5*z7+
    3588*z2^3*z6*z7- 2988*z2^2*z3*z6*z7+ 600*z2^2*z4*z6*z7- 2355*z2*z3*z4*z6*z7+
    600*z2*z4^2*z6*z7- 2988*z3*z4^2*z6*z7+ 3588*z4^3*z6*z7- 2988*z2^2*z5*z6*z7+
    633*z2*z3*z5*z6*z7- 2355*z2*z4*z5*z6*z7+ 633*z3*z4*z5*z6*z7-
    2988*z4^2*z5*z6*z7+ 2166*z2^3- 1776*z2^2*z3+ 390*z2^2*z4- 3978*z2*z3*z4+
    390*z2*z4^2- 1776*z3*z4^2+ 2166*z4^3- 1776*z2^2*z5- 2202*z2*z3*z5-
    3978*z2*z4*z5- 2202*z3*z4*z5- 1776*z4^2*z5- 1776*z2^2*z6- 2202*z2*z3*z6-
    3978*z2*z4*z6- 2202*z3*z4*z6- 1776*z4^2*z6- 2202*z2*z5*z6- 1068*z3*z5*z6-
    2202*z4*z5*z6- 1776*z2^2*z7- 2202*z2*z3*z7- 3978*z2*z4*z7- 2202*z3*z4*z7-
    1776*z4^2*z7- 2202*z2*z5*z7- 1068*z3*z5*z7- 2202*z4*z5*z7- 2202*z2*z6*z7-
    1068*z3*z6*z7- 2202*z4*z6*z7- 1068*z5*z6*z7- 1169*z2+ 3538*z3- 1169*z4+
    3538*z5+ 3538*z6+ 3538*z7, 2*z2^15- 4*z2^14*z3- 4*z2^14*z4+ 6*z2^13*z3*z4-
    2*z2^14*z5+ 2*z2^13*z3*z5+ 2*z2^13*z4*z5- 2*z2^12*z3*z4*z5- 2*z2^13*z5^2+
    2*z2^12*z3*z5^2+ 2*z2^12*z4*z5^2- 2*z2^11*z3*z4*z5^2- 2*z2^12*z5^3+
    2*z2^11*z3*z5^3+ 2*z2^11*z4*z5^3- 2*z2^10*z3*z4*z5^3- 2*z2^11*z5^4+
    2*z2^10*z3*z5^4+ 2*z2^10*z4*z5^4- 2*z2^9*z3*z4*z5^4- 2*z2^10*z5^5+
    2*z2^9*z3*z5^5+ 2*z2^9*z4*z5^5- 2*z2^8*z3*z4*z5^5- 2*z2^9*z5^6+
    2*z2^8*z3*z5^6+ 2*z2^8*z4*z5^6- 2*z2^7*z3*z4*z5^6- 2*z2^8*z5^7+
    2*z2^7*z3*z5^7+ 2*z2^7*z4*z5^7- 2*z2^6*z3*z4*z5^7- 2*z2^7*z5^8+
    2*z2^6*z3*z5^8+ 2*z2^6*z4*z5^8- 2*z2^5*z3*z4*z5^8- 2*z2^6*z5^9+
    2*z2^5*z3*z5^9+ 2*z2^5*z4*z5^9- 2*z2^4*z3*z4*z5^9- 2*z2^5*z5^10+
    2*z2^4*z3*z5^10+ 2*z2^4*z4*z5^10- 2*z2^3*z3*z4*z5^10- 2*z2^4*z5^11+
    2*z2^3*z3*z5^11+ 2*z2^3*z4*z5^11- 2*z2^2*z3*z4*z5^11- 2*z2^3*z5^12+
    2*z2^2*z3*z5^12+ 2*z2^2*z4*z5^12- 2*z2*z3*z4*z5^12- 2*z2^2*z5^13+
    2*z2*z3*z5^13+ 2*z2*z4*z5^13+ 6*z3*z4*z5^13- 2*z2*z5^14- 4*z3*z5^14-
    4*z4*z5^14+ 2*z5^15- 4*z2^14*z6+ 6*z2^13*z3*z6+ 6*z2^13*z4*z6-
    8*z2^12*z3*z4*z6+ 2*z2^13*z5*z6- 2*z2^12*z3*z5*z6- 2*z2^12*z4*z5*z6+
    2*z2^11*z3*z4*z5*z6+ 2*z2^12*z5^2*z6- 2*z2^11*z3*z5^2*z6- 2*z2^11*z4*z5^2*z6+
    2*z2^10*z3*z4*z5^2*z6+ 2*z2^11*z5^3*z6- 2*z2^10*z3*z5^3*z6-
    2*z2^10*z4*z5^3*z6+ 2*z2^9*z3*z4*z5^3*z6+ 2*z2^10*z5^4*z6- 2*z2^9*z3*z5^4*z6-
    2*z2^9*z4*z5^4*z6+ 2*z2^8*z3*z4*z5^4*z6+ 2*z2^9*z5^5*z6- 2*z2^8*z3*z5^5*z6-
    2*z2^8*z4*z5^5*z6+ 2*z2^7*z3*z4*z5^5*z6+ 2*z2^8*z5^6*z6- 2*z2^7*z3*z5^6*z6-
    2*z2^7*z4*z5^6*z6+ 2*z2^6*z3*z4*z5^6*z6+ 2*z2^7*z5^7*z6- 2*z2^6*z3*z5^7*z6-
    2*z2^6*z4*z5^7*z6+ 2*z2^5*z3*z4*z5^7*z6+ 2*z2^6*z5^8*z6- 2*z2^5*z3*z5^8*z6-
    2*z2^5*z4*z5^8*z6+ 2*z2^4*z3*z4*z5^8*z6+ 2*z2^5*z5^9*z6- 2*z2^4*z3*z5^9*z6-
    2*z2^4*z4*z5^9*z6+ 2*z2^3*z3*z4*z5^9*z6+ 2*z2^4*z5^10*z6- 2*z2^3*z3*z5^10*z6-
    2*z2^3*z4*z5^10*z6+ 2*z2^2*z3*z4*z5^10*z6+ 2*z2^3*z5^11*z6-
    2*z2^2*z3*z5^11*z6- 2*z2^2*z4*z5^11*z6+ 2*z2*z3*z4*z5^11*z6+ 2*z2^2*z5^12*z6-
    2*z2*z3*z5^12*z6- 2*z2*z4*z5^12*z6- 8*z3*z4*z5^12*z6+ 2*z2*z5^13*z6+
    6*z3*z5^13*z6+ 6*z4*z5^13*z6- 4*z5^14*z6- 4*z2^14*z7+ 6*z2^13*z3*z7+
    6*z2^13*z4*z7- 8*z2^12*z3*z4*z7+ 2*z2^13*z5*z7- 2*z2^12*z3*z5*z7-
    2*z2^12*z4*z5*z7+ 2*z2^11*z3*z4*z5*z7+ 2*z2^12*z5^2*z7- 2*z2^11*z3*z5^2*z7-
    2*z2^11*z4*z5^2*z7+ 2*z2^10*z3*z4*z5^2*z7+ 2*z2^11*z5^3*z7-
    2*z2^10*z3*z5^3*z7- 2*z2^10*z4*z5^3*z7+ 2*z2^9*z3*z4*z5^3*z7+ 2*z2^10*z5^4*z7-
    2*z2^9*z3*z5^4*z7- 2*z2^9*z4*z5^4*z7+ 2*z2^8*z3*z4*z5^4*z7+ 2*z2^9*z5^5*z7-
    2*z2^8*z3*z5^5*z7- 2*z2^8*z4*z5^5*z7+ 2*z2^7*z3*z4*z5^5*z7+ 2*z2^8*z5^6*z7-
    2*z2^7*z3*z5^6*z7- 2*z2^7*z4*z5^6*z7+ 2*z2^6*z3*z4*z5^6*z7+ 2*z2^7*z5^7*z7-
    2*z2^6*z3*z5^7*z7- 2*z2^6*z4*z5^7*z7+ 2*z2^5*z3*z4*z5^7*z7+ 2*z2^6*z5^8*z7-
    2*z2^5*z3*z5^8*z7- 2*z2^5*z4*z5^8*z7+ 2*z2^4*z3*z4*z5^8*z7+ 2*z2^5*z5^9*z7-
    2*z2^4*z3*z5^9*z7- 2*z2^4*z4*z5^9*z7+ 2*z2^3*z3*z4*z5^9*z7+ 2*z2^4*z5^10*z7-
    2*z2^3*z3*z5^10*z7- 2*z2^3*z4*z5^10*z7+ 2*z2^2*z3*z4*z5^10*z7+
    2*z2^3*z5^11*z7- 2*z2^2*z3*z5^11*z7- 2*z2^2*z4*z5^11*z7+ 2*z2*z3*z4*z5^11*z7+
    2*z2^2*z5^12*z7- 2*z2*z3*z5^12*z7- 2*z2*z4*z5^12*z7- 8*z3*z4*z5^12*z7+
    2*z2*z5^13*z7+ 6*z3*z5^13*z7+ 6*z4*z5^13*z7- 4*z5^14*z7+ 6*z2^13*z6*z7-
    8*z2^12*z3*z6*z7- 8*z2^12*z4*z6*z7+ 10*z2^11*z3*z4*z6*z7- 2*z2^12*z5*z6*z7+
    2*z2^11*z3*z5*z6*z7+ 2*z2^11*z4*z5*z6*z7- 2*z2^10*z3*z4*z5*z6*z7-
    2*z2^11*z5^2*z6*z7+ 2*z2^10*z3*z5^2*z6*z7+ 2*z2^10*z4*z5^2*z6*z7-
    2*z2^9*z3*z4*z5^2*z6*z7- 2*z2^10*z5^3*z6*z7+ 2*z2^9*z3*z5^3*z6*z7+
    2*z2^9*z4*z5^3*z6*z7- 2*z2^8*z3*z4*z5^3*z6*z7- 2*z2^9*z5^4*z6*z7+
    2*z2^8*z3*z5^4*z6*z7+ 2*z2^8*z4*z5^4*z6*z7- 2*z2^7*z3*z4*z5^4*z6*z7-
    2*z2^8*z5^5*z6*z7+ 2*z2^7*z3*z5^5*z6*z7+ 2*z2^7*z4*z5^5*z6*z7-
    2*z2^6*z3*z4*z5^5*z6*z7- 2*z2^7*z5^6*z6*z7+ 2*z2^6*z3*z5^6*z6*z7+
    2*z2^6*z4*z5^6*z6*z7- 2*z2^5*z3*z4*z5^6*z6*z7- 2*z2^6*z5^7*z6*z7+
    2*z2^5*z3*z5^7*z6*z7+ 2*z2^5*z4*z5^7*z6*z7- 2*z2^4*z3*z4*z5^7*z6*z7-
    2*z2^5*z5^8*z6*z7+ 2*z2^4*z3*z5^8*z6*z7+ 2*z2^4*z4*z5^8*z6*z7-
    2*z2^3*z3*z4*z5^8*z6*z7- 2*z2^4*z5^9*z6*z7+ 2*z2^3*z3*z5^9*z6*z7+
    2*z2^3*z4*z5^9*z6*z7- 2*z2^2*z3*z4*z5^9*z6*z7- 2*z2^3*z5^10*z6*z7+
    2*z2^2*z3*z5^10*z6*z7+ 2*z2^2*z4*z5^10*z6*z7- 2*z2*z3*z4*z5^10*z6*z7-
    2*z2^2*z5^11*z6*z7+ 2*z2*z3*z5^11*z6*z7+ 2*z2*z4*z5^11*z6*z7+
    10*z3*z4*z5^11*z6*z7- 2*z2*z5^12*z6*z7- 8*z3*z5^12*z6*z7- 8*z4*z5^12*z6*z7+
    6*z5^13*z6*z7+ 10*z2^13- 13*z2^12*z3- 13*z2^12*z4+ 10*z2^11*z3*z4- 3*z2^12*z5-
    3*z2^11*z3*z5- 3*z2^11*z4*z5+ 11*z2^10*z3*z4*z5- 3*z2^11*z5^2-
    3*z2^10*z3*z5^2- 3*z2^10*z4*z5^2+ 11*z2^9*z3*z4*z5^2- 3*z2^10*z5^3-
    3*z2^9*z3*z5^3- 3*z2^9*z4*z5^3+ 11*z2^8*z3*z4*z5^3- 3*z2^9*z5^4-
    3*z2^8*z3*z5^4- 3*z2^8*z4*z5^4+ 11*z2^7*z3*z4*z5^4- 3*z2^8*z5^5-
    3*z2^7*z3*z5^5- 3*z2^7*z4*z5^5+ 11*z2^6*z3*z4*z5^5- 3*z2^7*z5^6-
    3*z2^6*z3*z5^6- 3*z2^6*z4*z5^6+ 11*z2^5*z3*z4*z5^6- 3*z2^6*z5^7-
    3*z2^5*z3*z5^7- 3*z2^5*z4*z5^7+ 11*z2^4*z3*z4*z5^7- 3*z2^5*z5^8-
    3*z2^4*z3*z5^8- 3*z2^4*z4*z5^8+ 11*z2^3*z3*z4*z5^8- 3*z2^4*z5^9-
    3*z2^3*z3*z5^9- 3*z2^3*z4*z5^9+ 11*z2^2*z3*z4*z5^9- 3*z2^3*z5^10-
    3*z2^2*z3*z5^10- 3*z2^2*z4*z5^10+ 11*z2*z3*z4*z5^10- 3*z2^2*z5^11-
    3*z2*z3*z5^11- 3*z2*z4*z5^11+ 10*z3*z4*z5^11- 3*z2*z5^12- 13*z3*z5^12-
    13*z4*z5^12+ 10*z5^13- 13*z2^12*z6+ 10*z2^11*z3*z6+ 10*z2^11*z4*z6+
    z2^10*z3*z4*z6- 3*z2^11*z5*z6+ 11*z2^10*z3*z5*z6+ 11*z2^10*z4*z5*z6-
    21*z2^9*z3*z4*z5*z6- 3*z2^10*z5^2*z6+ 11*z2^9*z3*z5^2*z6+ 11*z2^9*z4*z5^2*z6-
    21*z2^8*z3*z4*z5^2*z6- 3*z2^9*z5^3*z6+ 11*z2^8*z3*z5^3*z6+ 11*z2^8*z4*z5^3*z6-
    21*z2^7*z3*z4*z5^3*z6- 3*z2^8*z5^4*z6+ 11*z2^7*z3*z5^4*z6+ 11*z2^7*z4*z5^4*z6-
    21*z2^6*z3*z4*z5^4*z6- 3*z2^7*z5^5*z6+ 11*z2^6*z3*z5^5*z6+ 11*z2^6*z4*z5^5*z6-
    21*z2^5*z3*z4*z5^5*z6- 3*z2^6*z5^6*z6+ 11*z2^5*z3*z5^6*z6+ 11*z2^5*z4*z5^6*z6-
    21*z2^4*z3*z4*z5^6*z6- 3*z2^5*z5^7*z6+ 11*z2^4*z3*z5^7*z6+ 11*z2^4*z4*z5^7*z6-
    21*z2^3*z3*z4*z5^7*z6- 3*z2^4*z5^8*z6+ 11*z2^3*z3*z5^8*z6+ 11*z2^3*z4*z5^8*z6-
    21*z2^2*z3*z4*z5^8*z6- 3*z2^3*z5^9*z6+ 11*z2^2*z3*z5^9*z6+ 11*z2^2*z4*z5^9*z6-
    21*z2*z3*z4*z5^9*z6- 3*z2^2*z5^10*z6+ 11*z2*z3*z5^10*z6+ 11*z2*z4*z5^10*z6+
    z3*z4*z5^10*z6- 3*z2*z5^11*z6+ 10*z3*z5^11*z6+ 10*z4*z5^11*z6- 13*z5^12*z6-
    13*z2^12*z7+ 10*z2^11*z3*z7+ 10*z2^11*z4*z7+ z2^10*z3*z4*z7- 3*z2^11*z5*z7+
    11*z2^10*z3*z5*z7+ 11*z2^10*z4*z5*z7- 21*z2^9*z3*z4*z5*z7- 3*z2^10*z5^2*z7+
    11*z2^9*z3*z5^2*z7+ 11*z2^9*z4*z5^2*z7- 21*z2^8*z3*z4*z5^2*z7- 3*z2^9*z5^3*z7+
    11*z2^8*z3*z5^3*z7+ 11*z2^8*z4*z5^3*z7- 21*z2^7*z3*z4*z5^3*z7- 3*z2^8*z5^4*z7+
    11*z2^7*z3*z5^4*z7+ 11*z2^7*z4*z5^4*z7- 21*z2^6*z3*z4*z5^4*z7- 3*z2^7*z5^5*z7+
    11*z2^6*z3*z5^5*z7+ 11*z2^6*z4*z5^5*z7- 21*z2^5*z3*z4*z5^5*z7- 3*z2^6*z5^6*z7+
    11*z2^5*z3*z5^6*z7+ 11*z2^5*z4*z5^6*z7- 21*z2^4*z3*z4*z5^6*z7- 3*z2^5*z5^7*z7+
    11*z2^4*z3*z5^7*z7+ 11*z2^4*z4*z5^7*z7- 21*z2^3*z3*z4*z5^7*z7- 3*z2^4*z5^8*z7+
    11*z2^3*z3*z5^8*z7+ 11*z2^3*z4*z5^8*z7- 21*z2^2*z3*z4*z5^8*z7- 3*z2^3*z5^9*z7+
    11*z2^2*z3*z5^9*z7+ 11*z2^2*z4*z5^9*z7- 21*z2*z3*z4*z5^9*z7- 3*z2^2*z5^10*z7+
    11*z2*z3*z5^10*z7+ 11*z2*z4*z5^10*z7+ z3*z4*z5^10*z7- 3*z2*z5^11*z7+
    10*z3*z5^11*z7+ 10*z4*z5^11*z7- 13*z5^12*z7+ 10*z2^11*z6*z7+ z2^10*z3*z6*z7+
    z2^10*z4*z6*z7- 22*z2^9*z3*z4*z6*z7+ 11*z2^10*z5*z6*z7- 21*z2^9*z3*z5*z6*z7-
    21*z2^9*z4*z5*z6*z7+ 33*z2^8*z3*z4*z5*z6*z7+ 11*z2^9*z5^2*z6*z7-
    21*z2^8*z3*z5^2*z6*z7- 21*z2^8*z4*z5^2*z6*z7+ 33*z2^7*z3*z4*z5^2*z6*z7+
    11*z2^8*z5^3*z6*z7- 21*z2^7*z3*z5^3*z6*z7- 21*z2^7*z4*z5^3*z6*z7+
    33*z2^6*z3*z4*z5^3*z6*z7+ 11*z2^7*z5^4*z6*z7- 21*z2^6*z3*z5^4*z6*z7-
    21*z2^6*z4*z5^4*z6*z7+ 33*z2^5*z3*z4*z5^4*z6*z7+ 11*z2^6*z5^5*z6*z7-
    21*z2^5*z3*z5^5*z6*z7- 21*z2^5*z4*z5^5*z6*z7+ 33*z2^4*z3*z4*z5^5*z6*z7+
    11*z2^5*z5^6*z6*z7- 21*z2^4*z3*z5^6*z6*z7- 21*z2^4*z4*z5^6*z6*z7+
    33*z2^3*z3*z4*z5^6*z6*z7+ 11*z2^4*z5^7*z6*z7- 21*z2^3*z3*z5^7*z6*z7-
    21*z2^3*z4*z5^7*z6*z7+ 33*z2^2*z3*z4*z5^7*z6*z7+ 11*z2^3*z5^8*z6*z7-
    21*z2^2*z3*z5^8*z6*z7- 21*z2^2*z4*z5^8*z6*z7+ 33*z2*z3*z4*z5^8*z6*z7+
    11*z2^2*z5^9*z6*z7- 21*z2*z3*z5^9*z6*z7- 21*z2*z4*z5^9*z6*z7-
    22*z3*z4*z5^9*z6*z7+ 11*z2*z5^10*z6*z7+ z3*z5^10*z6*z7+ z4*z5^10*z6*z7+
    10*z5^11*z6*z7- 1107*z2^11- 12*z2^10*z3- 12*z2^10*z4+ 1121*z2^9*z3*z4-
    1119*z2^10*z5+ 1109*z2^9*z3*z5+ 1109*z2^9*z4*z5- 1110*z2^8*z3*z4*z5-
    1119*z2^9*z5^2+ 1109*z2^8*z3*z5^2+ 1109*z2^8*z4*z5^2- 1110*z2^7*z3*z4*z5^2-
    1119*z2^8*z5^3+ 1109*z2^7*z3*z5^3+ 1109*z2^7*z4*z5^3- 1110*z2^6*z3*z4*z5^3-
    1119*z2^7*z5^4+ 1109*z2^6*z3*z5^4+ 1109*z2^6*z4*z5^4- 1110*z2^5*z3*z4*z5^4-
    1119*z2^6*z5^5+ 1109*z2^5*z3*z5^5+ 1109*z2^5*z4*z5^5- 1110*z2^4*z3*z4*z5^5-
    1119*z2^5*z5^6+ 1109*z2^4*z3*z5^6+ 1109*z2^4*z4*z5^6- 1110*z2^3*z3*z4*z5^6-
    1119*z2^4*z5^7+ 1109*z2^3*z3*z5^7+ 1109*z2^3*z4*z5^7- 1110*z2^2*z3*z4*z5^7-
    1119*z2^3*z5^8+ 1109*z2^2*z3*z5^8+ 1109*z2^2*z4*z5^8- 1110*z2*z3*z4*z5^8-
    1119*z2^2*z5^9+ 1109*z2*z3*z5^9+ 1109*z2*z4*z5^9+ 1121*z3*z4*z5^9-
    1119*z2*z5^10- 12*z3*z5^10- 12*z4*z5^10- 1107*z5^11- 12*z2^10*z6+
    1121*z2^9*z3*z6+ 1121*z2^9*z4*z6- 2231*z2^8*z3*z4*z6+ 1109*z2^9*z5*z6-
    1110*z2^8*z3*z5*z6- 1110*z2^8*z4*z5*z6+ 1132*z2^7*z3*z4*z5*z6+
    1109*z2^8*z5^2*z6- 1110*z2^7*z3*z5^2*z6- 1110*z2^7*z4*z5^2*z6+
    1132*z2^6*z3*z4*z5^2*z6+ 1109*z2^7*z5^3*z6- 1110*z2^6*z3*z5^3*z6-
    1110*z2^6*z4*z5^3*z6+ 1132*z2^5*z3*z4*z5^3*z6+ 1109*z2^6*z5^4*z6-
    1110*z2^5*z3*z5^4*z6- 1110*z2^5*z4*z5^4*z6+ 1132*z2^4*z3*z4*z5^4*z6+
    1109*z2^5*z5^5*z6- 1110*z2^4*z3*z5^5*z6- 1110*z2^4*z4*z5^5*z6+
    1132*z2^3*z3*z4*z5^5*z6+ 1109*z2^4*z5^6*z6- 1110*z2^3*z3*z5^6*z6-
    1110*z2^3*z4*z5^6*z6+ 1132*z2^2*z3*z4*z5^6*z6+ 1109*z2^3*z5^7*z6-
    1110*z2^2*z3*z5^7*z6- 1110*z2^2*z4*z5^7*z6+ 1132*z2*z3*z4*z5^7*z6+
    1109*z2^2*z5^8*z6- 1110*z2*z3*z5^8*z6- 1110*z2*z4*z5^8*z6- 2231*z3*z4*z5^8*z6+
    1109*z2*z5^9*z6+ 1121*z3*z5^9*z6+ 1121*z4*z5^9*z6- 12*z5^10*z6- 12*z2^10*z7+
    1121*z2^9*z3*z7+ 1121*z2^9*z4*z7- 2231*z2^8*z3*z4*z7+ 1109*z2^9*z5*z7-
    1110*z2^8*z3*z5*z7- 1110*z2^8*z4*z5*z7+ 1132*z2^7*z3*z4*z5*z7+
    1109*z2^8*z5^2*z7- 1110*z2^7*z3*z5^2*z7- 1110*z2^7*z4*z5^2*z7+
    1132*z2^6*z3*z4*z5^2*z7+ 1109*z2^7*z5^3*z7- 1110*z2^6*z3*z5^3*z7-
    1110*z2^6*z4*z5^3*z7+ 1132*z2^5*z3*z4*z5^3*z7+ 1109*z2^6*z5^4*z7-
    1110*z2^5*z3*z5^4*z7- 1110*z2^5*z4*z5^4*z7+ 1132*z2^4*z3*z4*z5^4*z7+
    1109*z2^5*z5^5*z7- 1110*z2^4*z3*z5^5*z7- 1110*z2^4*z4*z5^5*z7+
    1132*z2^3*z3*z4*z5^5*z7+ 1109*z2^4*z5^6*z7- 1110*z2^3*z3*z5^6*z7-
    1110*z2^3*z4*z5^6*z7+ 1132*z2^2*z3*z4*z5^6*z7+ 1109*z2^3*z5^7*z7-
    1110*z2^2*z3*z5^7*z7- 1110*z2^2*z4*z5^7*z7+ 1132*z2*z3*z4*z5^7*z7+
    1109*z2^2*z5^8*z7- 1110*z2*z3*z5^8*z7- 1110*z2*z4*z5^8*z7- 2231*z3*z4*z5^8*z7+
    1109*z2*z5^9*z7+ 1121*z3*z5^9*z7+ 1121*z4*z5^9*z7- 12*z5^10*z7+
    1121*z2^9*z6*z7- 2231*z2^8*z3*z6*z7- 2231*z2^8*z4*z6*z7+
    3363*z2^7*z3*z4*z6*z7- 1110*z2^8*z5*z6*z7+ 1132*z2^7*z3*z5*z6*z7+
    1132*z2^7*z4*z5*z6*z7- 1187*z2^6*z3*z4*z5*z6*z7- 1110*z2^7*z5^2*z6*z7+
    1132*z2^6*z3*z5^2*z6*z7+ 1132*z2^6*z4*z5^2*z6*z7- 1187*z2^5*z3*z4*z5^2*z6*z7-
    1110*z2^6*z5^3*z6*z7+ 1132*z2^5*z3*z5^3*z6*z7+ 1132*z2^5*z4*z5^3*z6*z7-
    1187*z2^4*z3*z4*z5^3*z6*z7- 1110*z2^5*z5^4*z6*z7+ 1132*z2^4*z3*z5^4*z6*z7+
    1132*z2^4*z4*z5^4*z6*z7- 1187*z2^3*z3*z4*z5^4*z6*z7- 1110*z2^4*z5^5*z6*z7+
    1132*z2^3*z3*z5^5*z6*z7+ 1132*z2^3*z4*z5^5*z6*z7- 1187*z2^2*z3*z4*z5^5*z6*z7-
    1110*z2^3*z5^6*z6*z7+ 1132*z2^2*z3*z5^6*z6*z7+ 1132*z2^2*z4*z5^6*z6*z7-
    1187*z2*z3*z4*z5^6*z6*z7- 1110*z2^2*z5^7*z6*z7+ 1132*z2*z3*z5^7*z6*z7+
    1132*z2*z4*z5^7*z6*z7+ 3363*z3*z4*z5^7*z6*z7- 1110*z2*z5^8*z6*z7-
    2231*z3*z5^8*z6*z7- 2231*z4*z5^8*z6*z7+ 1121*z5^9*z6*z7+ 2264*z2^9-
    3374*z2^8*z3- 3374*z2^8*z4+ 3363*z2^7*z3*z4- 1110*z2^8*z5- 11*z2^7*z3*z5-
    11*z2^7*z4*z5+ 2242*z2^6*z3*z4*z5- 1110*z2^7*z5^2- 11*z2^6*z3*z5^2-
    11*z2^6*z4*z5^2+ 2242*z2^5*z3*z4*z5^2- 1110*z2^6*z5^3- 11*z2^5*z3*z5^3-
    11*z2^5*z4*z5^3+ 2242*z2^4*z3*z4*z5^3- 1110*z2^5*z5^4- 11*z2^4*z3*z5^4-
    11*z2^4*z4*z5^4+ 2242*z2^3*z3*z4*z5^4- 1110*z2^4*z5^5- 11*z2^3*z3*z5^5-
    11*z2^3*z4*z5^5+ 2242*z2^2*z3*z4*z5^5- 1110*z2^3*z5^6- 11*z2^2*z3*z5^6-
    11*z2^2*z4*z5^6+ 2242*z2*z3*z4*z5^6- 1110*z2^2*z5^7- 11*z2*z3*z5^7-
    11*z2*z4*z5^7+ 3363*z3*z4*z5^7- 1110*z2*z5^8- 3374*z3*z5^8- 3374*z4*z5^8+
    2264*z5^9- 3374*z2^8*z6+ 3363*z2^7*z3*z6+ 3363*z2^7*z4*z6- 1121*z2^6*z3*z4*z6-
    11*z2^7*z5*z6+ 2242*z2^6*z3*z5*z6+ 2242*z2^6*z4*z5*z6+ 3396*z2^5*z3*z4*z5*z6-
    11*z2^6*z5^2*z6+ 2242*z2^5*z3*z5^2*z6+ 2242*z2^5*z4*z5^2*z6+
    3396*z2^4*z3*z4*z5^2*z6- 11*z2^5*z5^3*z6+ 2242*z2^4*z3*z5^3*z6+
    2242*z2^4*z4*z5^3*z6+ 3396*z2^3*z3*z4*z5^3*z6- 11*z2^4*z5^4*z6+
    2242*z2^3*z3*z5^4*z6+ 2242*z2^3*z4*z5^4*z6+ 3396*z2^2*z3*z4*z5^4*z6-
    11*z2^3*z5^5*z6+ 2242*z2^2*z3*z5^5*z6+ 2242*z2^2*z4*z5^5*z6+
    3396*z2*z3*z4*z5^5*z6- 11*z2^2*z5^6*z6+ 2242*z2*z3*z5^6*z6+
    2242*z2*z4*z5^6*z6- 1121*z3*z4*z5^6*z6- 11*z2*z5^7*z6+ 3363*z3*z5^7*z6+
    3363*z4*z5^7*z6- 3374*z5^8*z6- 3374*z2^8*z7+ 3363*z2^7*z3*z7+ 3363*z2^7*z4*z7-
    1121*z2^6*z3*z4*z7- 11*z2^7*z5*z7+ 2242*z2^6*z3*z5*z7+ 2242*z2^6*z4*z5*z7+
    3396*z2^5*z3*z4*z5*z7- 11*z2^6*z5^2*z7+ 2242*z2^5*z3*z5^2*z7+
    2242*z2^5*z4*z5^2*z7+ 3396*z2^4*z3*z4*z5^2*z7- 11*z2^5*z5^3*z7+
    2242*z2^4*z3*z5^3*z7+ 2242*z2^4*z4*z5^3*z7+ 3396*z2^3*z3*z4*z5^3*z7-
    11*z2^4*z5^4*z7+ 2242*z2^3*z3*z5^4*z7+ 2242*z2^3*z4*z5^4*z7+
    3396*z2^2*z3*z4*z5^4*z7- 11*z2^3*z5^5*z7+ 2242*z2^2*z3*z5^5*z7+
    2242*z2^2*z4*z5^5*z7+ 3396*z2*z3*z4*z5^5*z7- 11*z2^2*z5^6*z7+
    2242*z2*z3*z5^6*z7+ 2242*z2*z4*z5^6*z7- 1121*z3*z4*z5^6*z7- 11*z2*z5^7*z7+
    3363*z3*z5^7*z7+ 3363*z4*z5^7*z7- 3374*z5^8*z7+ 3363*z2^7*z6*z7-
    1121*z2^6*z3*z6*z7- 1121*z2^6*z4*z6*z7- 4484*z2^5*z3*z4*z6*z7+
    2242*z2^6*z5*z6*z7+ 3396*z2^5*z3*z5*z6*z7+ 3396*z2^5*z4*z5*z6*z7+
    1154*z2^4*z3*z4*z5*z6*z7+ 2242*z2^5*z5^2*z6*z7+ 3396*z2^4*z3*z5^2*z6*z7+
    3396*z2^4*z4*z5^2*z6*z7+ 1154*z2^3*z3*z4*z5^2*z6*z7+ 2242*z2^4*z5^3*z6*z7+
    3396*z2^3*z3*z5^3*z6*z7+ 3396*z2^3*z4*z5^3*z6*z7+ 1154*z2^2*z3*z4*z5^3*z6*z7+
    2242*z2^3*z5^4*z6*z7+ 3396*z2^2*z3*z5^4*z6*z7+ 3396*z2^2*z4*z5^4*z6*z7+
    1154*z2*z3*z4*z5^4*z6*z7+ 2242*z2^2*z5^5*z6*z7+ 3396*z2*z3*z5^5*z6*z7+
    3396*z2*z4*z5^5*z6*z7- 4484*z3*z4*z5^5*z6*z7+ 2242*z2*z5^6*z6*z7-
    1121*z3*z5^6*z6*z7- 1121*z4*z5^6*z6*z7+ 3363*z5^7*z6*z7+ 2604*z2^7+
    147*z2^6*z3+ 147*z2^6*z4+ 2740*z2^5*z3*z4+ 2751*z2^6*z5+ 2887*z2^5*z3*z5+
    2887*z2^5*z4*z5- 1766*z2^4*z3*z4*z5+ 2751*z2^5*z5^2+ 2887*z2^4*z3*z5^2+
    2887*z2^4*z4*z5^2- 1766*z2^3*z3*z4*z5^2+ 2751*z2^4*z5^3+ 2887*z2^3*z3*z5^3+
    2887*z2^3*z4*z5^3- 1766*z2^2*z3*z4*z5^3+ 2751*z2^3*z5^4+ 2887*z2^2*z3*z5^4+
    2887*z2^2*z4*z5^4- 1766*z2*z3*z4*z5^4+ 2751*z2^2*z5^5+ 2887*z2*z3*z5^5+
    2887*z2*z4*z5^5+ 2740*z3*z4*z5^5+ 2751*z2*z5^6+ 147*z3*z5^6+ 147*z4*z5^6+
    2604*z5^7+ 147*z2^6*z6+ 2740*z2^5*z3*z6+ 2740*z2^5*z4*z6+ 4495*z2^4*z3*z4*z6+
    2887*z2^5*z5*z6- 1766*z2^4*z3*z5*z6- 1766*z2^4*z4*z5*z6-
    2751*z2^3*z3*z4*z5*z6+ 2887*z2^4*z5^2*z6- 1766*z2^3*z3*z5^2*z6-
    1766*z2^3*z4*z5^2*z6- 2751*z2^2*z3*z4*z5^2*z6+ 2887*z2^3*z5^3*z6-
    1766*z2^2*z3*z5^3*z6- 1766*z2^2*z4*z5^3*z6- 2751*z2*z3*z4*z5^3*z6+
    2887*z2^2*z5^4*z6- 1766*z2*z3*z5^4*z6- 1766*z2*z4*z5^4*z6+ 4495*z3*z4*z5^4*z6+
    2887*z2*z5^5*z6+ 2740*z3*z5^5*z6+ 2740*z4*z5^5*z6+ 147*z5^6*z6+ 147*z2^6*z7+
    2740*z2^5*z3*z7+ 2740*z2^5*z4*z7+ 4495*z2^4*z3*z4*z7+ 2887*z2^5*z5*z7-
    1766*z2^4*z3*z5*z7- 1766*z2^4*z4*z5*z7- 2751*z2^3*z3*z4*z5*z7+
    2887*z2^4*z5^2*z7- 1766*z2^3*z3*z5^2*z7- 1766*z2^3*z4*z5^2*z7-
    2751*z2^2*z3*z4*z5^2*z7+ 2887*z2^3*z5^3*z7- 1766*z2^2*z3*z5^3*z7-
    1766*z2^2*z4*z5^3*z7- 2751*z2*z3*z4*z5^3*z7+ 2887*z2^2*z5^4*z7-
    1766*z2*z3*z5^4*z7- 1766*z2*z4*z5^4*z7+ 4495*z3*z4*z5^4*z7+ 2887*z2*z5^5*z7+
    2740*z3*z5^5*z7+ 2740*z4*z5^5*z7+ 147*z5^6*z7+ 2740*z2^5*z6*z7+
    4495*z2^4*z3*z6*z7+ 4495*z2^4*z4*z6*z7+ 1755*z2^3*z3*z4*z6*z7-
    1766*z2^4*z5*z6*z7- 2751*z2^3*z3*z5*z6*z7- 2751*z2^3*z4*z5*z6*z7-
    2887*z2^2*z3*z4*z5*z6*z7- 1766*z2^3*z5^2*z6*z7- 2751*z2^2*z3*z5^2*z6*z7-
    2751*z2^2*z4*z5^2*z6*z7- 2887*z2*z3*z4*z5^2*z6*z7- 1766*z2^2*z5^3*z6*z7-
    2751*z2*z3*z5^3*z6*z7- 2751*z2*z4*z5^3*z6*z7+ 1755*z3*z4*z5^3*z6*z7-
    1766*z2*z5^4*z6*z7+ 4495*z3*z5^4*z6*z7+ 4495*z4*z5^4*z6*z7+ 2740*z5^5*z6*z7+
    2037*z2^5+ 318*z2^4*z3+ 318*z2^4*z4+ 3588*z2^3*z3*z4+ 2355*z2^4*z5+
    3906*z2^3*z3*z5+ 3906*z2^3*z4*z5+ 600*z2^2*z3*z4*z5+ 2355*z2^3*z5^2+
    3906*z2^2*z3*z5^2+ 3906*z2^2*z4*z5^2+ 600*z2*z3*z4*z5^2+ 2355*z2^2*z5^3+
    3906*z2*z3*z5^3+ 3906*z2*z4*z5^3+ 3588*z3*z4*z5^3+ 2355*z2*z5^4+ 318*z3*z5^4+
    318*z4*z5^4+ 2037*z5^5+ 318*z2^4*z6+ 3588*z2^3*z3*z6+ 3588*z2^3*z4*z6-
    2988*z2^2*z3*z4*z6+ 3906*z2^3*z5*z6+ 600*z2^2*z3*z5*z6+ 600*z2^2*z4*z5*z6-
    2355*z2*z3*z4*z5*z6+ 3906*z2^2*z5^2*z6+ 600*z2*z3*z5^2*z6+ 600*z2*z4*z5^2*z6-
    2988*z3*z4*z5^2*z6+ 3906*z2*z5^3*z6+ 3588*z3*z5^3*z6+ 3588*z4*z5^3*z6+
    318*z5^4*z6+ 318*z2^4*z7+ 3588*z2^3*z3*z7+ 3588*z2^3*z4*z7-
    2988*z2^2*z3*z4*z7+ 3906*z2^3*z5*z7+ 600*z2^2*z3*z5*z7+ 600*z2^2*z4*z5*z7-
    2355*z2*z3*z4*z5*z7+ 3906*z2^2*z5^2*z7+ 600*z2*z3*z5^2*z7+ 600*z2*z4*z5^2*z7-
    2988*z3*z4*z5^2*z7+ 3906*z2*z5^3*z7+ 3588*z3*z5^3*z7+ 3588*z4*z5^3*z7+
    318*z5^4*z7+ 3588*z2^3*z6*z7- 2988*z2^2*z3*z6*z7- 2988*z2^2*z4*z6*z7+
    633*z2*z3*z4*z6*z7+ 600*z2^2*z5*z6*z7- 2355*z2*z3*z5*z6*z7-
    2355*z2*z4*z5*z6*z7+ 633*z3*z4*z5*z6*z7+ 600*z2*z5^2*z6*z7-
    2988*z3*z5^2*z6*z7- 2988*z4*z5^2*z6*z7+ 3588*z5^3*z6*z7+ 2166*z2^3-
    1776*z2^2*z3- 1776*z2^2*z4- 2202*z2*z3*z4+ 390*z2^2*z5- 3978*z2*z3*z5-
    3978*z2*z4*z5- 2202*z3*z4*z5+ 390*z2*z5^2- 1776*z3*z5^2- 1776*z4*z5^2+
    2166*z5^3- 1776*z2^2*z6- 2202*z2*z3*z6- 2202*z2*z4*z6- 1068*z3*z4*z6-
    3978*z2*z5*z6- 2202*z3*z5*z6- 2202*z4*z5*z6- 1776*z5^2*z6- 1776*z2^2*z7-
    2202*z2*z3*z7- 2202*z2*z4*z7- 1068*z3*z4*z7- 3978*z2*z5*z7- 2202*z3*z5*z7-
    2202*z4*z5*z7- 1776*z5^2*z7- 2202*z2*z6*z7- 1068*z3*z6*z7- 1068*z4*z6*z7-
    2202*z5*z6*z7- 1169*z2+ 3538*z3+ 3538*z4- 1169*z5+ 3538*z6+ 3538*z7, 2*z2^15-
    4*z2^14*z3- 4*z2^14*z4+ 6*z2^13*z3*z4- 4*z2^14*z5+ 6*z2^13*z3*z5+
    6*z2^13*z4*z5- 8*z2^12*z3*z4*z5- 2*z2^14*z6+ 2*z2^13*z3*z6+ 2*z2^13*z4*z6-
    2*z2^12*z3*z4*z6+ 2*z2^13*z5*z6- 2*z2^12*z3*z5*z6- 2*z2^12*z4*z5*z6+
    2*z2^11*z3*z4*z5*z6- 2*z2^13*z6^2+ 2*z2^12*z3*z6^2+ 2*z2^12*z4*z6^2-
    2*z2^11*z3*z4*z6^2+ 2*z2^12*z5*z6^2- 2*z2^11*z3*z5*z6^2- 2*z2^11*z4*z5*z6^2+
    2*z2^10*z3*z4*z5*z6^2- 2*z2^12*z6^3+ 2*z2^11*z3*z6^3+ 2*z2^11*z4*z6^3-
    2*z2^10*z3*z4*z6^3+ 2*z2^11*z5*z6^3- 2*z2^10*z3*z5*z6^3- 2*z2^10*z4*z5*z6^3+
    2*z2^9*z3*z4*z5*z6^3- 2*z2^11*z6^4+ 2*z2^10*z3*z6^4+ 2*z2^10*z4*z6^4-
    2*z2^9*z3*z4*z6^4+ 2*z2^10*z5*z6^4- 2*z2^9*z3*z5*z6^4- 2*z2^9*z4*z5*z6^4+
    2*z2^8*z3*z4*z5*z6^4- 2*z2^10*z6^5+ 2*z2^9*z3*z6^5+ 2*z2^9*z4*z6^5-
    2*z2^8*z3*z4*z6^5+ 2*z2^9*z5*z6^5- 2*z2^8*z3*z5*z6^5- 2*z2^8*z4*z5*z6^5+
    2*z2^7*z3*z4*z5*z6^5- 2*z2^9*z6^6+ 2*z2^8*z3*z6^6+ 2*z2^8*z4*z6^6-
    2*z2^7*z3*z4*z6^6+ 2*z2^8*z5*z6^6- 2*z2^7*z3*z5*z6^6- 2*z2^7*z4*z5*z6^6+
    2*z2^6*z3*z4*z5*z6^6- 2*z2^8*z6^7+ 2*z2^7*z3*z6^7+ 2*z2^7*z4*z6^7-
    2*z2^6*z3*z4*z6^7+ 2*z2^7*z5*z6^7- 2*z2^6*z3*z5*z6^7- 2*z2^6*z4*z5*z6^7+
    2*z2^5*z3*z4*z5*z6^7- 2*z2^7*z6^8+ 2*z2^6*z3*z6^8+ 2*z2^6*z4*z6^8-
    2*z2^5*z3*z4*z6^8+ 2*z2^6*z5*z6^8- 2*z2^5*z3*z5*z6^8- 2*z2^5*z4*z5*z6^8+
    2*z2^4*z3*z4*z5*z6^8- 2*z2^6*z6^9+ 2*z2^5*z3*z6^9+ 2*z2^5*z4*z6^9-
    2*z2^4*z3*z4*z6^9+ 2*z2^5*z5*z6^9- 2*z2^4*z3*z5*z6^9- 2*z2^4*z4*z5*z6^9+
    2*z2^3*z3*z4*z5*z6^9- 2*z2^5*z6^10+ 2*z2^4*z3*z6^10+ 2*z2^4*z4*z6^10-
    2*z2^3*z3*z4*z6^10+ 2*z2^4*z5*z6^10- 2*z2^3*z3*z5*z6^10- 2*z2^3*z4*z5*z6^10+
    2*z2^2*z3*z4*z5*z6^10- 2*z2^4*z6^11+ 2*z2^3*z3*z6^11+ 2*z2^3*z4*z6^11-
    2*z2^2*z3*z4*z6^11+ 2*z2^3*z5*z6^11- 2*z2^2*z3*z5*z6^11- 2*z2^2*z4*z5*z6^11+
    2*z2*z3*z4*z5*z6^11- 2*z2^3*z6^12+ 2*z2^2*z3*z6^12+ 2*z2^2*z4*z6^12-
    2*z2*z3*z4*z6^12+ 2*z2^2*z5*z6^12- 2*z2*z3*z5*z6^12- 2*z2*z4*z5*z6^12-
    8*z3*z4*z5*z6^12- 2*z2^2*z6^13+ 2*z2*z3*z6^13+ 2*z2*z4*z6^13+ 6*z3*z4*z6^13+
    2*z2*z5*z6^13+ 6*z3*z5*z6^13+ 6*z4*z5*z6^13- 2*z2*z6^14- 4*z3*z6^14-
    4*z4*z6^14- 4*z5*z6^14+ 2*z6^15- 4*z2^14*z7+ 6*z2^13*z3*z7+ 6*z2^13*z4*z7-
    8*z2^12*z3*z4*z7+ 6*z2^13*z5*z7- 8*z2^12*z3*z5*z7- 8*z2^12*z4*z5*z7+
    10*z2^11*z3*z4*z5*z7+ 2*z2^13*z6*z7- 2*z2^12*z3*z6*z7- 2*z2^12*z4*z6*z7+
    2*z2^11*z3*z4*z6*z7- 2*z2^12*z5*z6*z7+ 2*z2^11*z3*z5*z6*z7+
    2*z2^11*z4*z5*z6*z7- 2*z2^10*z3*z4*z5*z6*z7+ 2*z2^12*z6^2*z7-
    2*z2^11*z3*z6^2*z7- 2*z2^11*z4*z6^2*z7+ 2*z2^10*z3*z4*z6^2*z7-
    2*z2^11*z5*z6^2*z7+ 2*z2^10*z3*z5*z6^2*z7+ 2*z2^10*z4*z5*z6^2*z7-
    2*z2^9*z3*z4*z5*z6^2*z7+ 2*z2^11*z6^3*z7- 2*z2^10*z3*z6^3*z7-
    2*z2^10*z4*z6^3*z7+ 2*z2^9*z3*z4*z6^3*z7- 2*z2^10*z5*z6^3*z7+
    2*z2^9*z3*z5*z6^3*z7+ 2*z2^9*z4*z5*z6^3*z7- 2*z2^8*z3*z4*z5*z6^3*z7+
    2*z2^10*z6^4*z7- 2*z2^9*z3*z6^4*z7- 2*z2^9*z4*z6^4*z7+ 2*z2^8*z3*z4*z6^4*z7-
    2*z2^9*z5*z6^4*z7+ 2*z2^8*z3*z5*z6^4*z7+ 2*z2^8*z4*z5*z6^4*z7-
    2*z2^7*z3*z4*z5*z6^4*z7+ 2*z2^9*z6^5*z7- 2*z2^8*z3*z6^5*z7- 2*z2^8*z4*z6^5*z7+
    2*z2^7*z3*z4*z6^5*z7- 2*z2^8*z5*z6^5*z7+ 2*z2^7*z3*z5*z6^5*z7+
    2*z2^7*z4*z5*z6^5*z7- 2*z2^6*z3*z4*z5*z6^5*z7+ 2*z2^8*z6^6*z7-
    2*z2^7*z3*z6^6*z7- 2*z2^7*z4*z6^6*z7+ 2*z2^6*z3*z4*z6^6*z7- 2*z2^7*z5*z6^6*z7+
    2*z2^6*z3*z5*z6^6*z7+ 2*z2^6*z4*z5*z6^6*z7- 2*z2^5*z3*z4*z5*z6^6*z7+
    2*z2^7*z6^7*z7- 2*z2^6*z3*z6^7*z7- 2*z2^6*z4*z6^7*z7+ 2*z2^5*z3*z4*z6^7*z7-
    2*z2^6*z5*z6^7*z7+ 2*z2^5*z3*z5*z6^7*z7+ 2*z2^5*z4*z5*z6^7*z7-
    2*z2^4*z3*z4*z5*z6^7*z7+ 2*z2^6*z6^8*z7- 2*z2^5*z3*z6^8*z7- 2*z2^5*z4*z6^8*z7+
    2*z2^4*z3*z4*z6^8*z7- 2*z2^5*z5*z6^8*z7+ 2*z2^4*z3*z5*z6^8*z7+
    2*z2^4*z4*z5*z6^8*z7- 2*z2^3*z3*z4*z5*z6^8*z7+ 2*z2^5*z6^9*z7-
    2*z2^4*z3*z6^9*z7- 2*z2^4*z4*z6^9*z7+ 2*z2^3*z3*z4*z6^9*z7- 2*z2^4*z5*z6^9*z7+
    2*z2^3*z3*z5*z6^9*z7+ 2*z2^3*z4*z5*z6^9*z7- 2*z2^2*z3*z4*z5*z6^9*z7+
    2*z2^4*z6^10*z7- 2*z2^3*z3*z6^10*z7- 2*z2^3*z4*z6^10*z7+
    2*z2^2*z3*z4*z6^10*z7- 2*z2^3*z5*z6^10*z7+ 2*z2^2*z3*z5*z6^10*z7+
    2*z2^2*z4*z5*z6^10*z7- 2*z2*z3*z4*z5*z6^10*z7+ 2*z2^3*z6^11*z7-
    2*z2^2*z3*z6^11*z7- 2*z2^2*z4*z6^11*z7+ 2*z2*z3*z4*z6^11*z7-
    2*z2^2*z5*z6^11*z7+ 2*z2*z3*z5*z6^11*z7+ 2*z2*z4*z5*z6^11*z7+
    10*z3*z4*z5*z6^11*z7+ 2*z2^2*z6^12*z7- 2*z2*z3*z6^12*z7- 2*z2*z4*z6^12*z7-
    8*z3*z4*z6^12*z7- 2*z2*z5*z6^12*z7- 8*z3*z5*z6^12*z7- 8*z4*z5*z6^12*z7+
    2*z2*z6^13*z7+ 6*z3*z6^13*z7+ 6*z4*z6^13*z7+ 6*z5*z6^13*z7- 4*z6^14*z7+
    10*z2^13- 13*z2^12*z3- 13*z2^12*z4+ 10*z2^11*z3*z4- 13*z2^12*z5+
    10*z2^11*z3*z5+ 10*z2^11*z4*z5+ z2^10*z3*z4*z5- 3*z2^12*z6- 3*z2^11*z3*z6-
    3*z2^11*z4*z6+ 11*z2^10*z3*z4*z6- 3*z2^11*z5*z6+ 11*z2^10*z3*z5*z6+
    11*z2^10*z4*z5*z6- 21*z2^9*z3*z4*z5*z6- 3*z2^11*z6^2- 3*z2^10*z3*z6^2-
    3*z2^10*z4*z6^2+ 11*z2^9*z3*z4*z6^2- 3*z2^10*z5*z6^2+ 11*z2^9*z3*z5*z6^2+
    11*z2^9*z4*z5*z6^2- 21*z2^8*z3*z4*z5*z6^2- 3*z2^10*z6^3- 3*z2^9*z3*z6^3-
    3*z2^9*z4*z6^3+ 11*z2^8*z3*z4*z6^3- 3*z2^9*z5*z6^3+ 11*z2^8*z3*z5*z6^3+
    11*z2^8*z4*z5*z6^3- 21*z2^7*z3*z4*z5*z6^3- 3*z2^9*z6^4- 3*z2^8*z3*z6^4-
    3*z2^8*z4*z6^4+ 11*z2^7*z3*z4*z6^4- 3*z2^8*z5*z6^4+ 11*z2^7*z3*z5*z6^4+
    11*z2^7*z4*z5*z6^4- 21*z2^6*z3*z4*z5*z6^4- 3*z2^8*z6^5- 3*z2^7*z3*z6^5-
    3*z2^7*z4*z6^5+ 11*z2^6*z3*z4*z6^5- 3*z2^7*z5*z6^5+ 11*z2^6*z3*z5*z6^5+
    11*z2^6*z4*z5*z6^5- 21*z2^5*z3*z4*z5*z6^5- 3*z2^7*z6^6- 3*z2^6*z3*z6^6-
    3*z2^6*z4*z6^6+ 11*z2^5*z3*z4*z6^6- 3*z2^6*z5*z6^6+ 11*z2^5*z3*z5*z6^6+
    11*z2^5*z4*z5*z6^6- 21*z2^4*z3*z4*z5*z6^6- 3*z2^6*z6^7- 3*z2^5*z3*z6^7-
    3*z2^5*z4*z6^7+ 11*z2^4*z3*z4*z6^7- 3*z2^5*z5*z6^7+ 11*z2^4*z3*z5*z6^7+
    11*z2^4*z4*z5*z6^7- 21*z2^3*z3*z4*z5*z6^7- 3*z2^5*z6^8- 3*z2^4*z3*z6^8-
    3*z2^4*z4*z6^8+ 11*z2^3*z3*z4*z6^8- 3*z2^4*z5*z6^8+ 11*z2^3*z3*z5*z6^8+
    11*z2^3*z4*z5*z6^8- 21*z2^2*z3*z4*z5*z6^8- 3*z2^4*z6^9- 3*z2^3*z3*z6^9-
    3*z2^3*z4*z6^9+ 11*z2^2*z3*z4*z6^9- 3*z2^3*z5*z6^9+ 11*z2^2*z3*z5*z6^9+
    11*z2^2*z4*z5*z6^9- 21*z2*z3*z4*z5*z6^9- 3*z2^3*z6^10- 3*z2^2*z3*z6^10-
    3*z2^2*z4*z6^10+ 11*z2*z3*z4*z6^10- 3*z2^2*z5*z6^10+ 11*z2*z3*z5*z6^10+
    11*z2*z4*z5*z6^10+ z3*z4*z5*z6^10- 3*z2^2*z6^11- 3*z2*z3*z6^11- 3*z2*z4*z6^11+
    10*z3*z4*z6^11- 3*z2*z5*z6^11+ 10*z3*z5*z6^11+ 10*z4*z5*z6^11- 3*z2*z6^12-
    13*z3*z6^12- 13*z4*z6^12- 13*z5*z6^12+ 10*z6^13- 13*z2^12*z7+ 10*z2^11*z3*z7+
    10*z2^11*z4*z7+ z2^10*z3*z4*z7+ 10*z2^11*z5*z7+ z2^10*z3*z5*z7+
    z2^10*z4*z5*z7- 22*z2^9*z3*z4*z5*z7- 3*z2^11*z6*z7+ 11*z2^10*z3*z6*z7+
    11*z2^10*z4*z6*z7- 21*z2^9*z3*z4*z6*z7+ 11*z2^10*z5*z6*z7-
    21*z2^9*z3*z5*z6*z7- 21*z2^9*z4*z5*z6*z7+ 33*z2^8*z3*z4*z5*z6*z7-
    3*z2^10*z6^2*z7+ 11*z2^9*z3*z6^2*z7+ 11*z2^9*z4*z6^2*z7-
    21*z2^8*z3*z4*z6^2*z7+ 11*z2^9*z5*z6^2*z7- 21*z2^8*z3*z5*z6^2*z7-
    21*z2^8*z4*z5*z6^2*z7+ 33*z2^7*z3*z4*z5*z6^2*z7- 3*z2^9*z6^3*z7+
    11*z2^8*z3*z6^3*z7+ 11*z2^8*z4*z6^3*z7- 21*z2^7*z3*z4*z6^3*z7+
    11*z2^8*z5*z6^3*z7- 21*z2^7*z3*z5*z6^3*z7- 21*z2^7*z4*z5*z6^3*z7+
    33*z2^6*z3*z4*z5*z6^3*z7- 3*z2^8*z6^4*z7+ 11*z2^7*z3*z6^4*z7+
    11*z2^7*z4*z6^4*z7- 21*z2^6*z3*z4*z6^4*z7+ 11*z2^7*z5*z6^4*z7-
    21*z2^6*z3*z5*z6^4*z7- 21*z2^6*z4*z5*z6^4*z7+ 33*z2^5*z3*z4*z5*z6^4*z7-
    3*z2^7*z6^5*z7+ 11*z2^6*z3*z6^5*z7+ 11*z2^6*z4*z6^5*z7- 21*z2^5*z3*z4*z6^5*z7+
    11*z2^6*z5*z6^5*z7- 21*z2^5*z3*z5*z6^5*z7- 21*z2^5*z4*z5*z6^5*z7+
    33*z2^4*z3*z4*z5*z6^5*z7- 3*z2^6*z6^6*z7+ 11*z2^5*z3*z6^6*z7+
    11*z2^5*z4*z6^6*z7- 21*z2^4*z3*z4*z6^6*z7+ 11*z2^5*z5*z6^6*z7-
    21*z2^4*z3*z5*z6^6*z7- 21*z2^4*z4*z5*z6^6*z7+ 33*z2^3*z3*z4*z5*z6^6*z7-
    3*z2^5*z6^7*z7+ 11*z2^4*z3*z6^7*z7+ 11*z2^4*z4*z6^7*z7- 21*z2^3*z3*z4*z6^7*z7+
    11*z2^4*z5*z6^7*z7- 21*z2^3*z3*z5*z6^7*z7- 21*z2^3*z4*z5*z6^7*z7+
    33*z2^2*z3*z4*z5*z6^7*z7- 3*z2^4*z6^8*z7+ 11*z2^3*z3*z6^8*z7+
    11*z2^3*z4*z6^8*z7- 21*z2^2*z3*z4*z6^8*z7+ 11*z2^3*z5*z6^8*z7-
    21*z2^2*z3*z5*z6^8*z7- 21*z2^2*z4*z5*z6^8*z7+ 33*z2*z3*z4*z5*z6^8*z7-
    3*z2^3*z6^9*z7+ 11*z2^2*z3*z6^9*z7+ 11*z2^2*z4*z6^9*z7- 21*z2*z3*z4*z6^9*z7+
    11*z2^2*z5*z6^9*z7- 21*z2*z3*z5*z6^9*z7- 21*z2*z4*z5*z6^9*z7-
    22*z3*z4*z5*z6^9*z7- 3*z2^2*z6^10*z7+ 11*z2*z3*z6^10*z7+ 11*z2*z4*z6^10*z7+
    z3*z4*z6^10*z7+ 11*z2*z5*z6^10*z7+ z3*z5*z6^10*z7+ z4*z5*z6^10*z7-
    3*z2*z6^11*z7+ 10*z3*z6^11*z7+ 10*z4*z6^11*z7+ 10*z5*z6^11*z7- 13*z6^12*z7-
    1107*z2^11- 12*z2^10*z3- 12*z2^10*z4+ 1121*z2^9*z3*z4- 12*z2^10*z5+
    1121*z2^9*z3*z5+ 1121*z2^9*z4*z5- 2231*z2^8*z3*z4*z5- 1119*z2^10*z6+
    1109*z2^9*z3*z6+ 1109*z2^9*z4*z6- 1110*z2^8*z3*z4*z6+ 1109*z2^9*z5*z6-
    1110*z2^8*z3*z5*z6- 1110*z2^8*z4*z5*z6+ 1132*z2^7*z3*z4*z5*z6- 1119*z2^9*z6^2+
    1109*z2^8*z3*z6^2+ 1109*z2^8*z4*z6^2- 1110*z2^7*z3*z4*z6^2+ 1109*z2^8*z5*z6^2-
    1110*z2^7*z3*z5*z6^2- 1110*z2^7*z4*z5*z6^2+ 1132*z2^6*z3*z4*z5*z6^2-
    1119*z2^8*z6^3+ 1109*z2^7*z3*z6^3+ 1109*z2^7*z4*z6^3- 1110*z2^6*z3*z4*z6^3+
    1109*z2^7*z5*z6^3- 1110*z2^6*z3*z5*z6^3- 1110*z2^6*z4*z5*z6^3+
    1132*z2^5*z3*z4*z5*z6^3- 1119*z2^7*z6^4+ 1109*z2^6*z3*z6^4+ 1109*z2^6*z4*z6^4-
    1110*z2^5*z3*z4*z6^4+ 1109*z2^6*z5*z6^4- 1110*z2^5*z3*z5*z6^4-
    1110*z2^5*z4*z5*z6^4+ 1132*z2^4*z3*z4*z5*z6^4- 1119*z2^6*z6^5+
    1109*z2^5*z3*z6^5+ 1109*z2^5*z4*z6^5- 1110*z2^4*z3*z4*z6^5+ 1109*z2^5*z5*z6^5-
    1110*z2^4*z3*z5*z6^5- 1110*z2^4*z4*z5*z6^5+ 1132*z2^3*z3*z4*z5*z6^5-
    1119*z2^5*z6^6+ 1109*z2^4*z3*z6^6+ 1109*z2^4*z4*z6^6- 1110*z2^3*z3*z4*z6^6+
    1109*z2^4*z5*z6^6- 1110*z2^3*z3*z5*z6^6- 1110*z2^3*z4*z5*z6^6+
    1132*z2^2*z3*z4*z5*z6^6- 1119*z2^4*z6^7+ 1109*z2^3*z3*z6^7+ 1109*z2^3*z4*z6^7-
    1110*z2^2*z3*z4*z6^7+ 1109*z2^3*z5*z6^7- 1110*z2^2*z3*z5*z6^7-
    1110*z2^2*z4*z5*z6^7+ 1132*z2*z3*z4*z5*z6^7- 1119*z2^3*z6^8+
    1109*z2^2*z3*z6^8+ 1109*z2^2*z4*z6^8- 1110*z2*z3*z4*z6^8+ 1109*z2^2*z5*z6^8-
    1110*z2*z3*z5*z6^8- 1110*z2*z4*z5*z6^8- 2231*z3*z4*z5*z6^8- 1119*z2^2*z6^9+
    1109*z2*z3*z6^9+ 1109*z2*z4*z6^9+ 1121*z3*z4*z6^9+ 1109*z2*z5*z6^9+
    1121*z3*z5*z6^9+ 1121*z4*z5*z6^9- 1119*z2*z6^10- 12*z3*z6^10- 12*z4*z6^10-
    12*z5*z6^10- 1107*z6^11- 12*z2^10*z7+ 1121*z2^9*z3*z7+ 1121*z2^9*z4*z7-
    2231*z2^8*z3*z4*z7+ 1121*z2^9*z5*z7- 2231*z2^8*z3*z5*z7- 2231*z2^8*z4*z5*z7+
    3363*z2^7*z3*z4*z5*z7+ 1109*z2^9*z6*z7- 1110*z2^8*z3*z6*z7-
    1110*z2^8*z4*z6*z7+ 1132*z2^7*z3*z4*z6*z7- 1110*z2^8*z5*z6*z7+
    1132*z2^7*z3*z5*z6*z7+ 1132*z2^7*z4*z5*z6*z7- 1187*z2^6*z3*z4*z5*z6*z7+
    1109*z2^8*z6^2*z7- 1110*z2^7*z3*z6^2*z7- 1110*z2^7*z4*z6^2*z7+
    1132*z2^6*z3*z4*z6^2*z7- 1110*z2^7*z5*z6^2*z7+ 1132*z2^6*z3*z5*z6^2*z7+
    1132*z2^6*z4*z5*z6^2*z7- 1187*z2^5*z3*z4*z5*z6^2*z7+ 1109*z2^7*z6^3*z7-
    1110*z2^6*z3*z6^3*z7- 1110*z2^6*z4*z6^3*z7+ 1132*z2^5*z3*z4*z6^3*z7-
    1110*z2^6*z5*z6^3*z7+ 1132*z2^5*z3*z5*z6^3*z7+ 1132*z2^5*z4*z5*z6^3*z7-
    1187*z2^4*z3*z4*z5*z6^3*z7+ 1109*z2^6*z6^4*z7- 1110*z2^5*z3*z6^4*z7-
    1110*z2^5*z4*z6^4*z7+ 1132*z2^4*z3*z4*z6^4*z7- 1110*z2^5*z5*z6^4*z7+
    1132*z2^4*z3*z5*z6^4*z7+ 1132*z2^4*z4*z5*z6^4*z7- 1187*z2^3*z3*z4*z5*z6^4*z7+
    1109*z2^5*z6^5*z7- 1110*z2^4*z3*z6^5*z7- 1110*z2^4*z4*z6^5*z7+
    1132*z2^3*z3*z4*z6^5*z7- 1110*z2^4*z5*z6^5*z7+ 1132*z2^3*z3*z5*z6^5*z7+
    1132*z2^3*z4*z5*z6^5*z7- 1187*z2^2*z3*z4*z5*z6^5*z7+ 1109*z2^4*z6^6*z7-
    1110*z2^3*z3*z6^6*z7- 1110*z2^3*z4*z6^6*z7+ 1132*z2^2*z3*z4*z6^6*z7-
    1110*z2^3*z5*z6^6*z7+ 1132*z2^2*z3*z5*z6^6*z7+ 1132*z2^2*z4*z5*z6^6*z7-
    1187*z2*z3*z4*z5*z6^6*z7+ 1109*z2^3*z6^7*z7- 1110*z2^2*z3*z6^7*z7-
    1110*z2^2*z4*z6^7*z7+ 1132*z2*z3*z4*z6^7*z7- 1110*z2^2*z5*z6^7*z7+
    1132*z2*z3*z5*z6^7*z7+ 1132*z2*z4*z5*z6^7*z7+ 3363*z3*z4*z5*z6^7*z7+
    1109*z2^2*z6^8*z7- 1110*z2*z3*z6^8*z7- 1110*z2*z4*z6^8*z7- 2231*z3*z4*z6^8*z7-
    1110*z2*z5*z6^8*z7- 2231*z3*z5*z6^8*z7- 2231*z4*z5*z6^8*z7+ 1109*z2*z6^9*z7+
    1121*z3*z6^9*z7+ 1121*z4*z6^9*z7+ 1121*z5*z6^9*z7- 12*z6^10*z7+ 2264*z2^9-
    3374*z2^8*z3- 3374*z2^8*z4+ 3363*z2^7*z3*z4- 3374*z2^8*z5+ 3363*z2^7*z3*z5+
    3363*z2^7*z4*z5- 1121*z2^6*z3*z4*z5- 1110*z2^8*z6- 11*z2^7*z3*z6-
    11*z2^7*z4*z6+ 2242*z2^6*z3*z4*z6- 11*z2^7*z5*z6+ 2242*z2^6*z3*z5*z6+
    2242*z2^6*z4*z5*z6+ 3396*z2^5*z3*z4*z5*z6- 1110*z2^7*z6^2- 11*z2^6*z3*z6^2-
    11*z2^6*z4*z6^2+ 2242*z2^5*z3*z4*z6^2- 11*z2^6*z5*z6^2+ 2242*z2^5*z3*z5*z6^2+
    2242*z2^5*z4*z5*z6^2+ 3396*z2^4*z3*z4*z5*z6^2- 1110*z2^6*z6^3-
    11*z2^5*z3*z6^3- 11*z2^5*z4*z6^3+ 2242*z2^4*z3*z4*z6^3- 11*z2^5*z5*z6^3+
    2242*z2^4*z3*z5*z6^3+ 2242*z2^4*z4*z5*z6^3+ 3396*z2^3*z3*z4*z5*z6^3-
    1110*z2^5*z6^4- 11*z2^4*z3*z6^4- 11*z2^4*z4*z6^4+ 2242*z2^3*z3*z4*z6^4-
    11*z2^4*z5*z6^4+ 2242*z2^3*z3*z5*z6^4+ 2242*z2^3*z4*z5*z6^4+
    3396*z2^2*z3*z4*z5*z6^4- 1110*z2^4*z6^5- 11*z2^3*z3*z6^5- 11*z2^3*z4*z6^5+
    2242*z2^2*z3*z4*z6^5- 11*z2^3*z5*z6^5+ 2242*z2^2*z3*z5*z6^5+
    2242*z2^2*z4*z5*z6^5+ 3396*z2*z3*z4*z5*z6^5- 1110*z2^3*z6^6- 11*z2^2*z3*z6^6-
    11*z2^2*z4*z6^6+ 2242*z2*z3*z4*z6^6- 11*z2^2*z5*z6^6+ 2242*z2*z3*z5*z6^6+
    2242*z2*z4*z5*z6^6- 1121*z3*z4*z5*z6^6- 1110*z2^2*z6^7- 11*z2*z3*z6^7-
    11*z2*z4*z6^7+ 3363*z3*z4*z6^7- 11*z2*z5*z6^7+ 3363*z3*z5*z6^7+
    3363*z4*z5*z6^7- 1110*z2*z6^8- 3374*z3*z6^8- 3374*z4*z6^8- 3374*z5*z6^8+
    2264*z6^9- 3374*z2^8*z7+ 3363*z2^7*z3*z7+ 3363*z2^7*z4*z7- 1121*z2^6*z3*z4*z7+
    3363*z2^7*z5*z7- 1121*z2^6*z3*z5*z7- 1121*z2^6*z4*z5*z7-
    4484*z2^5*z3*z4*z5*z7- 11*z2^7*z6*z7+ 2242*z2^6*z3*z6*z7+ 2242*z2^6*z4*z6*z7+
    3396*z2^5*z3*z4*z6*z7+ 2242*z2^6*z5*z6*z7+ 3396*z2^5*z3*z5*z6*z7+
    3396*z2^5*z4*z5*z6*z7+ 1154*z2^4*z3*z4*z5*z6*z7- 11*z2^6*z6^2*z7+
    2242*z2^5*z3*z6^2*z7+ 2242*z2^5*z4*z6^2*z7+ 3396*z2^4*z3*z4*z6^2*z7+
    2242*z2^5*z5*z6^2*z7+ 3396*z2^4*z3*z5*z6^2*z7+ 3396*z2^4*z4*z5*z6^2*z7+
    1154*z2^3*z3*z4*z5*z6^2*z7- 11*z2^5*z6^3*z7+ 2242*z2^4*z3*z6^3*z7+
    2242*z2^4*z4*z6^3*z7+ 3396*z2^3*z3*z4*z6^3*z7+ 2242*z2^4*z5*z6^3*z7+
    3396*z2^3*z3*z5*z6^3*z7+ 3396*z2^3*z4*z5*z6^3*z7+ 1154*z2^2*z3*z4*z5*z6^3*z7-
    11*z2^4*z6^4*z7+ 2242*z2^3*z3*z6^4*z7+ 2242*z2^3*z4*z6^4*z7+
    3396*z2^2*z3*z4*z6^4*z7+ 2242*z2^3*z5*z6^4*z7+ 3396*z2^2*z3*z5*z6^4*z7+
    3396*z2^2*z4*z5*z6^4*z7+ 1154*z2*z3*z4*z5*z6^4*z7- 11*z2^3*z6^5*z7+
    2242*z2^2*z3*z6^5*z7+ 2242*z2^2*z4*z6^5*z7+ 3396*z2*z3*z4*z6^5*z7+
    2242*z2^2*z5*z6^5*z7+ 3396*z2*z3*z5*z6^5*z7+ 3396*z2*z4*z5*z6^5*z7-
    4484*z3*z4*z5*z6^5*z7- 11*z2^2*z6^6*z7+ 2242*z2*z3*z6^6*z7+
    2242*z2*z4*z6^6*z7- 1121*z3*z4*z6^6*z7+ 2242*z2*z5*z6^6*z7-
    1121*z3*z5*z6^6*z7- 1121*z4*z5*z6^6*z7- 11*z2*z6^7*z7+ 3363*z3*z6^7*z7+
    3363*z4*z6^7*z7+ 3363*z5*z6^7*z7- 3374*z6^8*z7+ 2604*z2^7+ 147*z2^6*z3+
    147*z2^6*z4+ 2740*z2^5*z3*z4+ 147*z2^6*z5+ 2740*z2^5*z3*z5+ 2740*z2^5*z4*z5+
    4495*z2^4*z3*z4*z5+ 2751*z2^6*z6+ 2887*z2^5*z3*z6+ 2887*z2^5*z4*z6-
    1766*z2^4*z3*z4*z6+ 2887*z2^5*z5*z6- 1766*z2^4*z3*z5*z6- 1766*z2^4*z4*z5*z6-
    2751*z2^3*z3*z4*z5*z6+ 2751*z2^5*z6^2+ 2887*z2^4*z3*z6^2+ 2887*z2^4*z4*z6^2-
    1766*z2^3*z3*z4*z6^2+ 2887*z2^4*z5*z6^2- 1766*z2^3*z3*z5*z6^2-
    1766*z2^3*z4*z5*z6^2- 2751*z2^2*z3*z4*z5*z6^2+ 2751*z2^4*z6^3+
    2887*z2^3*z3*z6^3+ 2887*z2^3*z4*z6^3- 1766*z2^2*z3*z4*z6^3+ 2887*z2^3*z5*z6^3-
    1766*z2^2*z3*z5*z6^3- 1766*z2^2*z4*z5*z6^3- 2751*z2*z3*z4*z5*z6^3+
    2751*z2^3*z6^4+ 2887*z2^2*z3*z6^4+ 2887*z2^2*z4*z6^4- 1766*z2*z3*z4*z6^4+
    2887*z2^2*z5*z6^4- 1766*z2*z3*z5*z6^4- 1766*z2*z4*z5*z6^4+ 4495*z3*z4*z5*z6^4+
    2751*z2^2*z6^5+ 2887*z2*z3*z6^5+ 2887*z2*z4*z6^5+ 2740*z3*z4*z6^5+
    2887*z2*z5*z6^5+ 2740*z3*z5*z6^5+ 2740*z4*z5*z6^5+ 2751*z2*z6^6+ 147*z3*z6^6+
    147*z4*z6^6+ 147*z5*z6^6+ 2604*z6^7+ 147*z2^6*z7+ 2740*z2^5*z3*z7+
    2740*z2^5*z4*z7+ 4495*z2^4*z3*z4*z7+ 2740*z2^5*z5*z7+ 4495*z2^4*z3*z5*z7+
    4495*z2^4*z4*z5*z7+ 1755*z2^3*z3*z4*z5*z7+ 2887*z2^5*z6*z7-
    1766*z2^4*z3*z6*z7- 1766*z2^4*z4*z6*z7- 2751*z2^3*z3*z4*z6*z7-
    1766*z2^4*z5*z6*z7- 2751*z2^3*z3*z5*z6*z7- 2751*z2^3*z4*z5*z6*z7-
    2887*z2^2*z3*z4*z5*z6*z7+ 2887*z2^4*z6^2*z7- 1766*z2^3*z3*z6^2*z7-
    1766*z2^3*z4*z6^2*z7- 2751*z2^2*z3*z4*z6^2*z7- 1766*z2^3*z5*z6^2*z7-
    2751*z2^2*z3*z5*z6^2*z7- 2751*z2^2*z4*z5*z6^2*z7- 2887*z2*z3*z4*z5*z6^2*z7+
    2887*z2^3*z6^3*z7- 1766*z2^2*z3*z6^3*z7- 1766*z2^2*z4*z6^3*z7-
    2751*z2*z3*z4*z6^3*z7- 1766*z2^2*z5*z6^3*z7- 2751*z2*z3*z5*z6^3*z7-
    2751*z2*z4*z5*z6^3*z7+ 1755*z3*z4*z5*z6^3*z7+ 2887*z2^2*z6^4*z7-
    1766*z2*z3*z6^4*z7- 1766*z2*z4*z6^4*z7+ 4495*z3*z4*z6^4*z7-
    1766*z2*z5*z6^4*z7+ 4495*z3*z5*z6^4*z7+ 4495*z4*z5*z6^4*z7+ 2887*z2*z6^5*z7+
    2740*z3*z6^5*z7+ 2740*z4*z6^5*z7+ 2740*z5*z6^5*z7+ 147*z6^6*z7+ 2037*z2^5+
    318*z2^4*z3+ 318*z2^4*z4+ 3588*z2^3*z3*z4+ 318*z2^4*z5+ 3588*z2^3*z3*z5+
    3588*z2^3*z4*z5- 2988*z2^2*z3*z4*z5+ 2355*z2^4*z6+ 3906*z2^3*z3*z6+
    3906*z2^3*z4*z6+ 600*z2^2*z3*z4*z6+ 3906*z2^3*z5*z6+ 600*z2^2*z3*z5*z6+
    600*z2^2*z4*z5*z6- 2355*z2*z3*z4*z5*z6+ 2355*z2^3*z6^2+ 3906*z2^2*z3*z6^2+
    3906*z2^2*z4*z6^2+ 600*z2*z3*z4*z6^2+ 3906*z2^2*z5*z6^2+ 600*z2*z3*z5*z6^2+
    600*z2*z4*z5*z6^2- 2988*z3*z4*z5*z6^2+ 2355*z2^2*z6^3+ 3906*z2*z3*z6^3+
    3906*z2*z4*z6^3+ 3588*z3*z4*z6^3+ 3906*z2*z5*z6^3+ 3588*z3*z5*z6^3+
    3588*z4*z5*z6^3+ 2355*z2*z6^4+ 318*z3*z6^4+ 318*z4*z6^4+ 318*z5*z6^4+
    2037*z6^5+ 318*z2^4*z7+ 3588*z2^3*z3*z7+ 3588*z2^3*z4*z7- 2988*z2^2*z3*z4*z7+
    3588*z2^3*z5*z7- 2988*z2^2*z3*z5*z7- 2988*z2^2*z4*z5*z7+ 633*z2*z3*z4*z5*z7+
    3906*z2^3*z6*z7+ 600*z2^2*z3*z6*z7+ 600*z2^2*z4*z6*z7- 2355*z2*z3*z4*z6*z7+
    600*z2^2*z5*z6*z7- 2355*z2*z3*z5*z6*z7- 2355*z2*z4*z5*z6*z7+
    633*z3*z4*z5*z6*z7+ 3906*z2^2*z6^2*z7+ 600*z2*z3*z6^2*z7+ 600*z2*z4*z6^2*z7-
    2988*z3*z4*z6^2*z7+ 600*z2*z5*z6^2*z7- 2988*z3*z5*z6^2*z7- 2988*z4*z5*z6^2*z7+
    3906*z2*z6^3*z7+ 3588*z3*z6^3*z7+ 3588*z4*z6^3*z7+ 3588*z5*z6^3*z7+
    318*z6^4*z7+ 2166*z2^3- 1776*z2^2*z3- 1776*z2^2*z4- 2202*z2*z3*z4-
    1776*z2^2*z5- 2202*z2*z3*z5- 2202*z2*z4*z5- 1068*z3*z4*z5+ 390*z2^2*z6-
    3978*z2*z3*z6- 3978*z2*z4*z6- 2202*z3*z4*z6- 3978*z2*z5*z6- 2202*z3*z5*z6-
    2202*z4*z5*z6+ 390*z2*z6^2- 1776*z3*z6^2- 1776*z4*z6^2- 1776*z5*z6^2+
    2166*z6^3- 1776*z2^2*z7- 2202*z2*z3*z7- 2202*z2*z4*z7- 1068*z3*z4*z7-
    2202*z2*z5*z7- 1068*z3*z5*z7- 1068*z4*z5*z7- 3978*z2*z6*z7- 2202*z3*z6*z7-
    2202*z4*z6*z7- 2202*z5*z6*z7- 1776*z6^2*z7- 1169*z2+ 3538*z3+ 3538*z4+
    3538*z5- 1169*z6+ 3538*z7, 2*z2^15- 4*z2^14*z3- 4*z2^14*z4+ 6*z2^13*z3*z4-
    4*z2^14*z5+ 6*z2^13*z3*z5+ 6*z2^13*z4*z5- 8*z2^12*z3*z4*z5- 4*z2^14*z6+
    6*z2^13*z3*z6+ 6*z2^13*z4*z6- 8*z2^12*z3*z4*z6+ 6*z2^13*z5*z6-
    8*z2^12*z3*z5*z6- 8*z2^12*z4*z5*z6+ 10*z2^11*z3*z4*z5*z6- 2*z2^14*z7+
    2*z2^13*z3*z7+ 2*z2^13*z4*z7- 2*z2^12*z3*z4*z7+ 2*z2^13*z5*z7-
    2*z2^12*z3*z5*z7- 2*z2^12*z4*z5*z7+ 2*z2^11*z3*z4*z5*z7+ 2*z2^13*z6*z7-
    2*z2^12*z3*z6*z7- 2*z2^12*z4*z6*z7+ 2*z2^11*z3*z4*z6*z7- 2*z2^12*z5*z6*z7+
    2*z2^11*z3*z5*z6*z7+ 2*z2^11*z4*z5*z6*z7- 2*z2^10*z3*z4*z5*z6*z7-
    2*z2^13*z7^2+ 2*z2^12*z3*z7^2+ 2*z2^12*z4*z7^2- 2*z2^11*z3*z4*z7^2+
    2*z2^12*z5*z7^2- 2*z2^11*z3*z5*z7^2- 2*z2^11*z4*z5*z7^2+
    2*z2^10*z3*z4*z5*z7^2+ 2*z2^12*z6*z7^2- 2*z2^11*z3*z6*z7^2-
    2*z2^11*z4*z6*z7^2+ 2*z2^10*z3*z4*z6*z7^2- 2*z2^11*z5*z6*z7^2+
    2*z2^10*z3*z5*z6*z7^2+ 2*z2^10*z4*z5*z6*z7^2- 2*z2^9*z3*z4*z5*z6*z7^2-
    2*z2^12*z7^3+ 2*z2^11*z3*z7^3+ 2*z2^11*z4*z7^3- 2*z2^10*z3*z4*z7^3+
    2*z2^11*z5*z7^3- 2*z2^10*z3*z5*z7^3- 2*z2^10*z4*z5*z7^3+ 2*z2^9*z3*z4*z5*z7^3+
    2*z2^11*z6*z7^3- 2*z2^10*z3*z6*z7^3- 2*z2^10*z4*z6*z7^3+ 2*z2^9*z3*z4*z6*z7^3-
    2*z2^10*z5*z6*z7^3+ 2*z2^9*z3*z5*z6*z7^3+ 2*z2^9*z4*z5*z6*z7^3-
    2*z2^8*z3*z4*z5*z6*z7^3- 2*z2^11*z7^4+ 2*z2^10*z3*z7^4+ 2*z2^10*z4*z7^4-
    2*z2^9*z3*z4*z7^4+ 2*z2^10*z5*z7^4- 2*z2^9*z3*z5*z7^4- 2*z2^9*z4*z5*z7^4+
    2*z2^8*z3*z4*z5*z7^4+ 2*z2^10*z6*z7^4- 2*z2^9*z3*z6*z7^4- 2*z2^9*z4*z6*z7^4+
    2*z2^8*z3*z4*z6*z7^4- 2*z2^9*z5*z6*z7^4+ 2*z2^8*z3*z5*z6*z7^4+
    2*z2^8*z4*z5*z6*z7^4- 2*z2^7*z3*z4*z5*z6*z7^4- 2*z2^10*z7^5+ 2*z2^9*z3*z7^5+
    2*z2^9*z4*z7^5- 2*z2^8*z3*z4*z7^5+ 2*z2^9*z5*z7^5- 2*z2^8*z3*z5*z7^5-
    2*z2^8*z4*z5*z7^5+ 2*z2^7*z3*z4*z5*z7^5+ 2*z2^9*z6*z7^5- 2*z2^8*z3*z6*z7^5-
    2*z2^8*z4*z6*z7^5+ 2*z2^7*z3*z4*z6*z7^5- 2*z2^8*z5*z6*z7^5+
    2*z2^7*z3*z5*z6*z7^5+ 2*z2^7*z4*z5*z6*z7^5- 2*z2^6*z3*z4*z5*z6*z7^5-
    2*z2^9*z7^6+ 2*z2^8*z3*z7^6+ 2*z2^8*z4*z7^6- 2*z2^7*z3*z4*z7^6+
    2*z2^8*z5*z7^6- 2*z2^7*z3*z5*z7^6- 2*z2^7*z4*z5*z7^6+ 2*z2^6*z3*z4*z5*z7^6+
    2*z2^8*z6*z7^6- 2*z2^7*z3*z6*z7^6- 2*z2^7*z4*z6*z7^6+ 2*z2^6*z3*z4*z6*z7^6-
    2*z2^7*z5*z6*z7^6+ 2*z2^6*z3*z5*z6*z7^6+ 2*z2^6*z4*z5*z6*z7^6-
    2*z2^5*z3*z4*z5*z6*z7^6- 2*z2^8*z7^7+ 2*z2^7*z3*z7^7+ 2*z2^7*z4*z7^7-
    2*z2^6*z3*z4*z7^7+ 2*z2^7*z5*z7^7- 2*z2^6*z3*z5*z7^7- 2*z2^6*z4*z5*z7^7+
    2*z2^5*z3*z4*z5*z7^7+ 2*z2^7*z6*z7^7- 2*z2^6*z3*z6*z7^7- 2*z2^6*z4*z6*z7^7+
    2*z2^5*z3*z4*z6*z7^7- 2*z2^6*z5*z6*z7^7+ 2*z2^5*z3*z5*z6*z7^7+
    2*z2^5*z4*z5*z6*z7^7- 2*z2^4*z3*z4*z5*z6*z7^7- 2*z2^7*z7^8+ 2*z2^6*z3*z7^8+
    2*z2^6*z4*z7^8- 2*z2^5*z3*z4*z7^8+ 2*z2^6*z5*z7^8- 2*z2^5*z3*z5*z7^8-
    2*z2^5*z4*z5*z7^8+ 2*z2^4*z3*z4*z5*z7^8+ 2*z2^6*z6*z7^8- 2*z2^5*z3*z6*z7^8-
    2*z2^5*z4*z6*z7^8+ 2*z2^4*z3*z4*z6*z7^8- 2*z2^5*z5*z6*z7^8+
    2*z2^4*z3*z5*z6*z7^8+ 2*z2^4*z4*z5*z6*z7^8- 2*z2^3*z3*z4*z5*z6*z7^8-
    2*z2^6*z7^9+ 2*z2^5*z3*z7^9+ 2*z2^5*z4*z7^9- 2*z2^4*z3*z4*z7^9+
    2*z2^5*z5*z7^9- 2*z2^4*z3*z5*z7^9- 2*z2^4*z4*z5*z7^9+ 2*z2^3*z3*z4*z5*z7^9+
    2*z2^5*z6*z7^9- 2*z2^4*z3*z6*z7^9- 2*z2^4*z4*z6*z7^9+ 2*z2^3*z3*z4*z6*z7^9-
    2*z2^4*z5*z6*z7^9+ 2*z2^3*z3*z5*z6*z7^9+ 2*z2^3*z4*z5*z6*z7^9-
    2*z2^2*z3*z4*z5*z6*z7^9- 2*z2^5*z7^10+ 2*z2^4*z3*z7^10+ 2*z2^4*z4*z7^10-
    2*z2^3*z3*z4*z7^10+ 2*z2^4*z5*z7^10- 2*z2^3*z3*z5*z7^10- 2*z2^3*z4*z5*z7^10+
    2*z2^2*z3*z4*z5*z7^10+ 2*z2^4*z6*z7^10- 2*z2^3*z3*z6*z7^10-
    2*z2^3*z4*z6*z7^10+ 2*z2^2*z3*z4*z6*z7^10- 2*z2^3*z5*z6*z7^10+
    2*z2^2*z3*z5*z6*z7^10+ 2*z2^2*z4*z5*z6*z7^10- 2*z2*z3*z4*z5*z6*z7^10-
    2*z2^4*z7^11+ 2*z2^3*z3*z7^11+ 2*z2^3*z4*z7^11- 2*z2^2*z3*z4*z7^11+
    2*z2^3*z5*z7^11- 2*z2^2*z3*z5*z7^11- 2*z2^2*z4*z5*z7^11+ 2*z2*z3*z4*z5*z7^11+
    2*z2^3*z6*z7^11- 2*z2^2*z3*z6*z7^11- 2*z2^2*z4*z6*z7^11+ 2*z2*z3*z4*z6*z7^11-
    2*z2^2*z5*z6*z7^11+ 2*z2*z3*z5*z6*z7^11+ 2*z2*z4*z5*z6*z7^11+
    10*z3*z4*z5*z6*z7^11- 2*z2^3*z7^12+ 2*z2^2*z3*z7^12+ 2*z2^2*z4*z7^12-
    2*z2*z3*z4*z7^12+ 2*z2^2*z5*z7^12- 2*z2*z3*z5*z7^12- 2*z2*z4*z5*z7^12-
    8*z3*z4*z5*z7^12+ 2*z2^2*z6*z7^12- 2*z2*z3*z6*z7^12- 2*z2*z4*z6*z7^12-
    8*z3*z4*z6*z7^12- 2*z2*z5*z6*z7^12- 8*z3*z5*z6*z7^12- 8*z4*z5*z6*z7^12-
    2*z2^2*z7^13+ 2*z2*z3*z7^13+ 2*z2*z4*z7^13+ 6*z3*z4*z7^13+ 2*z2*z5*z7^13+
    6*z3*z5*z7^13+ 6*z4*z5*z7^13+ 2*z2*z6*z7^13+ 6*z3*z6*z7^13+ 6*z4*z6*z7^13+
    6*z5*z6*z7^13- 2*z2*z7^14- 4*z3*z7^14- 4*z4*z7^14- 4*z5*z7^14- 4*z6*z7^14+
    2*z7^15+ 10*z2^13- 13*z2^12*z3- 13*z2^12*z4+ 10*z2^11*z3*z4- 13*z2^12*z5+
    10*z2^11*z3*z5+ 10*z2^11*z4*z5+ z2^10*z3*z4*z5- 13*z2^12*z6+ 10*z2^11*z3*z6+
    10*z2^11*z4*z6+ z2^10*z3*z4*z6+ 10*z2^11*z5*z6+ z2^10*z3*z5*z6+
    z2^10*z4*z5*z6- 22*z2^9*z3*z4*z5*z6- 3*z2^12*z7- 3*z2^11*z3*z7- 3*z2^11*z4*z7+
    11*z2^10*z3*z4*z7- 3*z2^11*z5*z7+ 11*z2^10*z3*z5*z7+ 11*z2^10*z4*z5*z7-
    21*z2^9*z3*z4*z5*z7- 3*z2^11*z6*z7+ 11*z2^10*z3*z6*z7+ 11*z2^10*z4*z6*z7-
    21*z2^9*z3*z4*z6*z7+ 11*z2^10*z5*z6*z7- 21*z2^9*z3*z5*z6*z7-
    21*z2^9*z4*z5*z6*z7+ 33*z2^8*z3*z4*z5*z6*z7- 3*z2^11*z7^2- 3*z2^10*z3*z7^2-
    3*z2^10*z4*z7^2+ 11*z2^9*z3*z4*z7^2- 3*z2^10*z5*z7^2+ 11*z2^9*z3*z5*z7^2+
    11*z2^9*z4*z5*z7^2- 21*z2^8*z3*z4*z5*z7^2- 3*z2^10*z6*z7^2+
    11*z2^9*z3*z6*z7^2+ 11*z2^9*z4*z6*z7^2- 21*z2^8*z3*z4*z6*z7^2+
    11*z2^9*z5*z6*z7^2- 21*z2^8*z3*z5*z6*z7^2- 21*z2^8*z4*z5*z6*z7^2+
    33*z2^7*z3*z4*z5*z6*z7^2- 3*z2^10*z7^3- 3*z2^9*z3*z7^3- 3*z2^9*z4*z7^3+
    11*z2^8*z3*z4*z7^3- 3*z2^9*z5*z7^3+ 11*z2^8*z3*z5*z7^3+ 11*z2^8*z4*z5*z7^3-
    21*z2^7*z3*z4*z5*z7^3- 3*z2^9*z6*z7^3+ 11*z2^8*z3*z6*z7^3+ 11*z2^8*z4*z6*z7^3-
    21*z2^7*z3*z4*z6*z7^3+ 11*z2^8*z5*z6*z7^3- 21*z2^7*z3*z5*z6*z7^3-
    21*z2^7*z4*z5*z6*z7^3+ 33*z2^6*z3*z4*z5*z6*z7^3- 3*z2^9*z7^4- 3*z2^8*z3*z7^4-
    3*z2^8*z4*z7^4+ 11*z2^7*z3*z4*z7^4- 3*z2^8*z5*z7^4+ 11*z2^7*z3*z5*z7^4+
    11*z2^7*z4*z5*z7^4- 21*z2^6*z3*z4*z5*z7^4- 3*z2^8*z6*z7^4+ 11*z2^7*z3*z6*z7^4+
    11*z2^7*z4*z6*z7^4- 21*z2^6*z3*z4*z6*z7^4+ 11*z2^7*z5*z6*z7^4-
    21*z2^6*z3*z5*z6*z7^4- 21*z2^6*z4*z5*z6*z7^4+ 33*z2^5*z3*z4*z5*z6*z7^4-
    3*z2^8*z7^5- 3*z2^7*z3*z7^5- 3*z2^7*z4*z7^5+ 11*z2^6*z3*z4*z7^5-
    3*z2^7*z5*z7^5+ 11*z2^6*z3*z5*z7^5+ 11*z2^6*z4*z5*z7^5- 21*z2^5*z3*z4*z5*z7^5-
    3*z2^7*z6*z7^5+ 11*z2^6*z3*z6*z7^5+ 11*z2^6*z4*z6*z7^5- 21*z2^5*z3*z4*z6*z7^5+
    11*z2^6*z5*z6*z7^5- 21*z2^5*z3*z5*z6*z7^5- 21*z2^5*z4*z5*z6*z7^5+
    33*z2^4*z3*z4*z5*z6*z7^5- 3*z2^7*z7^6- 3*z2^6*z3*z7^6- 3*z2^6*z4*z7^6+
    11*z2^5*z3*z4*z7^6- 3*z2^6*z5*z7^6+ 11*z2^5*z3*z5*z7^6+ 11*z2^5*z4*z5*z7^6-
    21*z2^4*z3*z4*z5*z7^6- 3*z2^6*z6*z7^6+ 11*z2^5*z3*z6*z7^6+ 11*z2^5*z4*z6*z7^6-
    21*z2^4*z3*z4*z6*z7^6+ 11*z2^5*z5*z6*z7^6- 21*z2^4*z3*z5*z6*z7^6-
    21*z2^4*z4*z5*z6*z7^6+ 33*z2^3*z3*z4*z5*z6*z7^6- 3*z2^6*z7^7- 3*z2^5*z3*z7^7-
    3*z2^5*z4*z7^7+ 11*z2^4*z3*z4*z7^7- 3*z2^5*z5*z7^7+ 11*z2^4*z3*z5*z7^7+
    11*z2^4*z4*z5*z7^7- 21*z2^3*z3*z4*z5*z7^7- 3*z2^5*z6*z7^7+ 11*z2^4*z3*z6*z7^7+
    11*z2^4*z4*z6*z7^7- 21*z2^3*z3*z4*z6*z7^7+ 11*z2^4*z5*z6*z7^7-
    21*z2^3*z3*z5*z6*z7^7- 21*z2^3*z4*z5*z6*z7^7+ 33*z2^2*z3*z4*z5*z6*z7^7-
    3*z2^5*z7^8- 3*z2^4*z3*z7^8- 3*z2^4*z4*z7^8+ 11*z2^3*z3*z4*z7^8-
    3*z2^4*z5*z7^8+ 11*z2^3*z3*z5*z7^8+ 11*z2^3*z4*z5*z7^8- 21*z2^2*z3*z4*z5*z7^8-
    3*z2^4*z6*z7^8+ 11*z2^3*z3*z6*z7^8+ 11*z2^3*z4*z6*z7^8- 21*z2^2*z3*z4*z6*z7^8+
    11*z2^3*z5*z6*z7^8- 21*z2^2*z3*z5*z6*z7^8- 21*z2^2*z4*z5*z6*z7^8+
    33*z2*z3*z4*z5*z6*z7^8- 3*z2^4*z7^9- 3*z2^3*z3*z7^9- 3*z2^3*z4*z7^9+
    11*z2^2*z3*z4*z7^9- 3*z2^3*z5*z7^9+ 11*z2^2*z3*z5*z7^9+ 11*z2^2*z4*z5*z7^9-
    21*z2*z3*z4*z5*z7^9- 3*z2^3*z6*z7^9+ 11*z2^2*z3*z6*z7^9+ 11*z2^2*z4*z6*z7^9-
    21*z2*z3*z4*z6*z7^9+ 11*z2^2*z5*z6*z7^9- 21*z2*z3*z5*z6*z7^9-
    21*z2*z4*z5*z6*z7^9- 22*z3*z4*z5*z6*z7^9- 3*z2^3*z7^10- 3*z2^2*z3*z7^10-
    3*z2^2*z4*z7^10+ 11*z2*z3*z4*z7^10- 3*z2^2*z5*z7^10+ 11*z2*z3*z5*z7^10+
    11*z2*z4*z5*z7^10+ z3*z4*z5*z7^10- 3*z2^2*z6*z7^10+ 11*z2*z3*z6*z7^10+
    11*z2*z4*z6*z7^10+ z3*z4*z6*z7^10+ 11*z2*z5*z6*z7^10+ z3*z5*z6*z7^10+
    z4*z5*z6*z7^10- 3*z2^2*z7^11- 3*z2*z3*z7^11- 3*z2*z4*z7^11+ 10*z3*z4*z7^11-
    3*z2*z5*z7^11+ 10*z3*z5*z7^11+ 10*z4*z5*z7^11- 3*z2*z6*z7^11+ 10*z3*z6*z7^11+
    10*z4*z6*z7^11+ 10*z5*z6*z7^11- 3*z2*z7^12- 13*z3*z7^12- 13*z4*z7^12-
    13*z5*z7^12- 13*z6*z7^12+ 10*z7^13- 1107*z2^11- 12*z2^10*z3- 12*z2^10*z4+
    1121*z2^9*z3*z4- 12*z2^10*z5+ 1121*z2^9*z3*z5+ 1121*z2^9*z4*z5-
    2231*z2^8*z3*z4*z5- 12*z2^10*z6+ 1121*z2^9*z3*z6+ 1121*z2^9*z4*z6-
    2231*z2^8*z3*z4*z6+ 1121*z2^9*z5*z6- 2231*z2^8*z3*z5*z6- 2231*z2^8*z4*z5*z6+
    3363*z2^7*z3*z4*z5*z6- 1119*z2^10*z7+ 1109*z2^9*z3*z7+ 1109*z2^9*z4*z7-
    1110*z2^8*z3*z4*z7+ 1109*z2^9*z5*z7- 1110*z2^8*z3*z5*z7- 1110*z2^8*z4*z5*z7+
    1132*z2^7*z3*z4*z5*z7+ 1109*z2^9*z6*z7- 1110*z2^8*z3*z6*z7-
    1110*z2^8*z4*z6*z7+ 1132*z2^7*z3*z4*z6*z7- 1110*z2^8*z5*z6*z7+
    1132*z2^7*z3*z5*z6*z7+ 1132*z2^7*z4*z5*z6*z7- 1187*z2^6*z3*z4*z5*z6*z7-
    1119*z2^9*z7^2+ 1109*z2^8*z3*z7^2+ 1109*z2^8*z4*z7^2- 1110*z2^7*z3*z4*z7^2+
    1109*z2^8*z5*z7^2- 1110*z2^7*z3*z5*z7^2- 1110*z2^7*z4*z5*z7^2+
    1132*z2^6*z3*z4*z5*z7^2+ 1109*z2^8*z6*z7^2- 1110*z2^7*z3*z6*z7^2-
    1110*z2^7*z4*z6*z7^2+ 1132*z2^6*z3*z4*z6*z7^2- 1110*z2^7*z5*z6*z7^2+
    1132*z2^6*z3*z5*z6*z7^2+ 1132*z2^6*z4*z5*z6*z7^2- 1187*z2^5*z3*z4*z5*z6*z7^2-
    1119*z2^8*z7^3+ 1109*z2^7*z3*z7^3+ 1109*z2^7*z4*z7^3- 1110*z2^6*z3*z4*z7^3+
    1109*z2^7*z5*z7^3- 1110*z2^6*z3*z5*z7^3- 1110*z2^6*z4*z5*z7^3+
    1132*z2^5*z3*z4*z5*z7^3+ 1109*z2^7*z6*z7^3- 1110*z2^6*z3*z6*z7^3-
    1110*z2^6*z4*z6*z7^3+ 1132*z2^5*z3*z4*z6*z7^3- 1110*z2^6*z5*z6*z7^3+
    1132*z2^5*z3*z5*z6*z7^3+ 1132*z2^5*z4*z5*z6*z7^3- 1187*z2^4*z3*z4*z5*z6*z7^3-
    1119*z2^7*z7^4+ 1109*z2^6*z3*z7^4+ 1109*z2^6*z4*z7^4- 1110*z2^5*z3*z4*z7^4+
    1109*z2^6*z5*z7^4- 1110*z2^5*z3*z5*z7^4- 1110*z2^5*z4*z5*z7^4+
    1132*z2^4*z3*z4*z5*z7^4+ 1109*z2^6*z6*z7^4- 1110*z2^5*z3*z6*z7^4-
    1110*z2^5*z4*z6*z7^4+ 1132*z2^4*z3*z4*z6*z7^4- 1110*z2^5*z5*z6*z7^4+
    1132*z2^4*z3*z5*z6*z7^4+ 1132*z2^4*z4*z5*z6*z7^4- 1187*z2^3*z3*z4*z5*z6*z7^4-
    1119*z2^6*z7^5+ 1109*z2^5*z3*z7^5+ 1109*z2^5*z4*z7^5- 1110*z2^4*z3*z4*z7^5+
    1109*z2^5*z5*z7^5- 1110*z2^4*z3*z5*z7^5- 1110*z2^4*z4*z5*z7^5+
    1132*z2^3*z3*z4*z5*z7^5+ 1109*z2^5*z6*z7^5- 1110*z2^4*z3*z6*z7^5-
    1110*z2^4*z4*z6*z7^5+ 1132*z2^3*z3*z4*z6*z7^5- 1110*z2^4*z5*z6*z7^5+
    1132*z2^3*z3*z5*z6*z7^5+ 1132*z2^3*z4*z5*z6*z7^5- 1187*z2^2*z3*z4*z5*z6*z7^5-
    1119*z2^5*z7^6+ 1109*z2^4*z3*z7^6+ 1109*z2^4*z4*z7^6- 1110*z2^3*z3*z4*z7^6+
    1109*z2^4*z5*z7^6- 1110*z2^3*z3*z5*z7^6- 1110*z2^3*z4*z5*z7^6+
    1132*z2^2*z3*z4*z5*z7^6+ 1109*z2^4*z6*z7^6- 1110*z2^3*z3*z6*z7^6-
    1110*z2^3*z4*z6*z7^6+ 1132*z2^2*z3*z4*z6*z7^6- 1110*z2^3*z5*z6*z7^6+
    1132*z2^2*z3*z5*z6*z7^6+ 1132*z2^2*z4*z5*z6*z7^6- 1187*z2*z3*z4*z5*z6*z7^6-
    1119*z2^4*z7^7+ 1109*z2^3*z3*z7^7+ 1109*z2^3*z4*z7^7- 1110*z2^2*z3*z4*z7^7+
    1109*z2^3*z5*z7^7- 1110*z2^2*z3*z5*z7^7- 1110*z2^2*z4*z5*z7^7+
    1132*z2*z3*z4*z5*z7^7+ 1109*z2^3*z6*z7^7- 1110*z2^2*z3*z6*z7^7-
    1110*z2^2*z4*z6*z7^7+ 1132*z2*z3*z4*z6*z7^7- 1110*z2^2*z5*z6*z7^7+
    1132*z2*z3*z5*z6*z7^7+ 1132*z2*z4*z5*z6*z7^7+ 3363*z3*z4*z5*z6*z7^7-
    1119*z2^3*z7^8+ 1109*z2^2*z3*z7^8+ 1109*z2^2*z4*z7^8- 1110*z2*z3*z4*z7^8+
    1109*z2^2*z5*z7^8- 1110*z2*z3*z5*z7^8- 1110*z2*z4*z5*z7^8- 2231*z3*z4*z5*z7^8+
    1109*z2^2*z6*z7^8- 1110*z2*z3*z6*z7^8- 1110*z2*z4*z6*z7^8- 2231*z3*z4*z6*z7^8-
    1110*z2*z5*z6*z7^8- 2231*z3*z5*z6*z7^8- 2231*z4*z5*z6*z7^8- 1119*z2^2*z7^9+
    1109*z2*z3*z7^9+ 1109*z2*z4*z7^9+ 1121*z3*z4*z7^9+ 1109*z2*z5*z7^9+
    1121*z3*z5*z7^9+ 1121*z4*z5*z7^9+ 1109*z2*z6*z7^9+ 1121*z3*z6*z7^9+
    1121*z4*z6*z7^9+ 1121*z5*z6*z7^9- 1119*z2*z7^10- 12*z3*z7^10- 12*z4*z7^10-
    12*z5*z7^10- 12*z6*z7^10- 1107*z7^11+ 2264*z2^9- 3374*z2^8*z3- 3374*z2^8*z4+
    3363*z2^7*z3*z4- 3374*z2^8*z5+ 3363*z2^7*z3*z5+ 3363*z2^7*z4*z5-
    1121*z2^6*z3*z4*z5- 3374*z2^8*z6+ 3363*z2^7*z3*z6+ 3363*z2^7*z4*z6-
    1121*z2^6*z3*z4*z6+ 3363*z2^7*z5*z6- 1121*z2^6*z3*z5*z6- 1121*z2^6*z4*z5*z6-
    4484*z2^5*z3*z4*z5*z6- 1110*z2^8*z7- 11*z2^7*z3*z7- 11*z2^7*z4*z7+
    2242*z2^6*z3*z4*z7- 11*z2^7*z5*z7+ 2242*z2^6*z3*z5*z7+ 2242*z2^6*z4*z5*z7+
    3396*z2^5*z3*z4*z5*z7- 11*z2^7*z6*z7+ 2242*z2^6*z3*z6*z7+ 2242*z2^6*z4*z6*z7+
    3396*z2^5*z3*z4*z6*z7+ 2242*z2^6*z5*z6*z7+ 3396*z2^5*z3*z5*z6*z7+
    3396*z2^5*z4*z5*z6*z7+ 1154*z2^4*z3*z4*z5*z6*z7- 1110*z2^7*z7^2-
    11*z2^6*z3*z7^2- 11*z2^6*z4*z7^2+ 2242*z2^5*z3*z4*z7^2- 11*z2^6*z5*z7^2+
    2242*z2^5*z3*z5*z7^2+ 2242*z2^5*z4*z5*z7^2+ 3396*z2^4*z3*z4*z5*z7^2-
    11*z2^6*z6*z7^2+ 2242*z2^5*z3*z6*z7^2+ 2242*z2^5*z4*z6*z7^2+
    3396*z2^4*z3*z4*z6*z7^2+ 2242*z2^5*z5*z6*z7^2+ 3396*z2^4*z3*z5*z6*z7^2+
    3396*z2^4*z4*z5*z6*z7^2+ 1154*z2^3*z3*z4*z5*z6*z7^2- 1110*z2^6*z7^3-
    11*z2^5*z3*z7^3- 11*z2^5*z4*z7^3+ 2242*z2^4*z3*z4*z7^3- 11*z2^5*z5*z7^3+
    2242*z2^4*z3*z5*z7^3+ 2242*z2^4*z4*z5*z7^3+ 3396*z2^3*z3*z4*z5*z7^3-
    11*z2^5*z6*z7^3+ 2242*z2^4*z3*z6*z7^3+ 2242*z2^4*z4*z6*z7^3+
    3396*z2^3*z3*z4*z6*z7^3+ 2242*z2^4*z5*z6*z7^3+ 3396*z2^3*z3*z5*z6*z7^3+
    3396*z2^3*z4*z5*z6*z7^3+ 1154*z2^2*z3*z4*z5*z6*z7^3- 1110*z2^5*z7^4-
    11*z2^4*z3*z7^4- 11*z2^4*z4*z7^4+ 2242*z2^3*z3*z4*z7^4- 11*z2^4*z5*z7^4+
    2242*z2^3*z3*z5*z7^4+ 2242*z2^3*z4*z5*z7^4+ 3396*z2^2*z3*z4*z5*z7^4-
    11*z2^4*z6*z7^4+ 2242*z2^3*z3*z6*z7^4+ 2242*z2^3*z4*z6*z7^4+
    3396*z2^2*z3*z4*z6*z7^4+ 2242*z2^3*z5*z6*z7^4+ 3396*z2^2*z3*z5*z6*z7^4+
    3396*z2^2*z4*z5*z6*z7^4+ 1154*z2*z3*z4*z5*z6*z7^4- 1110*z2^4*z7^5-
    11*z2^3*z3*z7^5- 11*z2^3*z4*z7^5+ 2242*z2^2*z3*z4*z7^5- 11*z2^3*z5*z7^5+
    2242*z2^2*z3*z5*z7^5+ 2242*z2^2*z4*z5*z7^5+ 3396*z2*z3*z4*z5*z7^5-
    11*z2^3*z6*z7^5+ 2242*z2^2*z3*z6*z7^5+ 2242*z2^2*z4*z6*z7^5+
    3396*z2*z3*z4*z6*z7^5+ 2242*z2^2*z5*z6*z7^5+ 3396*z2*z3*z5*z6*z7^5+
    3396*z2*z4*z5*z6*z7^5- 4484*z3*z4*z5*z6*z7^5- 1110*z2^3*z7^6- 11*z2^2*z3*z7^6-
    11*z2^2*z4*z7^6+ 2242*z2*z3*z4*z7^6- 11*z2^2*z5*z7^6+ 2242*z2*z3*z5*z7^6+
    2242*z2*z4*z5*z7^6- 1121*z3*z4*z5*z7^6- 11*z2^2*z6*z7^6+ 2242*z2*z3*z6*z7^6+
    2242*z2*z4*z6*z7^6- 1121*z3*z4*z6*z7^6+ 2242*z2*z5*z6*z7^6-
    1121*z3*z5*z6*z7^6- 1121*z4*z5*z6*z7^6- 1110*z2^2*z7^7- 11*z2*z3*z7^7-
    11*z2*z4*z7^7+ 3363*z3*z4*z7^7- 11*z2*z5*z7^7+ 3363*z3*z5*z7^7+
    3363*z4*z5*z7^7- 11*z2*z6*z7^7+ 3363*z3*z6*z7^7+ 3363*z4*z6*z7^7+
    3363*z5*z6*z7^7- 1110*z2*z7^8- 3374*z3*z7^8- 3374*z4*z7^8- 3374*z5*z7^8-
    3374*z6*z7^8+ 2264*z7^9+ 2604*z2^7+ 147*z2^6*z3+ 147*z2^6*z4+ 2740*z2^5*z3*z4+
    147*z2^6*z5+ 2740*z2^5*z3*z5+ 2740*z2^5*z4*z5+ 4495*z2^4*z3*z4*z5+
    147*z2^6*z6+ 2740*z2^5*z3*z6+ 2740*z2^5*z4*z6+ 4495*z2^4*z3*z4*z6+
    2740*z2^5*z5*z6+ 4495*z2^4*z3*z5*z6+ 4495*z2^4*z4*z5*z6+
    1755*z2^3*z3*z4*z5*z6+ 2751*z2^6*z7+ 2887*z2^5*z3*z7+ 2887*z2^5*z4*z7-
    1766*z2^4*z3*z4*z7+ 2887*z2^5*z5*z7- 1766*z2^4*z3*z5*z7- 1766*z2^4*z4*z5*z7-
    2751*z2^3*z3*z4*z5*z7+ 2887*z2^5*z6*z7- 1766*z2^4*z3*z6*z7-
    1766*z2^4*z4*z6*z7- 2751*z2^3*z3*z4*z6*z7- 1766*z2^4*z5*z6*z7-
    2751*z2^3*z3*z5*z6*z7- 2751*z2^3*z4*z5*z6*z7- 2887*z2^2*z3*z4*z5*z6*z7+
    2751*z2^5*z7^2+ 2887*z2^4*z3*z7^2+ 2887*z2^4*z4*z7^2- 1766*z2^3*z3*z4*z7^2+
    2887*z2^4*z5*z7^2- 1766*z2^3*z3*z5*z7^2- 1766*z2^3*z4*z5*z7^2-
    2751*z2^2*z3*z4*z5*z7^2+ 2887*z2^4*z6*z7^2- 1766*z2^3*z3*z6*z7^2-
    1766*z2^3*z4*z6*z7^2- 2751*z2^2*z3*z4*z6*z7^2- 1766*z2^3*z5*z6*z7^2-
    2751*z2^2*z3*z5*z6*z7^2- 2751*z2^2*z4*z5*z6*z7^2- 2887*z2*z3*z4*z5*z6*z7^2+
    2751*z2^4*z7^3+ 2887*z2^3*z3*z7^3+ 2887*z2^3*z4*z7^3- 1766*z2^2*z3*z4*z7^3+
    2887*z2^3*z5*z7^3- 1766*z2^2*z3*z5*z7^3- 1766*z2^2*z4*z5*z7^3-
    2751*z2*z3*z4*z5*z7^3+ 2887*z2^3*z6*z7^3- 1766*z2^2*z3*z6*z7^3-
    1766*z2^2*z4*z6*z7^3- 2751*z2*z3*z4*z6*z7^3- 1766*z2^2*z5*z6*z7^3-
    2751*z2*z3*z5*z6*z7^3- 2751*z2*z4*z5*z6*z7^3+ 1755*z3*z4*z5*z6*z7^3+
    2751*z2^3*z7^4+ 2887*z2^2*z3*z7^4+ 2887*z2^2*z4*z7^4- 1766*z2*z3*z4*z7^4+
    2887*z2^2*z5*z7^4- 1766*z2*z3*z5*z7^4- 1766*z2*z4*z5*z7^4+ 4495*z3*z4*z5*z7^4+
    2887*z2^2*z6*z7^4- 1766*z2*z3*z6*z7^4- 1766*z2*z4*z6*z7^4+ 4495*z3*z4*z6*z7^4-
    1766*z2*z5*z6*z7^4+ 4495*z3*z5*z6*z7^4+ 4495*z4*z5*z6*z7^4+ 2751*z2^2*z7^5+
    2887*z2*z3*z7^5+ 2887*z2*z4*z7^5+ 2740*z3*z4*z7^5+ 2887*z2*z5*z7^5+
    2740*z3*z5*z7^5+ 2740*z4*z5*z7^5+ 2887*z2*z6*z7^5+ 2740*z3*z6*z7^5+
    2740*z4*z6*z7^5+ 2740*z5*z6*z7^5+ 2751*z2*z7^6+ 147*z3*z7^6+ 147*z4*z7^6+
    147*z5*z7^6+ 147*z6*z7^6+ 2604*z7^7+ 2037*z2^5+ 318*z2^4*z3+ 318*z2^4*z4+
    3588*z2^3*z3*z4+ 318*z2^4*z5+ 3588*z2^3*z3*z5+ 3588*z2^3*z4*z5-
    2988*z2^2*z3*z4*z5+ 318*z2^4*z6+ 3588*z2^3*z3*z6+ 3588*z2^3*z4*z6-
    2988*z2^2*z3*z4*z6+ 3588*z2^3*z5*z6- 2988*z2^2*z3*z5*z6- 2988*z2^2*z4*z5*z6+
    633*z2*z3*z4*z5*z6+ 2355*z2^4*z7+ 3906*z2^3*z3*z7+ 3906*z2^3*z4*z7+
    600*z2^2*z3*z4*z7+ 3906*z2^3*z5*z7+ 600*z2^2*z3*z5*z7+ 600*z2^2*z4*z5*z7-
    2355*z2*z3*z4*z5*z7+ 3906*z2^3*z6*z7+ 600*z2^2*z3*z6*z7+ 600*z2^2*z4*z6*z7-
    2355*z2*z3*z4*z6*z7+ 600*z2^2*z5*z6*z7- 2355*z2*z3*z5*z6*z7-
    2355*z2*z4*z5*z6*z7+ 633*z3*z4*z5*z6*z7+ 2355*z2^3*z7^2+ 3906*z2^2*z3*z7^2+
    3906*z2^2*z4*z7^2+ 600*z2*z3*z4*z7^2+ 3906*z2^2*z5*z7^2+ 600*z2*z3*z5*z7^2+
    600*z2*z4*z5*z7^2- 2988*z3*z4*z5*z7^2+ 3906*z2^2*z6*z7^2+ 600*z2*z3*z6*z7^2+
    600*z2*z4*z6*z7^2- 2988*z3*z4*z6*z7^2+ 600*z2*z5*z6*z7^2- 2988*z3*z5*z6*z7^2-
    2988*z4*z5*z6*z7^2+ 2355*z2^2*z7^3+ 3906*z2*z3*z7^3+ 3906*z2*z4*z7^3+
    3588*z3*z4*z7^3+ 3906*z2*z5*z7^3+ 3588*z3*z5*z7^3+ 3588*z4*z5*z7^3+
    3906*z2*z6*z7^3+ 3588*z3*z6*z7^3+ 3588*z4*z6*z7^3+ 3588*z5*z6*z7^3+
    2355*z2*z7^4+ 318*z3*z7^4+ 318*z4*z7^4+ 318*z5*z7^4+ 318*z6*z7^4+ 2037*z7^5+
    2166*z2^3- 1776*z2^2*z3- 1776*z2^2*z4- 2202*z2*z3*z4- 1776*z2^2*z5-
    2202*z2*z3*z5- 2202*z2*z4*z5- 1068*z3*z4*z5- 1776*z2^2*z6- 2202*z2*z3*z6-
    2202*z2*z4*z6- 1068*z3*z4*z6- 2202*z2*z5*z6- 1068*z3*z5*z6- 1068*z4*z5*z6+
    390*z2^2*z7- 3978*z2*z3*z7- 3978*z2*z4*z7- 2202*z3*z4*z7- 3978*z2*z5*z7-
    2202*z3*z5*z7- 2202*z4*z5*z7- 3978*z2*z6*z7- 2202*z3*z6*z7- 2202*z4*z6*z7-
    2202*z5*z6*z7+ 390*z2*z7^2- 1776*z3*z7^2- 1776*z4*z7^2- 1776*z5*z7^2-
    1776*z6*z7^2+ 2166*z7^3- 1169*z2+ 3538*z3+ 3538*z4+ 3538*z5+ 3538*z6- 1169*z7,
    - 4*z2*z3^14+ 2*z3^15+ 2*z2*z3^13*z4- 2*z3^14*z4+ 2*z2*z3^12*z4^2-
    2*z3^13*z4^2+ 2*z2*z3^11*z4^3- 2*z3^12*z4^3+ 2*z2*z3^10*z4^4- 2*z3^11*z4^4+
    2*z2*z3^9*z4^5- 2*z3^10*z4^5+ 2*z2*z3^8*z4^6- 2*z3^9*z4^6+ 2*z2*z3^7*z4^7-
    2*z3^8*z4^7+ 2*z2*z3^6*z4^8- 2*z3^7*z4^8+ 2*z2*z3^5*z4^9- 2*z3^6*z4^9+
    2*z2*z3^4*z4^10- 2*z3^5*z4^10+ 2*z2*z3^3*z4^11- 2*z3^4*z4^11+ 2*z2*z3^2*z4^12-
    2*z3^3*z4^12+ 2*z2*z3*z4^13- 2*z3^2*z4^13- 4*z2*z4^14- 2*z3*z4^14+ 2*z4^15+
    6*z2*z3^13*z5- 4*z3^14*z5- 2*z2*z3^12*z4*z5+ 2*z3^13*z4*z5-
    2*z2*z3^11*z4^2*z5+ 2*z3^12*z4^2*z5- 2*z2*z3^10*z4^3*z5+ 2*z3^11*z4^3*z5-
    2*z2*z3^9*z4^4*z5+ 2*z3^10*z4^4*z5- 2*z2*z3^8*z4^5*z5+ 2*z3^9*z4^5*z5-
    2*z2*z3^7*z4^6*z5+ 2*z3^8*z4^6*z5- 2*z2*z3^6*z4^7*z5+ 2*z3^7*z4^7*z5-
    2*z2*z3^5*z4^8*z5+ 2*z3^6*z4^8*z5- 2*z2*z3^4*z4^9*z5+ 2*z3^5*z4^9*z5-
    2*z2*z3^3*z4^10*z5+ 2*z3^4*z4^10*z5- 2*z2*z3^2*z4^11*z5+ 2*z3^3*z4^11*z5-
    2*z2*z3*z4^12*z5+ 2*z3^2*z4^12*z5+ 6*z2*z4^13*z5+ 2*z3*z4^13*z5- 4*z4^14*z5+
    6*z2*z3^13*z6- 4*z3^14*z6- 2*z2*z3^12*z4*z6+ 2*z3^13*z4*z6-
    2*z2*z3^11*z4^2*z6+ 2*z3^12*z4^2*z6- 2*z2*z3^10*z4^3*z6+ 2*z3^11*z4^3*z6-
    2*z2*z3^9*z4^4*z6+ 2*z3^10*z4^4*z6- 2*z2*z3^8*z4^5*z6+ 2*z3^9*z4^5*z6-
    2*z2*z3^7*z4^6*z6+ 2*z3^8*z4^6*z6- 2*z2*z3^6*z4^7*z6+ 2*z3^7*z4^7*z6-
    2*z2*z3^5*z4^8*z6+ 2*z3^6*z4^8*z6- 2*z2*z3^4*z4^9*z6+ 2*z3^5*z4^9*z6-
    2*z2*z3^3*z4^10*z6+ 2*z3^4*z4^10*z6- 2*z2*z3^2*z4^11*z6+ 2*z3^3*z4^11*z6-
    2*z2*z3*z4^12*z6+ 2*z3^2*z4^12*z6+ 6*z2*z4^13*z6+ 2*z3*z4^13*z6- 4*z4^14*z6-
    8*z2*z3^12*z5*z6+ 6*z3^13*z5*z6+ 2*z2*z3^11*z4*z5*z6- 2*z3^12*z4*z5*z6+
    2*z2*z3^10*z4^2*z5*z6- 2*z3^11*z4^2*z5*z6+ 2*z2*z3^9*z4^3*z5*z6-
    2*z3^10*z4^3*z5*z6+ 2*z2*z3^8*z4^4*z5*z6- 2*z3^9*z4^4*z5*z6+
    2*z2*z3^7*z4^5*z5*z6- 2*z3^8*z4^5*z5*z6+ 2*z2*z3^6*z4^6*z5*z6-
    2*z3^7*z4^6*z5*z6+ 2*z2*z3^5*z4^7*z5*z6- 2*z3^6*z4^7*z5*z6+
    2*z2*z3^4*z4^8*z5*z6- 2*z3^5*z4^8*z5*z6+ 2*z2*z3^3*z4^9*z5*z6-
    2*z3^4*z4^9*z5*z6+ 2*z2*z3^2*z4^10*z5*z6- 2*z3^3*z4^10*z5*z6+
    2*z2*z3*z4^11*z5*z6- 2*z3^2*z4^11*z5*z6- 8*z2*z4^12*z5*z6- 2*z3*z4^12*z5*z6+
    6*z4^13*z5*z6+ 6*z2*z3^13*z7- 4*z3^14*z7- 2*z2*z3^12*z4*z7+ 2*z3^13*z4*z7-
    2*z2*z3^11*z4^2*z7+ 2*z3^12*z4^2*z7- 2*z2*z3^10*z4^3*z7+ 2*z3^11*z4^3*z7-
    2*z2*z3^9*z4^4*z7+ 2*z3^10*z4^4*z7- 2*z2*z3^8*z4^5*z7+ 2*z3^9*z4^5*z7-
    2*z2*z3^7*z4^6*z7+ 2*z3^8*z4^6*z7- 2*z2*z3^6*z4^7*z7+ 2*z3^7*z4^7*z7-
    2*z2*z3^5*z4^8*z7+ 2*z3^6*z4^8*z7- 2*z2*z3^4*z4^9*z7+ 2*z3^5*z4^9*z7-
    2*z2*z3^3*z4^10*z7+ 2*z3^4*z4^10*z7- 2*z2*z3^2*z4^11*z7+ 2*z3^3*z4^11*z7-
    2*z2*z3*z4^12*z7+ 2*z3^2*z4^12*z7+ 6*z2*z4^13*z7+ 2*z3*z4^13*z7- 4*z4^14*z7-
    8*z2*z3^12*z5*z7+ 6*z3^13*z5*z7+ 2*z2*z3^11*z4*z5*z7- 2*z3^12*z4*z5*z7+
    2*z2*z3^10*z4^2*z5*z7- 2*z3^11*z4^2*z5*z7+ 2*z2*z3^9*z4^3*z5*z7-
    2*z3^10*z4^3*z5*z7+ 2*z2*z3^8*z4^4*z5*z7- 2*z3^9*z4^4*z5*z7+
    2*z2*z3^7*z4^5*z5*z7- 2*z3^8*z4^5*z5*z7+ 2*z2*z3^6*z4^6*z5*z7-
    2*z3^7*z4^6*z5*z7+ 2*z2*z3^5*z4^7*z5*z7- 2*z3^6*z4^7*z5*z7+
    2*z2*z3^4*z4^8*z5*z7- 2*z3^5*z4^8*z5*z7+ 2*z2*z3^3*z4^9*z5*z7-
    2*z3^4*z4^9*z5*z7+ 2*z2*z3^2*z4^10*z5*z7- 2*z3^3*z4^10*z5*z7+
    2*z2*z3*z4^11*z5*z7- 2*z3^2*z4^11*z5*z7- 8*z2*z4^12*z5*z7- 2*z3*z4^12*z5*z7+
    6*z4^13*z5*z7- 8*z2*z3^12*z6*z7+ 6*z3^13*z6*z7+ 2*z2*z3^11*z4*z6*z7-
    2*z3^12*z4*z6*z7+ 2*z2*z3^10*z4^2*z6*z7- 2*z3^11*z4^2*z6*z7+
    2*z2*z3^9*z4^3*z6*z7- 2*z3^10*z4^3*z6*z7+ 2*z2*z3^8*z4^4*z6*z7-
    2*z3^9*z4^4*z6*z7+ 2*z2*z3^7*z4^5*z6*z7- 2*z3^8*z4^5*z6*z7+
    2*z2*z3^6*z4^6*z6*z7- 2*z3^7*z4^6*z6*z7+ 2*z2*z3^5*z4^7*z6*z7-
    2*z3^6*z4^7*z6*z7+ 2*z2*z3^4*z4^8*z6*z7- 2*z3^5*z4^8*z6*z7+
    2*z2*z3^3*z4^9*z6*z7- 2*z3^4*z4^9*z6*z7+ 2*z2*z3^2*z4^10*z6*z7-
    2*z3^3*z4^10*z6*z7+ 2*z2*z3*z4^11*z6*z7- 2*z3^2*z4^11*z6*z7- 8*z2*z4^12*z6*z7-
    2*z3*z4^12*z6*z7+ 6*z4^13*z6*z7+ 10*z2*z3^11*z5*z6*z7- 8*z3^12*z5*z6*z7-
    2*z2*z3^10*z4*z5*z6*z7+ 2*z3^11*z4*z5*z6*z7- 2*z2*z3^9*z4^2*z5*z6*z7+
    2*z3^10*z4^2*z5*z6*z7- 2*z2*z3^8*z4^3*z5*z6*z7+ 2*z3^9*z4^3*z5*z6*z7-
    2*z2*z3^7*z4^4*z5*z6*z7+ 2*z3^8*z4^4*z5*z6*z7- 2*z2*z3^6*z4^5*z5*z6*z7+
    2*z3^7*z4^5*z5*z6*z7- 2*z2*z3^5*z4^6*z5*z6*z7+ 2*z3^6*z4^6*z5*z6*z7-
    2*z2*z3^4*z4^7*z5*z6*z7+ 2*z3^5*z4^7*z5*z6*z7- 2*z2*z3^3*z4^8*z5*z6*z7+
    2*z3^4*z4^8*z5*z6*z7- 2*z2*z3^2*z4^9*z5*z6*z7+ 2*z3^3*z4^9*z5*z6*z7-
    2*z2*z3*z4^10*z5*z6*z7+ 2*z3^2*z4^10*z5*z6*z7+ 10*z2*z4^11*z5*z6*z7+
    2*z3*z4^11*z5*z6*z7- 8*z4^12*z5*z6*z7- 13*z2*z3^12+ 10*z3^13- 3*z2*z3^11*z4-
    3*z3^12*z4- 3*z2*z3^10*z4^2- 3*z3^11*z4^2- 3*z2*z3^9*z4^3- 3*z3^10*z4^3-
    3*z2*z3^8*z4^4- 3*z3^9*z4^4- 3*z2*z3^7*z4^5- 3*z3^8*z4^5- 3*z2*z3^6*z4^6-
    3*z3^7*z4^6- 3*z2*z3^5*z4^7- 3*z3^6*z4^7- 3*z2*z3^4*z4^8- 3*z3^5*z4^8-
    3*z2*z3^3*z4^9- 3*z3^4*z4^9- 3*z2*z3^2*z4^10- 3*z3^3*z4^10- 3*z2*z3*z4^11-
    3*z3^2*z4^11- 13*z2*z4^12- 3*z3*z4^12+ 10*z4^13+ 10*z2*z3^11*z5- 13*z3^12*z5+
    11*z2*z3^10*z4*z5- 3*z3^11*z4*z5+ 11*z2*z3^9*z4^2*z5- 3*z3^10*z4^2*z5+
    11*z2*z3^8*z4^3*z5- 3*z3^9*z4^3*z5+ 11*z2*z3^7*z4^4*z5- 3*z3^8*z4^4*z5+
    11*z2*z3^6*z4^5*z5- 3*z3^7*z4^5*z5+ 11*z2*z3^5*z4^6*z5- 3*z3^6*z4^6*z5+
    11*z2*z3^4*z4^7*z5- 3*z3^5*z4^7*z5+ 11*z2*z3^3*z4^8*z5- 3*z3^4*z4^8*z5+
    11*z2*z3^2*z4^9*z5- 3*z3^3*z4^9*z5+ 11*z2*z3*z4^10*z5- 3*z3^2*z4^10*z5+
    10*z2*z4^11*z5- 3*z3*z4^11*z5- 13*z4^12*z5+ 10*z2*z3^11*z6- 13*z3^12*z6+
    11*z2*z3^10*z4*z6- 3*z3^11*z4*z6+ 11*z2*z3^9*z4^2*z6- 3*z3^10*z4^2*z6+
    11*z2*z3^8*z4^3*z6- 3*z3^9*z4^3*z6+ 11*z2*z3^7*z4^4*z6- 3*z3^8*z4^4*z6+
    11*z2*z3^6*z4^5*z6- 3*z3^7*z4^5*z6+ 11*z2*z3^5*z4^6*z6- 3*z3^6*z4^6*z6+
    11*z2*z3^4*z4^7*z6- 3*z3^5*z4^7*z6+ 11*z2*z3^3*z4^8*z6- 3*z3^4*z4^8*z6+
    11*z2*z3^2*z4^9*z6- 3*z3^3*z4^9*z6+ 11*z2*z3*z4^10*z6- 3*z3^2*z4^10*z6+
    10*z2*z4^11*z6- 3*z3*z4^11*z6- 13*z4^12*z6+ z2*z3^10*z5*z6+ 10*z3^11*z5*z6-
    21*z2*z3^9*z4*z5*z6+ 11*z3^10*z4*z5*z6- 21*z2*z3^8*z4^2*z5*z6+
    11*z3^9*z4^2*z5*z6- 21*z2*z3^7*z4^3*z5*z6+ 11*z3^8*z4^3*z5*z6-
    21*z2*z3^6*z4^4*z5*z6+ 11*z3^7*z4^4*z5*z6- 21*z2*z3^5*z4^5*z5*z6+
    11*z3^6*z4^5*z5*z6- 21*z2*z3^4*z4^6*z5*z6+ 11*z3^5*z4^6*z5*z6-
    21*z2*z3^3*z4^7*z5*z6+ 11*z3^4*z4^7*z5*z6- 21*z2*z3^2*z4^8*z5*z6+
    11*z3^3*z4^8*z5*z6- 21*z2*z3*z4^9*z5*z6+ 11*z3^2*z4^9*z5*z6+ z2*z4^10*z5*z6+
    11*z3*z4^10*z5*z6+ 10*z4^11*z5*z6+ 10*z2*z3^11*z7- 13*z3^12*z7+
    11*z2*z3^10*z4*z7- 3*z3^11*z4*z7+ 11*z2*z3^9*z4^2*z7- 3*z3^10*z4^2*z7+
    11*z2*z3^8*z4^3*z7- 3*z3^9*z4^3*z7+ 11*z2*z3^7*z4^4*z7- 3*z3^8*z4^4*z7+
    11*z2*z3^6*z4^5*z7- 3*z3^7*z4^5*z7+ 11*z2*z3^5*z4^6*z7- 3*z3^6*z4^6*z7+
    11*z2*z3^4*z4^7*z7- 3*z3^5*z4^7*z7+ 11*z2*z3^3*z4^8*z7- 3*z3^4*z4^8*z7+
    11*z2*z3^2*z4^9*z7- 3*z3^3*z4^9*z7+ 11*z2*z3*z4^10*z7- 3*z3^2*z4^10*z7+
    10*z2*z4^11*z7- 3*z3*z4^11*z7- 13*z4^12*z7+ z2*z3^10*z5*z7+ 10*z3^11*z5*z7-
    21*z2*z3^9*z4*z5*z7+ 11*z3^10*z4*z5*z7- 21*z2*z3^8*z4^2*z5*z7+
    11*z3^9*z4^2*z5*z7- 21*z2*z3^7*z4^3*z5*z7+ 11*z3^8*z4^3*z5*z7-
    21*z2*z3^6*z4^4*z5*z7+ 11*z3^7*z4^4*z5*z7- 21*z2*z3^5*z4^5*z5*z7+
    11*z3^6*z4^5*z5*z7- 21*z2*z3^4*z4^6*z5*z7+ 11*z3^5*z4^6*z5*z7-
    21*z2*z3^3*z4^7*z5*z7+ 11*z3^4*z4^7*z5*z7- 21*z2*z3^2*z4^8*z5*z7+
    11*z3^3*z4^8*z5*z7- 21*z2*z3*z4^9*z5*z7+ 11*z3^2*z4^9*z5*z7+ z2*z4^10*z5*z7+
    11*z3*z4^10*z5*z7+ 10*z4^11*z5*z7+ z2*z3^10*z6*z7+ 10*z3^11*z6*z7-
    21*z2*z3^9*z4*z6*z7+ 11*z3^10*z4*z6*z7- 21*z2*z3^8*z4^2*z6*z7+
    11*z3^9*z4^2*z6*z7- 21*z2*z3^7*z4^3*z6*z7+ 11*z3^8*z4^3*z6*z7-
    21*z2*z3^6*z4^4*z6*z7+ 11*z3^7*z4^4*z6*z7- 21*z2*z3^5*z4^5*z6*z7+
    11*z3^6*z4^5*z6*z7- 21*z2*z3^4*z4^6*z6*z7+ 11*z3^5*z4^6*z6*z7-
    21*z2*z3^3*z4^7*z6*z7+ 11*z3^4*z4^7*z6*z7- 21*z2*z3^2*z4^8*z6*z7+
    11*z3^3*z4^8*z6*z7- 21*z2*z3*z4^9*z6*z7+ 11*z3^2*z4^9*z6*z7+ z2*z4^10*z6*z7+
    11*z3*z4^10*z6*z7+ 10*z4^11*z6*z7- 22*z2*z3^9*z5*z6*z7+ z3^10*z5*z6*z7+
    33*z2*z3^8*z4*z5*z6*z7- 21*z3^9*z4*z5*z6*z7+ 33*z2*z3^7*z4^2*z5*z6*z7-
    21*z3^8*z4^2*z5*z6*z7+ 33*z2*z3^6*z4^3*z5*z6*z7- 21*z3^7*z4^3*z5*z6*z7+
    33*z2*z3^5*z4^4*z5*z6*z7- 21*z3^6*z4^4*z5*z6*z7+ 33*z2*z3^4*z4^5*z5*z6*z7-
    21*z3^5*z4^5*z5*z6*z7+ 33*z2*z3^3*z4^6*z5*z6*z7- 21*z3^4*z4^6*z5*z6*z7+
    33*z2*z3^2*z4^7*z5*z6*z7- 21*z3^3*z4^7*z5*z6*z7+ 33*z2*z3*z4^8*z5*z6*z7-
    21*z3^2*z4^8*z5*z6*z7- 22*z2*z4^9*z5*z6*z7- 21*z3*z4^9*z5*z6*z7+
    z4^10*z5*z6*z7- 12*z2*z3^10- 1107*z3^11+ 1109*z2*z3^9*z4- 1119*z3^10*z4+
    1109*z2*z3^8*z4^2- 1119*z3^9*z4^2+ 1109*z2*z3^7*z4^3- 1119*z3^8*z4^3+
    1109*z2*z3^6*z4^4- 1119*z3^7*z4^4+ 1109*z2*z3^5*z4^5- 1119*z3^6*z4^5+
    1109*z2*z3^4*z4^6- 1119*z3^5*z4^6+ 1109*z2*z3^3*z4^7- 1119*z3^4*z4^7+
    1109*z2*z3^2*z4^8- 1119*z3^3*z4^8+ 1109*z2*z3*z4^9- 1119*z3^2*z4^9-
    12*z2*z4^10- 1119*z3*z4^10- 1107*z4^11+ 1121*z2*z3^9*z5- 12*z3^10*z5-
    1110*z2*z3^8*z4*z5+ 1109*z3^9*z4*z5- 1110*z2*z3^7*z4^2*z5+ 1109*z3^8*z4^2*z5-
    1110*z2*z3^6*z4^3*z5+ 1109*z3^7*z4^3*z5- 1110*z2*z3^5*z4^4*z5+
    1109*z3^6*z4^4*z5- 1110*z2*z3^4*z4^5*z5+ 1109*z3^5*z4^5*z5-
    1110*z2*z3^3*z4^6*z5+ 1109*z3^4*z4^6*z5- 1110*z2*z3^2*z4^7*z5+
    1109*z3^3*z4^7*z5- 1110*z2*z3*z4^8*z5+ 1109*z3^2*z4^8*z5+ 1121*z2*z4^9*z5+
    1109*z3*z4^9*z5- 12*z4^10*z5+ 1121*z2*z3^9*z6- 12*z3^10*z6-
    1110*z2*z3^8*z4*z6+ 1109*z3^9*z4*z6- 1110*z2*z3^7*z4^2*z6+ 1109*z3^8*z4^2*z6-
    1110*z2*z3^6*z4^3*z6+ 1109*z3^7*z4^3*z6- 1110*z2*z3^5*z4^4*z6+
    1109*z3^6*z4^4*z6- 1110*z2*z3^4*z4^5*z6+ 1109*z3^5*z4^5*z6-
    1110*z2*z3^3*z4^6*z6+ 1109*z3^4*z4^6*z6- 1110*z2*z3^2*z4^7*z6+
    1109*z3^3*z4^7*z6- 1110*z2*z3*z4^8*z6+ 1109*z3^2*z4^8*z6+ 1121*z2*z4^9*z6+
    1109*z3*z4^9*z6- 12*z4^10*z6- 2231*z2*z3^8*z5*z6+ 1121*z3^9*z5*z6+
    1132*z2*z3^7*z4*z5*z6- 1110*z3^8*z4*z5*z6+ 1132*z2*z3^6*z4^2*z5*z6-
    1110*z3^7*z4^2*z5*z6+ 1132*z2*z3^5*z4^3*z5*z6- 1110*z3^6*z4^3*z5*z6+
    1132*z2*z3^4*z4^4*z5*z6- 1110*z3^5*z4^4*z5*z6+ 1132*z2*z3^3*z4^5*z5*z6-
    1110*z3^4*z4^5*z5*z6+ 1132*z2*z3^2*z4^6*z5*z6- 1110*z3^3*z4^6*z5*z6+
    1132*z2*z3*z4^7*z5*z6- 1110*z3^2*z4^7*z5*z6- 2231*z2*z4^8*z5*z6-
    1110*z3*z4^8*z5*z6+ 1121*z4^9*z5*z6+ 1121*z2*z3^9*z7- 12*z3^10*z7-
    1110*z2*z3^8*z4*z7+ 1109*z3^9*z4*z7- 1110*z2*z3^7*z4^2*z7+ 1109*z3^8*z4^2*z7-
    1110*z2*z3^6*z4^3*z7+ 1109*z3^7*z4^3*z7- 1110*z2*z3^5*z4^4*z7+
    1109*z3^6*z4^4*z7- 1110*z2*z3^4*z4^5*z7+ 1109*z3^5*z4^5*z7-
    1110*z2*z3^3*z4^6*z7+ 1109*z3^4*z4^6*z7- 1110*z2*z3^2*z4^7*z7+
    1109*z3^3*z4^7*z7- 1110*z2*z3*z4^8*z7+ 1109*z3^2*z4^8*z7+ 1121*z2*z4^9*z7+
    1109*z3*z4^9*z7- 12*z4^10*z7- 2231*z2*z3^8*z5*z7+ 1121*z3^9*z5*z7+
    1132*z2*z3^7*z4*z5*z7- 1110*z3^8*z4*z5*z7+ 1132*z2*z3^6*z4^2*z5*z7-
    1110*z3^7*z4^2*z5*z7+ 1132*z2*z3^5*z4^3*z5*z7- 1110*z3^6*z4^3*z5*z7+
    1132*z2*z3^4*z4^4*z5*z7- 1110*z3^5*z4^4*z5*z7+ 1132*z2*z3^3*z4^5*z5*z7-
    1110*z3^4*z4^5*z5*z7+ 1132*z2*z3^2*z4^6*z5*z7- 1110*z3^3*z4^6*z5*z7+
    1132*z2*z3*z4^7*z5*z7- 1110*z3^2*z4^7*z5*z7- 2231*z2*z4^8*z5*z7-
    1110*z3*z4^8*z5*z7+ 1121*z4^9*z5*z7- 2231*z2*z3^8*z6*z7+ 1121*z3^9*z6*z7+
    1132*z2*z3^7*z4*z6*z7- 1110*z3^8*z4*z6*z7+ 1132*z2*z3^6*z4^2*z6*z7-
    1110*z3^7*z4^2*z6*z7+ 1132*z2*z3^5*z4^3*z6*z7- 1110*z3^6*z4^3*z6*z7+
    1132*z2*z3^4*z4^4*z6*z7- 1110*z3^5*z4^4*z6*z7+ 1132*z2*z3^3*z4^5*z6*z7-
    1110*z3^4*z4^5*z6*z7+ 1132*z2*z3^2*z4^6*z6*z7- 1110*z3^3*z4^6*z6*z7+
    1132*z2*z3*z4^7*z6*z7- 1110*z3^2*z4^7*z6*z7- 2231*z2*z4^8*z6*z7-
    1110*z3*z4^8*z6*z7+ 1121*z4^9*z6*z7+ 3363*z2*z3^7*z5*z6*z7-
    2231*z3^8*z5*z6*z7- 1187*z2*z3^6*z4*z5*z6*z7+ 1132*z3^7*z4*z5*z6*z7-
    1187*z2*z3^5*z4^2*z5*z6*z7+ 1132*z3^6*z4^2*z5*z6*z7-
    1187*z2*z3^4*z4^3*z5*z6*z7+ 1132*z3^5*z4^3*z5*z6*z7-
    1187*z2*z3^3*z4^4*z5*z6*z7+ 1132*z3^4*z4^4*z5*z6*z7-
    1187*z2*z3^2*z4^5*z5*z6*z7+ 1132*z3^3*z4^5*z5*z6*z7- 1187*z2*z3*z4^6*z5*z6*z7+
    1132*z3^2*z4^6*z5*z6*z7+ 3363*z2*z4^7*z5*z6*z7+ 1132*z3*z4^7*z5*z6*z7-
    2231*z4^8*z5*z6*z7- 3374*z2*z3^8+ 2264*z3^9- 11*z2*z3^7*z4- 1110*z3^8*z4-
    11*z2*z3^6*z4^2- 1110*z3^7*z4^2- 11*z2*z3^5*z4^3- 1110*z3^6*z4^3-
    11*z2*z3^4*z4^4- 1110*z3^5*z4^4- 11*z2*z3^3*z4^5- 1110*z3^4*z4^5-
    11*z2*z3^2*z4^6- 1110*z3^3*z4^6- 11*z2*z3*z4^7- 1110*z3^2*z4^7- 3374*z2*z4^8-
    1110*z3*z4^8+ 2264*z4^9+ 3363*z2*z3^7*z5- 3374*z3^8*z5+ 2242*z2*z3^6*z4*z5-
    11*z3^7*z4*z5+ 2242*z2*z3^5*z4^2*z5- 11*z3^6*z4^2*z5+ 2242*z2*z3^4*z4^3*z5-
    11*z3^5*z4^3*z5+ 2242*z2*z3^3*z4^4*z5- 11*z3^4*z4^4*z5+ 2242*z2*z3^2*z4^5*z5-
    11*z3^3*z4^5*z5+ 2242*z2*z3*z4^6*z5- 11*z3^2*z4^6*z5+ 3363*z2*z4^7*z5-
    11*z3*z4^7*z5- 3374*z4^8*z5+ 3363*z2*z3^7*z6- 3374*z3^8*z6+
    2242*z2*z3^6*z4*z6- 11*z3^7*z4*z6+ 2242*z2*z3^5*z4^2*z6- 11*z3^6*z4^2*z6+
    2242*z2*z3^4*z4^3*z6- 11*z3^5*z4^3*z6+ 2242*z2*z3^3*z4^4*z6- 11*z3^4*z4^4*z6+
    2242*z2*z3^2*z4^5*z6- 11*z3^3*z4^5*z6+ 2242*z2*z3*z4^6*z6- 11*z3^2*z4^6*z6+
    3363*z2*z4^7*z6- 11*z3*z4^7*z6- 3374*z4^8*z6- 1121*z2*z3^6*z5*z6+
    3363*z3^7*z5*z6+ 3396*z2*z3^5*z4*z5*z6+ 2242*z3^6*z4*z5*z6+
    3396*z2*z3^4*z4^2*z5*z6+ 2242*z3^5*z4^2*z5*z6+ 3396*z2*z3^3*z4^3*z5*z6+
    2242*z3^4*z4^3*z5*z6+ 3396*z2*z3^2*z4^4*z5*z6+ 2242*z3^3*z4^4*z5*z6+
    3396*z2*z3*z4^5*z5*z6+ 2242*z3^2*z4^5*z5*z6- 1121*z2*z4^6*z5*z6+
    2242*z3*z4^6*z5*z6+ 3363*z4^7*z5*z6+ 3363*z2*z3^7*z7- 3374*z3^8*z7+
    2242*z2*z3^6*z4*z7- 11*z3^7*z4*z7+ 2242*z2*z3^5*z4^2*z7- 11*z3^6*z4^2*z7+
    2242*z2*z3^4*z4^3*z7- 11*z3^5*z4^3*z7+ 2242*z2*z3^3*z4^4*z7- 11*z3^4*z4^4*z7+
    2242*z2*z3^2*z4^5*z7- 11*z3^3*z4^5*z7+ 2242*z2*z3*z4^6*z7- 11*z3^2*z4^6*z7+
    3363*z2*z4^7*z7- 11*z3*z4^7*z7- 3374*z4^8*z7- 1121*z2*z3^6*z5*z7+
    3363*z3^7*z5*z7+ 3396*z2*z3^5*z4*z5*z7+ 2242*z3^6*z4*z5*z7+
    3396*z2*z3^4*z4^2*z5*z7+ 2242*z3^5*z4^2*z5*z7+ 3396*z2*z3^3*z4^3*z5*z7+
    2242*z3^4*z4^3*z5*z7+ 3396*z2*z3^2*z4^4*z5*z7+ 2242*z3^3*z4^4*z5*z7+
    3396*z2*z3*z4^5*z5*z7+ 2242*z3^2*z4^5*z5*z7- 1121*z2*z4^6*z5*z7+
    2242*z3*z4^6*z5*z7+ 3363*z4^7*z5*z7- 1121*z2*z3^6*z6*z7+ 3363*z3^7*z6*z7+
    3396*z2*z3^5*z4*z6*z7+ 2242*z3^6*z4*z6*z7+ 3396*z2*z3^4*z4^2*z6*z7+
    2242*z3^5*z4^2*z6*z7+ 3396*z2*z3^3*z4^3*z6*z7+ 2242*z3^4*z4^3*z6*z7+
    3396*z2*z3^2*z4^4*z6*z7+ 2242*z3^3*z4^4*z6*z7+ 3396*z2*z3*z4^5*z6*z7+
    2242*z3^2*z4^5*z6*z7- 1121*z2*z4^6*z6*z7+ 2242*z3*z4^6*z6*z7+ 3363*z4^7*z6*z7-
    4484*z2*z3^5*z5*z6*z7- 1121*z3^6*z5*z6*z7+ 1154*z2*z3^4*z4*z5*z6*z7+
    3396*z3^5*z4*z5*z6*z7+ 1154*z2*z3^3*z4^2*z5*z6*z7+ 3396*z3^4*z4^2*z5*z6*z7+
    1154*z2*z3^2*z4^3*z5*z6*z7+ 3396*z3^3*z4^3*z5*z6*z7+ 1154*z2*z3*z4^4*z5*z6*z7+
    3396*z3^2*z4^4*z5*z6*z7- 4484*z2*z4^5*z5*z6*z7+ 3396*z3*z4^5*z5*z6*z7-
    1121*z4^6*z5*z6*z7+ 147*z2*z3^6+ 2604*z3^7+ 2887*z2*z3^5*z4+ 2751*z3^6*z4+
    2887*z2*z3^4*z4^2+ 2751*z3^5*z4^2+ 2887*z2*z3^3*z4^3+ 2751*z3^4*z4^3+
    2887*z2*z3^2*z4^4+ 2751*z3^3*z4^4+ 2887*z2*z3*z4^5+ 2751*z3^2*z4^5+
    147*z2*z4^6+ 2751*z3*z4^6+ 2604*z4^7+ 2740*z2*z3^5*z5+ 147*z3^6*z5-
    1766*z2*z3^4*z4*z5+ 2887*z3^5*z4*z5- 1766*z2*z3^3*z4^2*z5+ 2887*z3^4*z4^2*z5-
    1766*z2*z3^2*z4^3*z5+ 2887*z3^3*z4^3*z5- 1766*z2*z3*z4^4*z5+
    2887*z3^2*z4^4*z5+ 2740*z2*z4^5*z5+ 2887*z3*z4^5*z5+ 147*z4^6*z5+
    2740*z2*z3^5*z6+ 147*z3^6*z6- 1766*z2*z3^4*z4*z6+ 2887*z3^5*z4*z6-
    1766*z2*z3^3*z4^2*z6+ 2887*z3^4*z4^2*z6- 1766*z2*z3^2*z4^3*z6+
    2887*z3^3*z4^3*z6- 1766*z2*z3*z4^4*z6+ 2887*z3^2*z4^4*z6+ 2740*z2*z4^5*z6+
    2887*z3*z4^5*z6+ 147*z4^6*z6+ 4495*z2*z3^4*z5*z6+ 2740*z3^5*z5*z6-
    2751*z2*z3^3*z4*z5*z6- 1766*z3^4*z4*z5*z6- 2751*z2*z3^2*z4^2*z5*z6-
    1766*z3^3*z4^2*z5*z6- 2751*z2*z3*z4^3*z5*z6- 1766*z3^2*z4^3*z5*z6+
    4495*z2*z4^4*z5*z6- 1766*z3*z4^4*z5*z6+ 2740*z4^5*z5*z6+ 2740*z2*z3^5*z7+
    147*z3^6*z7- 1766*z2*z3^4*z4*z7+ 2887*z3^5*z4*z7- 1766*z2*z3^3*z4^2*z7+
    2887*z3^4*z4^2*z7- 1766*z2*z3^2*z4^3*z7+ 2887*z3^3*z4^3*z7-
    1766*z2*z3*z4^4*z7+ 2887*z3^2*z4^4*z7+ 2740*z2*z4^5*z7+ 2887*z3*z4^5*z7+
    147*z4^6*z7+ 4495*z2*z3^4*z5*z7+ 2740*z3^5*z5*z7- 2751*z2*z3^3*z4*z5*z7-
    1766*z3^4*z4*z5*z7- 2751*z2*z3^2*z4^2*z5*z7- 1766*z3^3*z4^2*z5*z7-
    2751*z2*z3*z4^3*z5*z7- 1766*z3^2*z4^3*z5*z7+ 4495*z2*z4^4*z5*z7-
    1766*z3*z4^4*z5*z7+ 2740*z4^5*z5*z7+ 4495*z2*z3^4*z6*z7+ 2740*z3^5*z6*z7-
    2751*z2*z3^3*z4*z6*z7- 1766*z3^4*z4*z6*z7- 2751*z2*z3^2*z4^2*z6*z7-
    1766*z3^3*z4^2*z6*z7- 2751*z2*z3*z4^3*z6*z7- 1766*z3^2*z4^3*z6*z7+
    4495*z2*z4^4*z6*z7- 1766*z3*z4^4*z6*z7+ 2740*z4^5*z6*z7+
    1755*z2*z3^3*z5*z6*z7+ 4495*z3^4*z5*z6*z7- 2887*z2*z3^2*z4*z5*z6*z7-
    2751*z3^3*z4*z5*z6*z7- 2887*z2*z3*z4^2*z5*z6*z7- 2751*z3^2*z4^2*z5*z6*z7+
    1755*z2*z4^3*z5*z6*z7- 2751*z3*z4^3*z5*z6*z7+ 4495*z4^4*z5*z6*z7+ 318*z2*z3^4+
    2037*z3^5+ 3906*z2*z3^3*z4+ 2355*z3^4*z4+ 3906*z2*z3^2*z4^2+ 2355*z3^3*z4^2+
    3906*z2*z3*z4^3+ 2355*z3^2*z4^3+ 318*z2*z4^4+ 2355*z3*z4^4+ 2037*z4^5+
    3588*z2*z3^3*z5+ 318*z3^4*z5+ 600*z2*z3^2*z4*z5+ 3906*z3^3*z4*z5+
    600*z2*z3*z4^2*z5+ 3906*z3^2*z4^2*z5+ 3588*z2*z4^3*z5+ 3906*z3*z4^3*z5+
    318*z4^4*z5+ 3588*z2*z3^3*z6+ 318*z3^4*z6+ 600*z2*z3^2*z4*z6+ 3906*z3^3*z4*z6+
    600*z2*z3*z4^2*z6+ 3906*z3^2*z4^2*z6+ 3588*z2*z4^3*z6+ 3906*z3*z4^3*z6+
    318*z4^4*z6- 2988*z2*z3^2*z5*z6+ 3588*z3^3*z5*z6- 2355*z2*z3*z4*z5*z6+
    600*z3^2*z4*z5*z6- 2988*z2*z4^2*z5*z6+ 600*z3*z4^2*z5*z6+ 3588*z4^3*z5*z6+
    3588*z2*z3^3*z7+ 318*z3^4*z7+ 600*z2*z3^2*z4*z7+ 3906*z3^3*z4*z7+
    600*z2*z3*z4^2*z7+ 3906*z3^2*z4^2*z7+ 3588*z2*z4^3*z7+ 3906*z3*z4^3*z7+
    318*z4^4*z7- 2988*z2*z3^2*z5*z7+ 3588*z3^3*z5*z7- 2355*z2*z3*z4*z5*z7+
    600*z3^2*z4*z5*z7- 2988*z2*z4^2*z5*z7+ 600*z3*z4^2*z5*z7+ 3588*z4^3*z5*z7-
    2988*z2*z3^2*z6*z7+ 3588*z3^3*z6*z7- 2355*z2*z3*z4*z6*z7+ 600*z3^2*z4*z6*z7-
    2988*z2*z4^2*z6*z7+ 600*z3*z4^2*z6*z7+ 3588*z4^3*z6*z7+ 633*z2*z3*z5*z6*z7-
    2988*z3^2*z5*z6*z7+ 633*z2*z4*z5*z6*z7- 2355*z3*z4*z5*z6*z7-
    2988*z4^2*z5*z6*z7- 1776*z2*z3^2+ 2166*z3^3- 3978*z2*z3*z4+ 390*z3^2*z4-
    1776*z2*z4^2+ 390*z3*z4^2+ 2166*z4^3- 2202*z2*z3*z5- 1776*z3^2*z5-
    2202*z2*z4*z5- 3978*z3*z4*z5- 1776*z4^2*z5- 2202*z2*z3*z6- 1776*z3^2*z6-
    2202*z2*z4*z6- 3978*z3*z4*z6- 1776*z4^2*z6- 1068*z2*z5*z6- 2202*z3*z5*z6-
    2202*z4*z5*z6- 2202*z2*z3*z7- 1776*z3^2*z7- 2202*z2*z4*z7- 3978*z3*z4*z7-
    1776*z4^2*z7- 1068*z2*z5*z7- 2202*z3*z5*z7- 2202*z4*z5*z7- 1068*z2*z6*z7-
    2202*z3*z6*z7- 2202*z4*z6*z7- 1068*z5*z6*z7+ 3538*z2- 1169*z3- 1169*z4+
    3538*z5+ 3538*z6+ 3538*z7, - 4*z2*z3^14+ 2*z3^15+ 6*z2*z3^13*z4- 4*z3^14*z4+
    2*z2*z3^13*z5- 2*z3^14*z5- 2*z2*z3^12*z4*z5+ 2*z3^13*z4*z5+ 2*z2*z3^12*z5^2-
    2*z3^13*z5^2- 2*z2*z3^11*z4*z5^2+ 2*z3^12*z4*z5^2+ 2*z2*z3^11*z5^3-
    2*z3^12*z5^3- 2*z2*z3^10*z4*z5^3+ 2*z3^11*z4*z5^3+ 2*z2*z3^10*z5^4-
    2*z3^11*z5^4- 2*z2*z3^9*z4*z5^4+ 2*z3^10*z4*z5^4+ 2*z2*z3^9*z5^5-
    2*z3^10*z5^5- 2*z2*z3^8*z4*z5^5+ 2*z3^9*z4*z5^5+ 2*z2*z3^8*z5^6- 2*z3^9*z5^6-
    2*z2*z3^7*z4*z5^6+ 2*z3^8*z4*z5^6+ 2*z2*z3^7*z5^7- 2*z3^8*z5^7-
    2*z2*z3^6*z4*z5^7+ 2*z3^7*z4*z5^7+ 2*z2*z3^6*z5^8- 2*z3^7*z5^8-
    2*z2*z3^5*z4*z5^8+ 2*z3^6*z4*z5^8+ 2*z2*z3^5*z5^9- 2*z3^6*z5^9-
    2*z2*z3^4*z4*z5^9+ 2*z3^5*z4*z5^9+ 2*z2*z3^4*z5^10- 2*z3^5*z5^10-
    2*z2*z3^3*z4*z5^10+ 2*z3^4*z4*z5^10+ 2*z2*z3^3*z5^11- 2*z3^4*z5^11-
    2*z2*z3^2*z4*z5^11+ 2*z3^3*z4*z5^11+ 2*z2*z3^2*z5^12- 2*z3^3*z5^12-
    2*z2*z3*z4*z5^12+ 2*z3^2*z4*z5^12+ 2*z2*z3*z5^13- 2*z3^2*z5^13+ 6*z2*z4*z5^13+
    2*z3*z4*z5^13- 4*z2*z5^14- 2*z3*z5^14- 4*z4*z5^14+ 2*z5^15+ 6*z2*z3^13*z6-
    4*z3^14*z6- 8*z2*z3^12*z4*z6+ 6*z3^13*z4*z6- 2*z2*z3^12*z5*z6+ 2*z3^13*z5*z6+
    2*z2*z3^11*z4*z5*z6- 2*z3^12*z4*z5*z6- 2*z2*z3^11*z5^2*z6+ 2*z3^12*z5^2*z6+
    2*z2*z3^10*z4*z5^2*z6- 2*z3^11*z4*z5^2*z6- 2*z2*z3^10*z5^3*z6+
    2*z3^11*z5^3*z6+ 2*z2*z3^9*z4*z5^3*z6- 2*z3^10*z4*z5^3*z6- 2*z2*z3^9*z5^4*z6+
    2*z3^10*z5^4*z6+ 2*z2*z3^8*z4*z5^4*z6- 2*z3^9*z4*z5^4*z6- 2*z2*z3^8*z5^5*z6+
    2*z3^9*z5^5*z6+ 2*z2*z3^7*z4*z5^5*z6- 2*z3^8*z4*z5^5*z6- 2*z2*z3^7*z5^6*z6+
    2*z3^8*z5^6*z6+ 2*z2*z3^6*z4*z5^6*z6- 2*z3^7*z4*z5^6*z6- 2*z2*z3^6*z5^7*z6+
    2*z3^7*z5^7*z6+ 2*z2*z3^5*z4*z5^7*z6- 2*z3^6*z4*z5^7*z6- 2*z2*z3^5*z5^8*z6+
    2*z3^6*z5^8*z6+ 2*z2*z3^4*z4*z5^8*z6- 2*z3^5*z4*z5^8*z6- 2*z2*z3^4*z5^9*z6+
    2*z3^5*z5^9*z6+ 2*z2*z3^3*z4*z5^9*z6- 2*z3^4*z4*z5^9*z6- 2*z2*z3^3*z5^10*z6+
    2*z3^4*z5^10*z6+ 2*z2*z3^2*z4*z5^10*z6- 2*z3^3*z4*z5^10*z6-
    2*z2*z3^2*z5^11*z6+ 2*z3^3*z5^11*z6+ 2*z2*z3*z4*z5^11*z6- 2*z3^2*z4*z5^11*z6-
    2*z2*z3*z5^12*z6+ 2*z3^2*z5^12*z6- 8*z2*z4*z5^12*z6- 2*z3*z4*z5^12*z6+
    6*z2*z5^13*z6+ 2*z3*z5^13*z6+ 6*z4*z5^13*z6- 4*z5^14*z6+ 6*z2*z3^13*z7-
    4*z3^14*z7- 8*z2*z3^12*z4*z7+ 6*z3^13*z4*z7- 2*z2*z3^12*z5*z7+ 2*z3^13*z5*z7+
    2*z2*z3^11*z4*z5*z7- 2*z3^12*z4*z5*z7- 2*z2*z3^11*z5^2*z7+ 2*z3^12*z5^2*z7+
    2*z2*z3^10*z4*z5^2*z7- 2*z3^11*z4*z5^2*z7- 2*z2*z3^10*z5^3*z7+
    2*z3^11*z5^3*z7+ 2*z2*z3^9*z4*z5^3*z7- 2*z3^10*z4*z5^3*z7- 2*z2*z3^9*z5^4*z7+
    2*z3^10*z5^4*z7+ 2*z2*z3^8*z4*z5^4*z7- 2*z3^9*z4*z5^4*z7- 2*z2*z3^8*z5^5*z7+
    2*z3^9*z5^5*z7+ 2*z2*z3^7*z4*z5^5*z7- 2*z3^8*z4*z5^5*z7- 2*z2*z3^7*z5^6*z7+
    2*z3^8*z5^6*z7+ 2*z2*z3^6*z4*z5^6*z7- 2*z3^7*z4*z5^6*z7- 2*z2*z3^6*z5^7*z7+
    2*z3^7*z5^7*z7+ 2*z2*z3^5*z4*z5^7*z7- 2*z3^6*z4*z5^7*z7- 2*z2*z3^5*z5^8*z7+
    2*z3^6*z5^8*z7+ 2*z2*z3^4*z4*z5^8*z7- 2*z3^5*z4*z5^8*z7- 2*z2*z3^4*z5^9*z7+
    2*z3^5*z5^9*z7+ 2*z2*z3^3*z4*z5^9*z7- 2*z3^4*z4*z5^9*z7- 2*z2*z3^3*z5^10*z7+
    2*z3^4*z5^10*z7+ 2*z2*z3^2*z4*z5^10*z7- 2*z3^3*z4*z5^10*z7-
    2*z2*z3^2*z5^11*z7+ 2*z3^3*z5^11*z7+ 2*z2*z3*z4*z5^11*z7- 2*z3^2*z4*z5^11*z7-
    2*z2*z3*z5^12*z7+ 2*z3^2*z5^12*z7- 8*z2*z4*z5^12*z7- 2*z3*z4*z5^12*z7+
    6*z2*z5^13*z7+ 2*z3*z5^13*z7+ 6*z4*z5^13*z7- 4*z5^14*z7- 8*z2*z3^12*z6*z7+
    6*z3^13*z6*z7+ 10*z2*z3^11*z4*z6*z7- 8*z3^12*z4*z6*z7+ 2*z2*z3^11*z5*z6*z7-
    2*z3^12*z5*z6*z7- 2*z2*z3^10*z4*z5*z6*z7+ 2*z3^11*z4*z5*z6*z7+
    2*z2*z3^10*z5^2*z6*z7- 2*z3^11*z5^2*z6*z7- 2*z2*z3^9*z4*z5^2*z6*z7+
    2*z3^10*z4*z5^2*z6*z7+ 2*z2*z3^9*z5^3*z6*z7- 2*z3^10*z5^3*z6*z7-
    2*z2*z3^8*z4*z5^3*z6*z7+ 2*z3^9*z4*z5^3*z6*z7+ 2*z2*z3^8*z5^4*z6*z7-
    2*z3^9*z5^4*z6*z7- 2*z2*z3^7*z4*z5^4*z6*z7+ 2*z3^8*z4*z5^4*z6*z7+
    2*z2*z3^7*z5^5*z6*z7- 2*z3^8*z5^5*z6*z7- 2*z2*z3^6*z4*z5^5*z6*z7+
    2*z3^7*z4*z5^5*z6*z7+ 2*z2*z3^6*z5^6*z6*z7- 2*z3^7*z5^6*z6*z7-
    2*z2*z3^5*z4*z5^6*z6*z7+ 2*z3^6*z4*z5^6*z6*z7+ 2*z2*z3^5*z5^7*z6*z7-
    2*z3^6*z5^7*z6*z7- 2*z2*z3^4*z4*z5^7*z6*z7+ 2*z3^5*z4*z5^7*z6*z7+
    2*z2*z3^4*z5^8*z6*z7- 2*z3^5*z5^8*z6*z7- 2*z2*z3^3*z4*z5^8*z6*z7+
    2*z3^4*z4*z5^8*z6*z7+ 2*z2*z3^3*z5^9*z6*z7- 2*z3^4*z5^9*z6*z7-
    2*z2*z3^2*z4*z5^9*z6*z7+ 2*z3^3*z4*z5^9*z6*z7+ 2*z2*z3^2*z5^10*z6*z7-
    2*z3^3*z5^10*z6*z7- 2*z2*z3*z4*z5^10*z6*z7+ 2*z3^2*z4*z5^10*z6*z7+
    2*z2*z3*z5^11*z6*z7- 2*z3^2*z5^11*z6*z7+ 10*z2*z4*z5^11*z6*z7+
    2*z3*z4*z5^11*z6*z7- 8*z2*z5^12*z6*z7- 2*z3*z5^12*z6*z7- 8*z4*z5^12*z6*z7+
    6*z5^13*z6*z7- 13*z2*z3^12+ 10*z3^13+ 10*z2*z3^11*z4- 13*z3^12*z4-
    3*z2*z3^11*z5- 3*z3^12*z5+ 11*z2*z3^10*z4*z5- 3*z3^11*z4*z5- 3*z2*z3^10*z5^2-
    3*z3^11*z5^2+ 11*z2*z3^9*z4*z5^2- 3*z3^10*z4*z5^2- 3*z2*z3^9*z5^3-
    3*z3^10*z5^3+ 11*z2*z3^8*z4*z5^3- 3*z3^9*z4*z5^3- 3*z2*z3^8*z5^4- 3*z3^9*z5^4+
    11*z2*z3^7*z4*z5^4- 3*z3^8*z4*z5^4- 3*z2*z3^7*z5^5- 3*z3^8*z5^5+
    11*z2*z3^6*z4*z5^5- 3*z3^7*z4*z5^5- 3*z2*z3^6*z5^6- 3*z3^7*z5^6+
    11*z2*z3^5*z4*z5^6- 3*z3^6*z4*z5^6- 3*z2*z3^5*z5^7- 3*z3^6*z5^7+
    11*z2*z3^4*z4*z5^7- 3*z3^5*z4*z5^7- 3*z2*z3^4*z5^8- 3*z3^5*z5^8+
    11*z2*z3^3*z4*z5^8- 3*z3^4*z4*z5^8- 3*z2*z3^3*z5^9- 3*z3^4*z5^9+
    11*z2*z3^2*z4*z5^9- 3*z3^3*z4*z5^9- 3*z2*z3^2*z5^10- 3*z3^3*z5^10+
    11*z2*z3*z4*z5^10- 3*z3^2*z4*z5^10- 3*z2*z3*z5^11- 3*z3^2*z5^11+
    10*z2*z4*z5^11- 3*z3*z4*z5^11- 13*z2*z5^12- 3*z3*z5^12- 13*z4*z5^12+ 10*z5^13+
    10*z2*z3^11*z6- 13*z3^12*z6+ z2*z3^10*z4*z6+ 10*z3^11*z4*z6+
    11*z2*z3^10*z5*z6- 3*z3^11*z5*z6- 21*z2*z3^9*z4*z5*z6+ 11*z3^10*z4*z5*z6+
    11*z2*z3^9*z5^2*z6- 3*z3^10*z5^2*z6- 21*z2*z3^8*z4*z5^2*z6+
    11*z3^9*z4*z5^2*z6+ 11*z2*z3^8*z5^3*z6- 3*z3^9*z5^3*z6- 21*z2*z3^7*z4*z5^3*z6+
    11*z3^8*z4*z5^3*z6+ 11*z2*z3^7*z5^4*z6- 3*z3^8*z5^4*z6- 21*z2*z3^6*z4*z5^4*z6+
    11*z3^7*z4*z5^4*z6+ 11*z2*z3^6*z5^5*z6- 3*z3^7*z5^5*z6- 21*z2*z3^5*z4*z5^5*z6+
    11*z3^6*z4*z5^5*z6+ 11*z2*z3^5*z5^6*z6- 3*z3^6*z5^6*z6- 21*z2*z3^4*z4*z5^6*z6+
    11*z3^5*z4*z5^6*z6+ 11*z2*z3^4*z5^7*z6- 3*z3^5*z5^7*z6- 21*z2*z3^3*z4*z5^7*z6+
    11*z3^4*z4*z5^7*z6+ 11*z2*z3^3*z5^8*z6- 3*z3^4*z5^8*z6- 21*z2*z3^2*z4*z5^8*z6+
    11*z3^3*z4*z5^8*z6+ 11*z2*z3^2*z5^9*z6- 3*z3^3*z5^9*z6- 21*z2*z3*z4*z5^9*z6+
    11*z3^2*z4*z5^9*z6+ 11*z2*z3*z5^10*z6- 3*z3^2*z5^10*z6+ z2*z4*z5^10*z6+
    11*z3*z4*z5^10*z6+ 10*z2*z5^11*z6- 3*z3*z5^11*z6+ 10*z4*z5^11*z6- 13*z5^12*z6+
    10*z2*z3^11*z7- 13*z3^12*z7+ z2*z3^10*z4*z7+ 10*z3^11*z4*z7+
    11*z2*z3^10*z5*z7- 3*z3^11*z5*z7- 21*z2*z3^9*z4*z5*z7+ 11*z3^10*z4*z5*z7+
    11*z2*z3^9*z5^2*z7- 3*z3^10*z5^2*z7- 21*z2*z3^8*z4*z5^2*z7+
    11*z3^9*z4*z5^2*z7+ 11*z2*z3^8*z5^3*z7- 3*z3^9*z5^3*z7- 21*z2*z3^7*z4*z5^3*z7+
    11*z3^8*z4*z5^3*z7+ 11*z2*z3^7*z5^4*z7- 3*z3^8*z5^4*z7- 21*z2*z3^6*z4*z5^4*z7+
    11*z3^7*z4*z5^4*z7+ 11*z2*z3^6*z5^5*z7- 3*z3^7*z5^5*z7- 21*z2*z3^5*z4*z5^5*z7+
    11*z3^6*z4*z5^5*z7+ 11*z2*z3^5*z5^6*z7- 3*z3^6*z5^6*z7- 21*z2*z3^4*z4*z5^6*z7+
    11*z3^5*z4*z5^6*z7+ 11*z2*z3^4*z5^7*z7- 3*z3^5*z5^7*z7- 21*z2*z3^3*z4*z5^7*z7+
    11*z3^4*z4*z5^7*z7+ 11*z2*z3^3*z5^8*z7- 3*z3^4*z5^8*z7- 21*z2*z3^2*z4*z5^8*z7+
    11*z3^3*z4*z5^8*z7+ 11*z2*z3^2*z5^9*z7- 3*z3^3*z5^9*z7- 21*z2*z3*z4*z5^9*z7+
    11*z3^2*z4*z5^9*z7+ 11*z2*z3*z5^10*z7- 3*z3^2*z5^10*z7+ z2*z4*z5^10*z7+
    11*z3*z4*z5^10*z7+ 10*z2*z5^11*z7- 3*z3*z5^11*z7+ 10*z4*z5^11*z7- 13*z5^12*z7+
    z2*z3^10*z6*z7+ 10*z3^11*z6*z7- 22*z2*z3^9*z4*z6*z7+ z3^10*z4*z6*z7-
    21*z2*z3^9*z5*z6*z7+ 11*z3^10*z5*z6*z7+ 33*z2*z3^8*z4*z5*z6*z7-
    21*z3^9*z4*z5*z6*z7- 21*z2*z3^8*z5^2*z6*z7+ 11*z3^9*z5^2*z6*z7+
    33*z2*z3^7*z4*z5^2*z6*z7- 21*z3^8*z4*z5^2*z6*z7- 21*z2*z3^7*z5^3*z6*z7+
    11*z3^8*z5^3*z6*z7+ 33*z2*z3^6*z4*z5^3*z6*z7- 21*z3^7*z4*z5^3*z6*z7-
    21*z2*z3^6*z5^4*z6*z7+ 11*z3^7*z5^4*z6*z7+ 33*z2*z3^5*z4*z5^4*z6*z7-
    21*z3^6*z4*z5^4*z6*z7- 21*z2*z3^5*z5^5*z6*z7+ 11*z3^6*z5^5*z6*z7+
    33*z2*z3^4*z4*z5^5*z6*z7- 21*z3^5*z4*z5^5*z6*z7- 21*z2*z3^4*z5^6*z6*z7+
    11*z3^5*z5^6*z6*z7+ 33*z2*z3^3*z4*z5^6*z6*z7- 21*z3^4*z4*z5^6*z6*z7-
    21*z2*z3^3*z5^7*z6*z7+ 11*z3^4*z5^7*z6*z7+ 33*z2*z3^2*z4*z5^7*z6*z7-
    21*z3^3*z4*z5^7*z6*z7- 21*z2*z3^2*z5^8*z6*z7+ 11*z3^3*z5^8*z6*z7+
    33*z2*z3*z4*z5^8*z6*z7- 21*z3^2*z4*z5^8*z6*z7- 21*z2*z3*z5^9*z6*z7+
    11*z3^2*z5^9*z6*z7- 22*z2*z4*z5^9*z6*z7- 21*z3*z4*z5^9*z6*z7+ z2*z5^10*z6*z7+
    11*z3*z5^10*z6*z7+ z4*z5^10*z6*z7+ 10*z5^11*z6*z7- 12*z2*z3^10- 1107*z3^11+
    1121*z2*z3^9*z4- 12*z3^10*z4+ 1109*z2*z3^9*z5- 1119*z3^10*z5-
    1110*z2*z3^8*z4*z5+ 1109*z3^9*z4*z5+ 1109*z2*z3^8*z5^2- 1119*z3^9*z5^2-
    1110*z2*z3^7*z4*z5^2+ 1109*z3^8*z4*z5^2+ 1109*z2*z3^7*z5^3- 1119*z3^8*z5^3-
    1110*z2*z3^6*z4*z5^3+ 1109*z3^7*z4*z5^3+ 1109*z2*z3^6*z5^4- 1119*z3^7*z5^4-
    1110*z2*z3^5*z4*z5^4+ 1109*z3^6*z4*z5^4+ 1109*z2*z3^5*z5^5- 1119*z3^6*z5^5-
    1110*z2*z3^4*z4*z5^5+ 1109*z3^5*z4*z5^5+ 1109*z2*z3^4*z5^6- 1119*z3^5*z5^6-
    1110*z2*z3^3*z4*z5^6+ 1109*z3^4*z4*z5^6+ 1109*z2*z3^3*z5^7- 1119*z3^4*z5^7-
    1110*z2*z3^2*z4*z5^7+ 1109*z3^3*z4*z5^7+ 1109*z2*z3^2*z5^8- 1119*z3^3*z5^8-
    1110*z2*z3*z4*z5^8+ 1109*z3^2*z4*z5^8+ 1109*z2*z3*z5^9- 1119*z3^2*z5^9+
    1121*z2*z4*z5^9+ 1109*z3*z4*z5^9- 12*z2*z5^10- 1119*z3*z5^10- 12*z4*z5^10-
    1107*z5^11+ 1121*z2*z3^9*z6- 12*z3^10*z6- 2231*z2*z3^8*z4*z6+ 1121*z3^9*z4*z6-
    1110*z2*z3^8*z5*z6+ 1109*z3^9*z5*z6+ 1132*z2*z3^7*z4*z5*z6-
    1110*z3^8*z4*z5*z6- 1110*z2*z3^7*z5^2*z6+ 1109*z3^8*z5^2*z6+
    1132*z2*z3^6*z4*z5^2*z6- 1110*z3^7*z4*z5^2*z6- 1110*z2*z3^6*z5^3*z6+
    1109*z3^7*z5^3*z6+ 1132*z2*z3^5*z4*z5^3*z6- 1110*z3^6*z4*z5^3*z6-
    1110*z2*z3^5*z5^4*z6+ 1109*z3^6*z5^4*z6+ 1132*z2*z3^4*z4*z5^4*z6-
    1110*z3^5*z4*z5^4*z6- 1110*z2*z3^4*z5^5*z6+ 1109*z3^5*z5^5*z6+
    1132*z2*z3^3*z4*z5^5*z6- 1110*z3^4*z4*z5^5*z6- 1110*z2*z3^3*z5^6*z6+
    1109*z3^4*z5^6*z6+ 1132*z2*z3^2*z4*z5^6*z6- 1110*z3^3*z4*z5^6*z6-
    1110*z2*z3^2*z5^7*z6+ 1109*z3^3*z5^7*z6+ 1132*z2*z3*z4*z5^7*z6-
    1110*z3^2*z4*z5^7*z6- 1110*z2*z3*z5^8*z6+ 1109*z3^2*z5^8*z6-
    2231*z2*z4*z5^8*z6- 1110*z3*z4*z5^8*z6+ 1121*z2*z5^9*z6+ 1109*z3*z5^9*z6+
    1121*z4*z5^9*z6- 12*z5^10*z6+ 1121*z2*z3^9*z7- 12*z3^10*z7-
    2231*z2*z3^8*z4*z7+ 1121*z3^9*z4*z7- 1110*z2*z3^8*z5*z7+ 1109*z3^9*z5*z7+
    1132*z2*z3^7*z4*z5*z7- 1110*z3^8*z4*z5*z7- 1110*z2*z3^7*z5^2*z7+
    1109*z3^8*z5^2*z7+ 1132*z2*z3^6*z4*z5^2*z7- 1110*z3^7*z4*z5^2*z7-
    1110*z2*z3^6*z5^3*z7+ 1109*z3^7*z5^3*z7+ 1132*z2*z3^5*z4*z5^3*z7-
    1110*z3^6*z4*z5^3*z7- 1110*z2*z3^5*z5^4*z7+ 1109*z3^6*z5^4*z7+
    1132*z2*z3^4*z4*z5^4*z7- 1110*z3^5*z4*z5^4*z7- 1110*z2*z3^4*z5^5*z7+
    1109*z3^5*z5^5*z7+ 1132*z2*z3^3*z4*z5^5*z7- 1110*z3^4*z4*z5^5*z7-
    1110*z2*z3^3*z5^6*z7+ 1109*z3^4*z5^6*z7+ 1132*z2*z3^2*z4*z5^6*z7-
    1110*z3^3*z4*z5^6*z7- 1110*z2*z3^2*z5^7*z7+ 1109*z3^3*z5^7*z7+
    1132*z2*z3*z4*z5^7*z7- 1110*z3^2*z4*z5^7*z7- 1110*z2*z3*z5^8*z7+
    1109*z3^2*z5^8*z7- 2231*z2*z4*z5^8*z7- 1110*z3*z4*z5^8*z7+ 1121*z2*z5^9*z7+
    1109*z3*z5^9*z7+ 1121*z4*z5^9*z7- 12*z5^10*z7- 2231*z2*z3^8*z6*z7+
    1121*z3^9*z6*z7+ 3363*z2*z3^7*z4*z6*z7- 2231*z3^8*z4*z6*z7+
    1132*z2*z3^7*z5*z6*z7- 1110*z3^8*z5*z6*z7- 1187*z2*z3^6*z4*z5*z6*z7+
    1132*z3^7*z4*z5*z6*z7+ 1132*z2*z3^6*z5^2*z6*z7- 1110*z3^7*z5^2*z6*z7-
    1187*z2*z3^5*z4*z5^2*z6*z7+ 1132*z3^6*z4*z5^2*z6*z7+ 1132*z2*z3^5*z5^3*z6*z7-
    1110*z3^6*z5^3*z6*z7- 1187*z2*z3^4*z4*z5^3*z6*z7+ 1132*z3^5*z4*z5^3*z6*z7+
    1132*z2*z3^4*z5^4*z6*z7- 1110*z3^5*z5^4*z6*z7- 1187*z2*z3^3*z4*z5^4*z6*z7+
    1132*z3^4*z4*z5^4*z6*z7+ 1132*z2*z3^3*z5^5*z6*z7- 1110*z3^4*z5^5*z6*z7-
    1187*z2*z3^2*z4*z5^5*z6*z7+ 1132*z3^3*z4*z5^5*z6*z7+ 1132*z2*z3^2*z5^6*z6*z7-
    1110*z3^3*z5^6*z6*z7- 1187*z2*z3*z4*z5^6*z6*z7+ 1132*z3^2*z4*z5^6*z6*z7+
    1132*z2*z3*z5^7*z6*z7- 1110*z3^2*z5^7*z6*z7+ 3363*z2*z4*z5^7*z6*z7+
    1132*z3*z4*z5^7*z6*z7- 2231*z2*z5^8*z6*z7- 1110*z3*z5^8*z6*z7-
    2231*z4*z5^8*z6*z7+ 1121*z5^9*z6*z7- 3374*z2*z3^8+ 2264*z3^9+ 3363*z2*z3^7*z4-
    3374*z3^8*z4- 11*z2*z3^7*z5- 1110*z3^8*z5+ 2242*z2*z3^6*z4*z5- 11*z3^7*z4*z5-
    11*z2*z3^6*z5^2- 1110*z3^7*z5^2+ 2242*z2*z3^5*z4*z5^2- 11*z3^6*z4*z5^2-
    11*z2*z3^5*z5^3- 1110*z3^6*z5^3+ 2242*z2*z3^4*z4*z5^3- 11*z3^5*z4*z5^3-
    11*z2*z3^4*z5^4- 1110*z3^5*z5^4+ 2242*z2*z3^3*z4*z5^4- 11*z3^4*z4*z5^4-
    11*z2*z3^3*z5^5- 1110*z3^4*z5^5+ 2242*z2*z3^2*z4*z5^5- 11*z3^3*z4*z5^5-
    11*z2*z3^2*z5^6- 1110*z3^3*z5^6+ 2242*z2*z3*z4*z5^6- 11*z3^2*z4*z5^6-
    11*z2*z3*z5^7- 1110*z3^2*z5^7+ 3363*z2*z4*z5^7- 11*z3*z4*z5^7- 3374*z2*z5^8-
    1110*z3*z5^8- 3374*z4*z5^8+ 2264*z5^9+ 3363*z2*z3^7*z6- 3374*z3^8*z6-
    1121*z2*z3^6*z4*z6+ 3363*z3^7*z4*z6+ 2242*z2*z3^6*z5*z6- 11*z3^7*z5*z6+
    3396*z2*z3^5*z4*z5*z6+ 2242*z3^6*z4*z5*z6+ 2242*z2*z3^5*z5^2*z6-
    11*z3^6*z5^2*z6+ 3396*z2*z3^4*z4*z5^2*z6+ 2242*z3^5*z4*z5^2*z6+
    2242*z2*z3^4*z5^3*z6- 11*z3^5*z5^3*z6+ 3396*z2*z3^3*z4*z5^3*z6+
    2242*z3^4*z4*z5^3*z6+ 2242*z2*z3^3*z5^4*z6- 11*z3^4*z5^4*z6+
    3396*z2*z3^2*z4*z5^4*z6+ 2242*z3^3*z4*z5^4*z6+ 2242*z2*z3^2*z5^5*z6-
    11*z3^3*z5^5*z6+ 3396*z2*z3*z4*z5^5*z6+ 2242*z3^2*z4*z5^5*z6+
    2242*z2*z3*z5^6*z6- 11*z3^2*z5^6*z6- 1121*z2*z4*z5^6*z6+ 2242*z3*z4*z5^6*z6+
    3363*z2*z5^7*z6- 11*z3*z5^7*z6+ 3363*z4*z5^7*z6- 3374*z5^8*z6+
    3363*z2*z3^7*z7- 3374*z3^8*z7- 1121*z2*z3^6*z4*z7+ 3363*z3^7*z4*z7+
    2242*z2*z3^6*z5*z7- 11*z3^7*z5*z7+ 3396*z2*z3^5*z4*z5*z7+ 2242*z3^6*z4*z5*z7+
    2242*z2*z3^5*z5^2*z7- 11*z3^6*z5^2*z7+ 3396*z2*z3^4*z4*z5^2*z7+
    2242*z3^5*z4*z5^2*z7+ 2242*z2*z3^4*z5^3*z7- 11*z3^5*z5^3*z7+
    3396*z2*z3^3*z4*z5^3*z7+ 2242*z3^4*z4*z5^3*z7+ 2242*z2*z3^3*z5^4*z7-
    11*z3^4*z5^4*z7+ 3396*z2*z3^2*z4*z5^4*z7+ 2242*z3^3*z4*z5^4*z7+
    2242*z2*z3^2*z5^5*z7- 11*z3^3*z5^5*z7+ 3396*z2*z3*z4*z5^5*z7+
    2242*z3^2*z4*z5^5*z7+ 2242*z2*z3*z5^6*z7- 11*z3^2*z5^6*z7- 1121*z2*z4*z5^6*z7+
    2242*z3*z4*z5^6*z7+ 3363*z2*z5^7*z7- 11*z3*z5^7*z7+ 3363*z4*z5^7*z7-
    3374*z5^8*z7- 1121*z2*z3^6*z6*z7+ 3363*z3^7*z6*z7- 4484*z2*z3^5*z4*z6*z7-
    1121*z3^6*z4*z6*z7+ 3396*z2*z3^5*z5*z6*z7+ 2242*z3^6*z5*z6*z7+
    1154*z2*z3^4*z4*z5*z6*z7+ 3396*z3^5*z4*z5*z6*z7+ 3396*z2*z3^4*z5^2*z6*z7+
    2242*z3^5*z5^2*z6*z7+ 1154*z2*z3^3*z4*z5^2*z6*z7+ 3396*z3^4*z4*z5^2*z6*z7+
    3396*z2*z3^3*z5^3*z6*z7+ 2242*z3^4*z5^3*z6*z7+ 1154*z2*z3^2*z4*z5^3*z6*z7+
    3396*z3^3*z4*z5^3*z6*z7+ 3396*z2*z3^2*z5^4*z6*z7+ 2242*z3^3*z5^4*z6*z7+
    1154*z2*z3*z4*z5^4*z6*z7+ 3396*z3^2*z4*z5^4*z6*z7+ 3396*z2*z3*z5^5*z6*z7+
    2242*z3^2*z5^5*z6*z7- 4484*z2*z4*z5^5*z6*z7+ 3396*z3*z4*z5^5*z6*z7-
    1121*z2*z5^6*z6*z7+ 2242*z3*z5^6*z6*z7- 1121*z4*z5^6*z6*z7+ 3363*z5^7*z6*z7+
    147*z2*z3^6+ 2604*z3^7+ 2740*z2*z3^5*z4+ 147*z3^6*z4+ 2887*z2*z3^5*z5+
    2751*z3^6*z5- 1766*z2*z3^4*z4*z5+ 2887*z3^5*z4*z5+ 2887*z2*z3^4*z5^2+
    2751*z3^5*z5^2- 1766*z2*z3^3*z4*z5^2+ 2887*z3^4*z4*z5^2+ 2887*z2*z3^3*z5^3+
    2751*z3^4*z5^3- 1766*z2*z3^2*z4*z5^3+ 2887*z3^3*z4*z5^3+ 2887*z2*z3^2*z5^4+
    2751*z3^3*z5^4- 1766*z2*z3*z4*z5^4+ 2887*z3^2*z4*z5^4+ 2887*z2*z3*z5^5+
    2751*z3^2*z5^5+ 2740*z2*z4*z5^5+ 2887*z3*z4*z5^5+ 147*z2*z5^6+ 2751*z3*z5^6+
    147*z4*z5^6+ 2604*z5^7+ 2740*z2*z3^5*z6+ 147*z3^6*z6+ 4495*z2*z3^4*z4*z6+
    2740*z3^5*z4*z6- 1766*z2*z3^4*z5*z6+ 2887*z3^5*z5*z6- 2751*z2*z3^3*z4*z5*z6-
    1766*z3^4*z4*z5*z6- 1766*z2*z3^3*z5^2*z6+ 2887*z3^4*z5^2*z6-
    2751*z2*z3^2*z4*z5^2*z6- 1766*z3^3*z4*z5^2*z6- 1766*z2*z3^2*z5^3*z6+
    2887*z3^3*z5^3*z6- 2751*z2*z3*z4*z5^3*z6- 1766*z3^2*z4*z5^3*z6-
    1766*z2*z3*z5^4*z6+ 2887*z3^2*z5^4*z6+ 4495*z2*z4*z5^4*z6- 1766*z3*z4*z5^4*z6+
    2740*z2*z5^5*z6+ 2887*z3*z5^5*z6+ 2740*z4*z5^5*z6+ 147*z5^6*z6+
    2740*z2*z3^5*z7+ 147*z3^6*z7+ 4495*z2*z3^4*z4*z7+ 2740*z3^5*z4*z7-
    1766*z2*z3^4*z5*z7+ 2887*z3^5*z5*z7- 2751*z2*z3^3*z4*z5*z7-
    1766*z3^4*z4*z5*z7- 1766*z2*z3^3*z5^2*z7+ 2887*z3^4*z5^2*z7-
    2751*z2*z3^2*z4*z5^2*z7- 1766*z3^3*z4*z5^2*z7- 1766*z2*z3^2*z5^3*z7+
    2887*z3^3*z5^3*z7- 2751*z2*z3*z4*z5^3*z7- 1766*z3^2*z4*z5^3*z7-
    1766*z2*z3*z5^4*z7+ 2887*z3^2*z5^4*z7+ 4495*z2*z4*z5^4*z7- 1766*z3*z4*z5^4*z7+
    2740*z2*z5^5*z7+ 2887*z3*z5^5*z7+ 2740*z4*z5^5*z7+ 147*z5^6*z7+
    4495*z2*z3^4*z6*z7+ 2740*z3^5*z6*z7+ 1755*z2*z3^3*z4*z6*z7+
    4495*z3^4*z4*z6*z7- 2751*z2*z3^3*z5*z6*z7- 1766*z3^4*z5*z6*z7-
    2887*z2*z3^2*z4*z5*z6*z7- 2751*z3^3*z4*z5*z6*z7- 2751*z2*z3^2*z5^2*z6*z7-
    1766*z3^3*z5^2*z6*z7- 2887*z2*z3*z4*z5^2*z6*z7- 2751*z3^2*z4*z5^2*z6*z7-
    2751*z2*z3*z5^3*z6*z7- 1766*z3^2*z5^3*z6*z7+ 1755*z2*z4*z5^3*z6*z7-
    2751*z3*z4*z5^3*z6*z7+ 4495*z2*z5^4*z6*z7- 1766*z3*z5^4*z6*z7+
    4495*z4*z5^4*z6*z7+ 2740*z5^5*z6*z7+ 318*z2*z3^4+ 2037*z3^5+ 3588*z2*z3^3*z4+
    318*z3^4*z4+ 3906*z2*z3^3*z5+ 2355*z3^4*z5+ 600*z2*z3^2*z4*z5+
    3906*z3^3*z4*z5+ 3906*z2*z3^2*z5^2+ 2355*z3^3*z5^2+ 600*z2*z3*z4*z5^2+
    3906*z3^2*z4*z5^2+ 3906*z2*z3*z5^3+ 2355*z3^2*z5^3+ 3588*z2*z4*z5^3+
    3906*z3*z4*z5^3+ 318*z2*z5^4+ 2355*z3*z5^4+ 318*z4*z5^4+ 2037*z5^5+
    3588*z2*z3^3*z6+ 318*z3^4*z6- 2988*z2*z3^2*z4*z6+ 3588*z3^3*z4*z6+
    600*z2*z3^2*z5*z6+ 3906*z3^3*z5*z6- 2355*z2*z3*z4*z5*z6+ 600*z3^2*z4*z5*z6+
    600*z2*z3*z5^2*z6+ 3906*z3^2*z5^2*z6- 2988*z2*z4*z5^2*z6+ 600*z3*z4*z5^2*z6+
    3588*z2*z5^3*z6+ 3906*z3*z5^3*z6+ 3588*z4*z5^3*z6+ 318*z5^4*z6+
    3588*z2*z3^3*z7+ 318*z3^4*z7- 2988*z2*z3^2*z4*z7+ 3588*z3^3*z4*z7+
    600*z2*z3^2*z5*z7+ 3906*z3^3*z5*z7- 2355*z2*z3*z4*z5*z7+ 600*z3^2*z4*z5*z7+
    600*z2*z3*z5^2*z7+ 3906*z3^2*z5^2*z7- 2988*z2*z4*z5^2*z7+ 600*z3*z4*z5^2*z7+
    3588*z2*z5^3*z7+ 3906*z3*z5^3*z7+ 3588*z4*z5^3*z7+ 318*z5^4*z7-
    2988*z2*z3^2*z6*z7+ 3588*z3^3*z6*z7+ 633*z2*z3*z4*z6*z7- 2988*z3^2*z4*z6*z7-
    2355*z2*z3*z5*z6*z7+ 600*z3^2*z5*z6*z7+ 633*z2*z4*z5*z6*z7-
    2355*z3*z4*z5*z6*z7- 2988*z2*z5^2*z6*z7+ 600*z3*z5^2*z6*z7-
    2988*z4*z5^2*z6*z7+ 3588*z5^3*z6*z7- 1776*z2*z3^2+ 2166*z3^3- 2202*z2*z3*z4-
    1776*z3^2*z4- 3978*z2*z3*z5+ 390*z3^2*z5- 2202*z2*z4*z5- 3978*z3*z4*z5-
    1776*z2*z5^2+ 390*z3*z5^2- 1776*z4*z5^2+ 2166*z5^3- 2202*z2*z3*z6-
    1776*z3^2*z6- 1068*z2*z4*z6- 2202*z3*z4*z6- 2202*z2*z5*z6- 3978*z3*z5*z6-
    2202*z4*z5*z6- 1776*z5^2*z6- 2202*z2*z3*z7- 1776*z3^2*z7- 1068*z2*z4*z7-
    2202*z3*z4*z7- 2202*z2*z5*z7- 3978*z3*z5*z7- 2202*z4*z5*z7- 1776*z5^2*z7-
    1068*z2*z6*z7- 2202*z3*z6*z7- 1068*z4*z6*z7- 2202*z5*z6*z7+ 3538*z2- 1169*z3+
    3538*z4- 1169*z5+ 3538*z6+ 3538*z7, - 4*z2*z3^14+ 2*z3^15+ 6*z2*z3^13*z4-
    4*z3^14*z4+ 6*z2*z3^13*z5- 4*z3^14*z5- 8*z2*z3^12*z4*z5+ 6*z3^13*z4*z5+
    2*z2*z3^13*z6- 2*z3^14*z6- 2*z2*z3^12*z4*z6+ 2*z3^13*z4*z6- 2*z2*z3^12*z5*z6+
    2*z3^13*z5*z6+ 2*z2*z3^11*z4*z5*z6- 2*z3^12*z4*z5*z6+ 2*z2*z3^12*z6^2-
    2*z3^13*z6^2- 2*z2*z3^11*z4*z6^2+ 2*z3^12*z4*z6^2- 2*z2*z3^11*z5*z6^2+
    2*z3^12*z5*z6^2+ 2*z2*z3^10*z4*z5*z6^2- 2*z3^11*z4*z5*z6^2+ 2*z2*z3^11*z6^3-
    2*z3^12*z6^3- 2*z2*z3^10*z4*z6^3+ 2*z3^11*z4*z6^3- 2*z2*z3^10*z5*z6^3+
    2*z3^11*z5*z6^3+ 2*z2*z3^9*z4*z5*z6^3- 2*z3^10*z4*z5*z6^3+ 2*z2*z3^10*z6^4-
    2*z3^11*z6^4- 2*z2*z3^9*z4*z6^4+ 2*z3^10*z4*z6^4- 2*z2*z3^9*z5*z6^4+
    2*z3^10*z5*z6^4+ 2*z2*z3^8*z4*z5*z6^4- 2*z3^9*z4*z5*z6^4+ 2*z2*z3^9*z6^5-
    2*z3^10*z6^5- 2*z2*z3^8*z4*z6^5+ 2*z3^9*z4*z6^5- 2*z2*z3^8*z5*z6^5+
    2*z3^9*z5*z6^5+ 2*z2*z3^7*z4*z5*z6^5- 2*z3^8*z4*z5*z6^5+ 2*z2*z3^8*z6^6-
    2*z3^9*z6^6- 2*z2*z3^7*z4*z6^6+ 2*z3^8*z4*z6^6- 2*z2*z3^7*z5*z6^6+
    2*z3^8*z5*z6^6+ 2*z2*z3^6*z4*z5*z6^6- 2*z3^7*z4*z5*z6^6+ 2*z2*z3^7*z6^7-
    2*z3^8*z6^7- 2*z2*z3^6*z4*z6^7+ 2*z3^7*z4*z6^7- 2*z2*z3^6*z5*z6^7+
    2*z3^7*z5*z6^7+ 2*z2*z3^5*z4*z5*z6^7- 2*z3^6*z4*z5*z6^7+ 2*z2*z3^6*z6^8-
    2*z3^7*z6^8- 2*z2*z3^5*z4*z6^8+ 2*z3^6*z4*z6^8- 2*z2*z3^5*z5*z6^8+
    2*z3^6*z5*z6^8+ 2*z2*z3^4*z4*z5*z6^8- 2*z3^5*z4*z5*z6^8+ 2*z2*z3^5*z6^9-
    2*z3^6*z6^9- 2*z2*z3^4*z4*z6^9+ 2*z3^5*z4*z6^9- 2*z2*z3^4*z5*z6^9+
    2*z3^5*z5*z6^9+ 2*z2*z3^3*z4*z5*z6^9- 2*z3^4*z4*z5*z6^9+ 2*z2*z3^4*z6^10-
    2*z3^5*z6^10- 2*z2*z3^3*z4*z6^10+ 2*z3^4*z4*z6^10- 2*z2*z3^3*z5*z6^10+
    2*z3^4*z5*z6^10+ 2*z2*z3^2*z4*z5*z6^10- 2*z3^3*z4*z5*z6^10+ 2*z2*z3^3*z6^11-
    2*z3^4*z6^11- 2*z2*z3^2*z4*z6^11+ 2*z3^3*z4*z6^11- 2*z2*z3^2*z5*z6^11+
    2*z3^3*z5*z6^11+ 2*z2*z3*z4*z5*z6^11- 2*z3^2*z4*z5*z6^11+ 2*z2*z3^2*z6^12-
    2*z3^3*z6^12- 2*z2*z3*z4*z6^12+ 2*z3^2*z4*z6^12- 2*z2*z3*z5*z6^12+
    2*z3^2*z5*z6^12- 8*z2*z4*z5*z6^12- 2*z3*z4*z5*z6^12+ 2*z2*z3*z6^13-
    2*z3^2*z6^13+ 6*z2*z4*z6^13+ 2*z3*z4*z6^13+ 6*z2*z5*z6^13+ 2*z3*z5*z6^13+
    6*z4*z5*z6^13- 4*z2*z6^14- 2*z3*z6^14- 4*z4*z6^14- 4*z5*z6^14+ 2*z6^15+
    6*z2*z3^13*z7- 4*z3^14*z7- 8*z2*z3^12*z4*z7+ 6*z3^13*z4*z7- 8*z2*z3^12*z5*z7+
    6*z3^13*z5*z7+ 10*z2*z3^11*z4*z5*z7- 8*z3^12*z4*z5*z7- 2*z2*z3^12*z6*z7+
    2*z3^13*z6*z7+ 2*z2*z3^11*z4*z6*z7- 2*z3^12*z4*z6*z7+ 2*z2*z3^11*z5*z6*z7-
    2*z3^12*z5*z6*z7- 2*z2*z3^10*z4*z5*z6*z7+ 2*z3^11*z4*z5*z6*z7-
    2*z2*z3^11*z6^2*z7+ 2*z3^12*z6^2*z7+ 2*z2*z3^10*z4*z6^2*z7-
    2*z3^11*z4*z6^2*z7+ 2*z2*z3^10*z5*z6^2*z7- 2*z3^11*z5*z6^2*z7-
    2*z2*z3^9*z4*z5*z6^2*z7+ 2*z3^10*z4*z5*z6^2*z7- 2*z2*z3^10*z6^3*z7+
    2*z3^11*z6^3*z7+ 2*z2*z3^9*z4*z6^3*z7- 2*z3^10*z4*z6^3*z7+
    2*z2*z3^9*z5*z6^3*z7- 2*z3^10*z5*z6^3*z7- 2*z2*z3^8*z4*z5*z6^3*z7+
    2*z3^9*z4*z5*z6^3*z7- 2*z2*z3^9*z6^4*z7+ 2*z3^10*z6^4*z7+
    2*z2*z3^8*z4*z6^4*z7- 2*z3^9*z4*z6^4*z7+ 2*z2*z3^8*z5*z6^4*z7-
    2*z3^9*z5*z6^4*z7- 2*z2*z3^7*z4*z5*z6^4*z7+ 2*z3^8*z4*z5*z6^4*z7-
    2*z2*z3^8*z6^5*z7+ 2*z3^9*z6^5*z7+ 2*z2*z3^7*z4*z6^5*z7- 2*z3^8*z4*z6^5*z7+
    2*z2*z3^7*z5*z6^5*z7- 2*z3^8*z5*z6^5*z7- 2*z2*z3^6*z4*z5*z6^5*z7+
    2*z3^7*z4*z5*z6^5*z7- 2*z2*z3^7*z6^6*z7+ 2*z3^8*z6^6*z7+ 2*z2*z3^6*z4*z6^6*z7-
    2*z3^7*z4*z6^6*z7+ 2*z2*z3^6*z5*z6^6*z7- 2*z3^7*z5*z6^6*z7-
    2*z2*z3^5*z4*z5*z6^6*z7+ 2*z3^6*z4*z5*z6^6*z7- 2*z2*z3^6*z6^7*z7+
    2*z3^7*z6^7*z7+ 2*z2*z3^5*z4*z6^7*z7- 2*z3^6*z4*z6^7*z7+ 2*z2*z3^5*z5*z6^7*z7-
    2*z3^6*z5*z6^7*z7- 2*z2*z3^4*z4*z5*z6^7*z7+ 2*z3^5*z4*z5*z6^7*z7-
    2*z2*z3^5*z6^8*z7+ 2*z3^6*z6^8*z7+ 2*z2*z3^4*z4*z6^8*z7- 2*z3^5*z4*z6^8*z7+
    2*z2*z3^4*z5*z6^8*z7- 2*z3^5*z5*z6^8*z7- 2*z2*z3^3*z4*z5*z6^8*z7+
    2*z3^4*z4*z5*z6^8*z7- 2*z2*z3^4*z6^9*z7+ 2*z3^5*z6^9*z7+ 2*z2*z3^3*z4*z6^9*z7-
    2*z3^4*z4*z6^9*z7+ 2*z2*z3^3*z5*z6^9*z7- 2*z3^4*z5*z6^9*z7-
    2*z2*z3^2*z4*z5*z6^9*z7+ 2*z3^3*z4*z5*z6^9*z7- 2*z2*z3^3*z6^10*z7+
    2*z3^4*z6^10*z7+ 2*z2*z3^2*z4*z6^10*z7- 2*z3^3*z4*z6^10*z7+
    2*z2*z3^2*z5*z6^10*z7- 2*z3^3*z5*z6^10*z7- 2*z2*z3*z4*z5*z6^10*z7+
    2*z3^2*z4*z5*z6^10*z7- 2*z2*z3^2*z6^11*z7+ 2*z3^3*z6^11*z7+
    2*z2*z3*z4*z6^11*z7- 2*z3^2*z4*z6^11*z7+ 2*z2*z3*z5*z6^11*z7-
    2*z3^2*z5*z6^11*z7+ 10*z2*z4*z5*z6^11*z7+ 2*z3*z4*z5*z6^11*z7-
    2*z2*z3*z6^12*z7+ 2*z3^2*z6^12*z7- 8*z2*z4*z6^12*z7- 2*z3*z4*z6^12*z7-
    8*z2*z5*z6^12*z7- 2*z3*z5*z6^12*z7- 8*z4*z5*z6^12*z7+ 6*z2*z6^13*z7+
    2*z3*z6^13*z7+ 6*z4*z6^13*z7+ 6*z5*z6^13*z7- 4*z6^14*z7- 13*z2*z3^12+
    10*z3^13+ 10*z2*z3^11*z4- 13*z3^12*z4+ 10*z2*z3^11*z5- 13*z3^12*z5+
    z2*z3^10*z4*z5+ 10*z3^11*z4*z5- 3*z2*z3^11*z6- 3*z3^12*z6+ 11*z2*z3^10*z4*z6-
    3*z3^11*z4*z6+ 11*z2*z3^10*z5*z6- 3*z3^11*z5*z6- 21*z2*z3^9*z4*z5*z6+
    11*z3^10*z4*z5*z6- 3*z2*z3^10*z6^2- 3*z3^11*z6^2+ 11*z2*z3^9*z4*z6^2-
    3*z3^10*z4*z6^2+ 11*z2*z3^9*z5*z6^2- 3*z3^10*z5*z6^2- 21*z2*z3^8*z4*z5*z6^2+
    11*z3^9*z4*z5*z6^2- 3*z2*z3^9*z6^3- 3*z3^10*z6^3+ 11*z2*z3^8*z4*z6^3-
    3*z3^9*z4*z6^3+ 11*z2*z3^8*z5*z6^3- 3*z3^9*z5*z6^3- 21*z2*z3^7*z4*z5*z6^3+
    11*z3^8*z4*z5*z6^3- 3*z2*z3^8*z6^4- 3*z3^9*z6^4+ 11*z2*z3^7*z4*z6^4-
    3*z3^8*z4*z6^4+ 11*z2*z3^7*z5*z6^4- 3*z3^8*z5*z6^4- 21*z2*z3^6*z4*z5*z6^4+
    11*z3^7*z4*z5*z6^4- 3*z2*z3^7*z6^5- 3*z3^8*z6^5+ 11*z2*z3^6*z4*z6^5-
    3*z3^7*z4*z6^5+ 11*z2*z3^6*z5*z6^5- 3*z3^7*z5*z6^5- 21*z2*z3^5*z4*z5*z6^5+
    11*z3^6*z4*z5*z6^5- 3*z2*z3^6*z6^6- 3*z3^7*z6^6+ 11*z2*z3^5*z4*z6^6-
    3*z3^6*z4*z6^6+ 11*z2*z3^5*z5*z6^6- 3*z3^6*z5*z6^6- 21*z2*z3^4*z4*z5*z6^6+
    11*z3^5*z4*z5*z6^6- 3*z2*z3^5*z6^7- 3*z3^6*z6^7+ 11*z2*z3^4*z4*z6^7-
    3*z3^5*z4*z6^7+ 11*z2*z3^4*z5*z6^7- 3*z3^5*z5*z6^7- 21*z2*z3^3*z4*z5*z6^7+
    11*z3^4*z4*z5*z6^7- 3*z2*z3^4*z6^8- 3*z3^5*z6^8+ 11*z2*z3^3*z4*z6^8-
    3*z3^4*z4*z6^8+ 11*z2*z3^3*z5*z6^8- 3*z3^4*z5*z6^8- 21*z2*z3^2*z4*z5*z6^8+
    11*z3^3*z4*z5*z6^8- 3*z2*z3^3*z6^9- 3*z3^4*z6^9+ 11*z2*z3^2*z4*z6^9-
    3*z3^3*z4*z6^9+ 11*z2*z3^2*z5*z6^9- 3*z3^3*z5*z6^9- 21*z2*z3*z4*z5*z6^9+
    11*z3^2*z4*z5*z6^9- 3*z2*z3^2*z6^10- 3*z3^3*z6^10+ 11*z2*z3*z4*z6^10-
    3*z3^2*z4*z6^10+ 11*z2*z3*z5*z6^10- 3*z3^2*z5*z6^10+ z2*z4*z5*z6^10+
    11*z3*z4*z5*z6^10- 3*z2*z3*z6^11- 3*z3^2*z6^11+ 10*z2*z4*z6^11- 3*z3*z4*z6^11+
    10*z2*z5*z6^11- 3*z3*z5*z6^11+ 10*z4*z5*z6^11- 13*z2*z6^12- 3*z3*z6^12-
    13*z4*z6^12- 13*z5*z6^12+ 10*z6^13+ 10*z2*z3^11*z7- 13*z3^12*z7+
    z2*z3^10*z4*z7+ 10*z3^11*z4*z7+ z2*z3^10*z5*z7+ 10*z3^11*z5*z7-
    22*z2*z3^9*z4*z5*z7+ z3^10*z4*z5*z7+ 11*z2*z3^10*z6*z7- 3*z3^11*z6*z7-
    21*z2*z3^9*z4*z6*z7+ 11*z3^10*z4*z6*z7- 21*z2*z3^9*z5*z6*z7+
    11*z3^10*z5*z6*z7+ 33*z2*z3^8*z4*z5*z6*z7- 21*z3^9*z4*z5*z6*z7+
    11*z2*z3^9*z6^2*z7- 3*z3^10*z6^2*z7- 21*z2*z3^8*z4*z6^2*z7+
    11*z3^9*z4*z6^2*z7- 21*z2*z3^8*z5*z6^2*z7+ 11*z3^9*z5*z6^2*z7+
    33*z2*z3^7*z4*z5*z6^2*z7- 21*z3^8*z4*z5*z6^2*z7+ 11*z2*z3^8*z6^3*z7-
    3*z3^9*z6^3*z7- 21*z2*z3^7*z4*z6^3*z7+ 11*z3^8*z4*z6^3*z7-
    21*z2*z3^7*z5*z6^3*z7+ 11*z3^8*z5*z6^3*z7+ 33*z2*z3^6*z4*z5*z6^3*z7-
    21*z3^7*z4*z5*z6^3*z7+ 11*z2*z3^7*z6^4*z7- 3*z3^8*z6^4*z7-
    21*z2*z3^6*z4*z6^4*z7+ 11*z3^7*z4*z6^4*z7- 21*z2*z3^6*z5*z6^4*z7+
    11*z3^7*z5*z6^4*z7+ 33*z2*z3^5*z4*z5*z6^4*z7- 21*z3^6*z4*z5*z6^4*z7+
    11*z2*z3^6*z6^5*z7- 3*z3^7*z6^5*z7- 21*z2*z3^5*z4*z6^5*z7+ 11*z3^6*z4*z6^5*z7-
    21*z2*z3^5*z5*z6^5*z7+ 11*z3^6*z5*z6^5*z7+ 33*z2*z3^4*z4*z5*z6^5*z7-
    21*z3^5*z4*z5*z6^5*z7+ 11*z2*z3^5*z6^6*z7- 3*z3^6*z6^6*z7-
    21*z2*z3^4*z4*z6^6*z7+ 11*z3^5*z4*z6^6*z7- 21*z2*z3^4*z5*z6^6*z7+
    11*z3^5*z5*z6^6*z7+ 33*z2*z3^3*z4*z5*z6^6*z7- 21*z3^4*z4*z5*z6^6*z7+
    11*z2*z3^4*z6^7*z7- 3*z3^5*z6^7*z7- 21*z2*z3^3*z4*z6^7*z7+ 11*z3^4*z4*z6^7*z7-
    21*z2*z3^3*z5*z6^7*z7+ 11*z3^4*z5*z6^7*z7+ 33*z2*z3^2*z4*z5*z6^7*z7-
    21*z3^3*z4*z5*z6^7*z7+ 11*z2*z3^3*z6^8*z7- 3*z3^4*z6^8*z7-
    21*z2*z3^2*z4*z6^8*z7+ 11*z3^3*z4*z6^8*z7- 21*z2*z3^2*z5*z6^8*z7+
    11*z3^3*z5*z6^8*z7+ 33*z2*z3*z4*z5*z6^8*z7- 21*z3^2*z4*z5*z6^8*z7+
    11*z2*z3^2*z6^9*z7- 3*z3^3*z6^9*z7- 21*z2*z3*z4*z6^9*z7+ 11*z3^2*z4*z6^9*z7-
    21*z2*z3*z5*z6^9*z7+ 11*z3^2*z5*z6^9*z7- 22*z2*z4*z5*z6^9*z7-
    21*z3*z4*z5*z6^9*z7+ 11*z2*z3*z6^10*z7- 3*z3^2*z6^10*z7+ z2*z4*z6^10*z7+
    11*z3*z4*z6^10*z7+ z2*z5*z6^10*z7+ 11*z3*z5*z6^10*z7+ z4*z5*z6^10*z7+
    10*z2*z6^11*z7- 3*z3*z6^11*z7+ 10*z4*z6^11*z7+ 10*z5*z6^11*z7- 13*z6^12*z7-
    12*z2*z3^10- 1107*z3^11+ 1121*z2*z3^9*z4- 12*z3^10*z4+ 1121*z2*z3^9*z5-
    12*z3^10*z5- 2231*z2*z3^8*z4*z5+ 1121*z3^9*z4*z5+ 1109*z2*z3^9*z6-
    1119*z3^10*z6- 1110*z2*z3^8*z4*z6+ 1109*z3^9*z4*z6- 1110*z2*z3^8*z5*z6+
    1109*z3^9*z5*z6+ 1132*z2*z3^7*z4*z5*z6- 1110*z3^8*z4*z5*z6+ 1109*z2*z3^8*z6^2-
    1119*z3^9*z6^2- 1110*z2*z3^7*z4*z6^2+ 1109*z3^8*z4*z6^2- 1110*z2*z3^7*z5*z6^2+
    1109*z3^8*z5*z6^2+ 1132*z2*z3^6*z4*z5*z6^2- 1110*z3^7*z4*z5*z6^2+
    1109*z2*z3^7*z6^3- 1119*z3^8*z6^3- 1110*z2*z3^6*z4*z6^3+ 1109*z3^7*z4*z6^3-
    1110*z2*z3^6*z5*z6^3+ 1109*z3^7*z5*z6^3+ 1132*z2*z3^5*z4*z5*z6^3-
    1110*z3^6*z4*z5*z6^3+ 1109*z2*z3^6*z6^4- 1119*z3^7*z6^4- 1110*z2*z3^5*z4*z6^4+
    1109*z3^6*z4*z6^4- 1110*z2*z3^5*z5*z6^4+ 1109*z3^6*z5*z6^4+
    1132*z2*z3^4*z4*z5*z6^4- 1110*z3^5*z4*z5*z6^4+ 1109*z2*z3^5*z6^5-
    1119*z3^6*z6^5- 1110*z2*z3^4*z4*z6^5+ 1109*z3^5*z4*z6^5- 1110*z2*z3^4*z5*z6^5+
    1109*z3^5*z5*z6^5+ 1132*z2*z3^3*z4*z5*z6^5- 1110*z3^4*z4*z5*z6^5+
    1109*z2*z3^4*z6^6- 1119*z3^5*z6^6- 1110*z2*z3^3*z4*z6^6+ 1109*z3^4*z4*z6^6-
    1110*z2*z3^3*z5*z6^6+ 1109*z3^4*z5*z6^6+ 1132*z2*z3^2*z4*z5*z6^6-
    1110*z3^3*z4*z5*z6^6+ 1109*z2*z3^3*z6^7- 1119*z3^4*z6^7- 1110*z2*z3^2*z4*z6^7+
    1109*z3^3*z4*z6^7- 1110*z2*z3^2*z5*z6^7+ 1109*z3^3*z5*z6^7+
    1132*z2*z3*z4*z5*z6^7- 1110*z3^2*z4*z5*z6^7+ 1109*z2*z3^2*z6^8-
    1119*z3^3*z6^8- 1110*z2*z3*z4*z6^8+ 1109*z3^2*z4*z6^8- 1110*z2*z3*z5*z6^8+
    1109*z3^2*z5*z6^8- 2231*z2*z4*z5*z6^8- 1110*z3*z4*z5*z6^8+ 1109*z2*z3*z6^9-
    1119*z3^2*z6^9+ 1121*z2*z4*z6^9+ 1109*z3*z4*z6^9+ 1121*z2*z5*z6^9+
    1109*z3*z5*z6^9+ 1121*z4*z5*z6^9- 12*z2*z6^10- 1119*z3*z6^10- 12*z4*z6^10-
    12*z5*z6^10- 1107*z6^11+ 1121*z2*z3^9*z7- 12*z3^10*z7- 2231*z2*z3^8*z4*z7+
    1121*z3^9*z4*z7- 2231*z2*z3^8*z5*z7+ 1121*z3^9*z5*z7+ 3363*z2*z3^7*z4*z5*z7-
    2231*z3^8*z4*z5*z7- 1110*z2*z3^8*z6*z7+ 1109*z3^9*z6*z7+
    1132*z2*z3^7*z4*z6*z7- 1110*z3^8*z4*z6*z7+ 1132*z2*z3^7*z5*z6*z7-
    1110*z3^8*z5*z6*z7- 1187*z2*z3^6*z4*z5*z6*z7+ 1132*z3^7*z4*z5*z6*z7-
    1110*z2*z3^7*z6^2*z7+ 1109*z3^8*z6^2*z7+ 1132*z2*z3^6*z4*z6^2*z7-
    1110*z3^7*z4*z6^2*z7+ 1132*z2*z3^6*z5*z6^2*z7- 1110*z3^7*z5*z6^2*z7-
    1187*z2*z3^5*z4*z5*z6^2*z7+ 1132*z3^6*z4*z5*z6^2*z7- 1110*z2*z3^6*z6^3*z7+
    1109*z3^7*z6^3*z7+ 1132*z2*z3^5*z4*z6^3*z7- 1110*z3^6*z4*z6^3*z7+
    1132*z2*z3^5*z5*z6^3*z7- 1110*z3^6*z5*z6^3*z7- 1187*z2*z3^4*z4*z5*z6^3*z7+
    1132*z3^5*z4*z5*z6^3*z7- 1110*z2*z3^5*z6^4*z7+ 1109*z3^6*z6^4*z7+
    1132*z2*z3^4*z4*z6^4*z7- 1110*z3^5*z4*z6^4*z7+ 1132*z2*z3^4*z5*z6^4*z7-
    1110*z3^5*z5*z6^4*z7- 1187*z2*z3^3*z4*z5*z6^4*z7+ 1132*z3^4*z4*z5*z6^4*z7-
    1110*z2*z3^4*z6^5*z7+ 1109*z3^5*z6^5*z7+ 1132*z2*z3^3*z4*z6^5*z7-
    1110*z3^4*z4*z6^5*z7+ 1132*z2*z3^3*z5*z6^5*z7- 1110*z3^4*z5*z6^5*z7-
    1187*z2*z3^2*z4*z5*z6^5*z7+ 1132*z3^3*z4*z5*z6^5*z7- 1110*z2*z3^3*z6^6*z7+
    1109*z3^4*z6^6*z7+ 1132*z2*z3^2*z4*z6^6*z7- 1110*z3^3*z4*z6^6*z7+
    1132*z2*z3^2*z5*z6^6*z7- 1110*z3^3*z5*z6^6*z7- 1187*z2*z3*z4*z5*z6^6*z7+
    1132*z3^2*z4*z5*z6^6*z7- 1110*z2*z3^2*z6^7*z7+ 1109*z3^3*z6^7*z7+
    1132*z2*z3*z4*z6^7*z7- 1110*z3^2*z4*z6^7*z7+ 1132*z2*z3*z5*z6^7*z7-
    1110*z3^2*z5*z6^7*z7+ 3363*z2*z4*z5*z6^7*z7+ 1132*z3*z4*z5*z6^7*z7-
    1110*z2*z3*z6^8*z7+ 1109*z3^2*z6^8*z7- 2231*z2*z4*z6^8*z7- 1110*z3*z4*z6^8*z7-
    2231*z2*z5*z6^8*z7- 1110*z3*z5*z6^8*z7- 2231*z4*z5*z6^8*z7+ 1121*z2*z6^9*z7+
    1109*z3*z6^9*z7+ 1121*z4*z6^9*z7+ 1121*z5*z6^9*z7- 12*z6^10*z7- 3374*z2*z3^8+
    2264*z3^9+ 3363*z2*z3^7*z4- 3374*z3^8*z4+ 3363*z2*z3^7*z5- 3374*z3^8*z5-
    1121*z2*z3^6*z4*z5+ 3363*z3^7*z4*z5- 11*z2*z3^7*z6- 1110*z3^8*z6+
    2242*z2*z3^6*z4*z6- 11*z3^7*z4*z6+ 2242*z2*z3^6*z5*z6- 11*z3^7*z5*z6+
    3396*z2*z3^5*z4*z5*z6+ 2242*z3^6*z4*z5*z6- 11*z2*z3^6*z6^2- 1110*z3^7*z6^2+
    2242*z2*z3^5*z4*z6^2- 11*z3^6*z4*z6^2+ 2242*z2*z3^5*z5*z6^2- 11*z3^6*z5*z6^2+
    3396*z2*z3^4*z4*z5*z6^2+ 2242*z3^5*z4*z5*z6^2- 11*z2*z3^5*z6^3-
    1110*z3^6*z6^3+ 2242*z2*z3^4*z4*z6^3- 11*z3^5*z4*z6^3+ 2242*z2*z3^4*z5*z6^3-
    11*z3^5*z5*z6^3+ 3396*z2*z3^3*z4*z5*z6^3+ 2242*z3^4*z4*z5*z6^3-
    11*z2*z3^4*z6^4- 1110*z3^5*z6^4+ 2242*z2*z3^3*z4*z6^4- 11*z3^4*z4*z6^4+
    2242*z2*z3^3*z5*z6^4- 11*z3^4*z5*z6^4+ 3396*z2*z3^2*z4*z5*z6^4+
    2242*z3^3*z4*z5*z6^4- 11*z2*z3^3*z6^5- 1110*z3^4*z6^5+ 2242*z2*z3^2*z4*z6^5-
    11*z3^3*z4*z6^5+ 2242*z2*z3^2*z5*z6^5- 11*z3^3*z5*z6^5+ 3396*z2*z3*z4*z5*z6^5+
    2242*z3^2*z4*z5*z6^5- 11*z2*z3^2*z6^6- 1110*z3^3*z6^6+ 2242*z2*z3*z4*z6^6-
    11*z3^2*z4*z6^6+ 2242*z2*z3*z5*z6^6- 11*z3^2*z5*z6^6- 1121*z2*z4*z5*z6^6+
    2242*z3*z4*z5*z6^6- 11*z2*z3*z6^7- 1110*z3^2*z6^7+ 3363*z2*z4*z6^7-
    11*z3*z4*z6^7+ 3363*z2*z5*z6^7- 11*z3*z5*z6^7+ 3363*z4*z5*z6^7- 3374*z2*z6^8-
    1110*z3*z6^8- 3374*z4*z6^8- 3374*z5*z6^8+ 2264*z6^9+ 3363*z2*z3^7*z7-
    3374*z3^8*z7- 1121*z2*z3^6*z4*z7+ 3363*z3^7*z4*z7- 1121*z2*z3^6*z5*z7+
    3363*z3^7*z5*z7- 4484*z2*z3^5*z4*z5*z7- 1121*z3^6*z4*z5*z7+
    2242*z2*z3^6*z6*z7- 11*z3^7*z6*z7+ 3396*z2*z3^5*z4*z6*z7+ 2242*z3^6*z4*z6*z7+
    3396*z2*z3^5*z5*z6*z7+ 2242*z3^6*z5*z6*z7+ 1154*z2*z3^4*z4*z5*z6*z7+
    3396*z3^5*z4*z5*z6*z7+ 2242*z2*z3^5*z6^2*z7- 11*z3^6*z6^2*z7+
    3396*z2*z3^4*z4*z6^2*z7+ 2242*z3^5*z4*z6^2*z7+ 3396*z2*z3^4*z5*z6^2*z7+
    2242*z3^5*z5*z6^2*z7+ 1154*z2*z3^3*z4*z5*z6^2*z7+ 3396*z3^4*z4*z5*z6^2*z7+
    2242*z2*z3^4*z6^3*z7- 11*z3^5*z6^3*z7+ 3396*z2*z3^3*z4*z6^3*z7+
    2242*z3^4*z4*z6^3*z7+ 3396*z2*z3^3*z5*z6^3*z7+ 2242*z3^4*z5*z6^3*z7+
    1154*z2*z3^2*z4*z5*z6^3*z7+ 3396*z3^3*z4*z5*z6^3*z7+ 2242*z2*z3^3*z6^4*z7-
    11*z3^4*z6^4*z7+ 3396*z2*z3^2*z4*z6^4*z7+ 2242*z3^3*z4*z6^4*z7+
    3396*z2*z3^2*z5*z6^4*z7+ 2242*z3^3*z5*z6^4*z7+ 1154*z2*z3*z4*z5*z6^4*z7+
    3396*z3^2*z4*z5*z6^4*z7+ 2242*z2*z3^2*z6^5*z7- 11*z3^3*z6^5*z7+
    3396*z2*z3*z4*z6^5*z7+ 2242*z3^2*z4*z6^5*z7+ 3396*z2*z3*z5*z6^5*z7+
    2242*z3^2*z5*z6^5*z7- 4484*z2*z4*z5*z6^5*z7+ 3396*z3*z4*z5*z6^5*z7+
    2242*z2*z3*z6^6*z7- 11*z3^2*z6^6*z7- 1121*z2*z4*z6^6*z7+ 2242*z3*z4*z6^6*z7-
    1121*z2*z5*z6^6*z7+ 2242*z3*z5*z6^6*z7- 1121*z4*z5*z6^6*z7+ 3363*z2*z6^7*z7-
    11*z3*z6^7*z7+ 3363*z4*z6^7*z7+ 3363*z5*z6^7*z7- 3374*z6^8*z7+ 147*z2*z3^6+
    2604*z3^7+ 2740*z2*z3^5*z4+ 147*z3^6*z4+ 2740*z2*z3^5*z5+ 147*z3^6*z5+
    4495*z2*z3^4*z4*z5+ 2740*z3^5*z4*z5+ 2887*z2*z3^5*z6+ 2751*z3^6*z6-
    1766*z2*z3^4*z4*z6+ 2887*z3^5*z4*z6- 1766*z2*z3^4*z5*z6+ 2887*z3^5*z5*z6-
    2751*z2*z3^3*z4*z5*z6- 1766*z3^4*z4*z5*z6+ 2887*z2*z3^4*z6^2+ 2751*z3^5*z6^2-
    1766*z2*z3^3*z4*z6^2+ 2887*z3^4*z4*z6^2- 1766*z2*z3^3*z5*z6^2+
    2887*z3^4*z5*z6^2- 2751*z2*z3^2*z4*z5*z6^2- 1766*z3^3*z4*z5*z6^2+
    2887*z2*z3^3*z6^3+ 2751*z3^4*z6^3- 1766*z2*z3^2*z4*z6^3+ 2887*z3^3*z4*z6^3-
    1766*z2*z3^2*z5*z6^3+ 2887*z3^3*z5*z6^3- 2751*z2*z3*z4*z5*z6^3-
    1766*z3^2*z4*z5*z6^3+ 2887*z2*z3^2*z6^4+ 2751*z3^3*z6^4- 1766*z2*z3*z4*z6^4+
    2887*z3^2*z4*z6^4- 1766*z2*z3*z5*z6^4+ 2887*z3^2*z5*z6^4+ 4495*z2*z4*z5*z6^4-
    1766*z3*z4*z5*z6^4+ 2887*z2*z3*z6^5+ 2751*z3^2*z6^5+ 2740*z2*z4*z6^5+
    2887*z3*z4*z6^5+ 2740*z2*z5*z6^5+ 2887*z3*z5*z6^5+ 2740*z4*z5*z6^5+
    147*z2*z6^6+ 2751*z3*z6^6+ 147*z4*z6^6+ 147*z5*z6^6+ 2604*z6^7+
    2740*z2*z3^5*z7+ 147*z3^6*z7+ 4495*z2*z3^4*z4*z7+ 2740*z3^5*z4*z7+
    4495*z2*z3^4*z5*z7+ 2740*z3^5*z5*z7+ 1755*z2*z3^3*z4*z5*z7+
    4495*z3^4*z4*z5*z7- 1766*z2*z3^4*z6*z7+ 2887*z3^5*z6*z7-
    2751*z2*z3^3*z4*z6*z7- 1766*z3^4*z4*z6*z7- 2751*z2*z3^3*z5*z6*z7-
    1766*z3^4*z5*z6*z7- 2887*z2*z3^2*z4*z5*z6*z7- 2751*z3^3*z4*z5*z6*z7-
    1766*z2*z3^3*z6^2*z7+ 2887*z3^4*z6^2*z7- 2751*z2*z3^2*z4*z6^2*z7-
    1766*z3^3*z4*z6^2*z7- 2751*z2*z3^2*z5*z6^2*z7- 1766*z3^3*z5*z6^2*z7-
    2887*z2*z3*z4*z5*z6^2*z7- 2751*z3^2*z4*z5*z6^2*z7- 1766*z2*z3^2*z6^3*z7+
    2887*z3^3*z6^3*z7- 2751*z2*z3*z4*z6^3*z7- 1766*z3^2*z4*z6^3*z7-
    2751*z2*z3*z5*z6^3*z7- 1766*z3^2*z5*z6^3*z7+ 1755*z2*z4*z5*z6^3*z7-
    2751*z3*z4*z5*z6^3*z7- 1766*z2*z3*z6^4*z7+ 2887*z3^2*z6^4*z7+
    4495*z2*z4*z6^4*z7- 1766*z3*z4*z6^4*z7+ 4495*z2*z5*z6^4*z7-
    1766*z3*z5*z6^4*z7+ 4495*z4*z5*z6^4*z7+ 2740*z2*z6^5*z7+ 2887*z3*z6^5*z7+
    2740*z4*z6^5*z7+ 2740*z5*z6^5*z7+ 147*z6^6*z7+ 318*z2*z3^4+ 2037*z3^5+
    3588*z2*z3^3*z4+ 318*z3^4*z4+ 3588*z2*z3^3*z5+ 318*z3^4*z5-
    2988*z2*z3^2*z4*z5+ 3588*z3^3*z4*z5+ 3906*z2*z3^3*z6+ 2355*z3^4*z6+
    600*z2*z3^2*z4*z6+ 3906*z3^3*z4*z6+ 600*z2*z3^2*z5*z6+ 3906*z3^3*z5*z6-
    2355*z2*z3*z4*z5*z6+ 600*z3^2*z4*z5*z6+ 3906*z2*z3^2*z6^2+ 2355*z3^3*z6^2+
    600*z2*z3*z4*z6^2+ 3906*z3^2*z4*z6^2+ 600*z2*z3*z5*z6^2+ 3906*z3^2*z5*z6^2-
    2988*z2*z4*z5*z6^2+ 600*z3*z4*z5*z6^2+ 3906*z2*z3*z6^3+ 2355*z3^2*z6^3+
    3588*z2*z4*z6^3+ 3906*z3*z4*z6^3+ 3588*z2*z5*z6^3+ 3906*z3*z5*z6^3+
    3588*z4*z5*z6^3+ 318*z2*z6^4+ 2355*z3*z6^4+ 318*z4*z6^4+ 318*z5*z6^4+
    2037*z6^5+ 3588*z2*z3^3*z7+ 318*z3^4*z7- 2988*z2*z3^2*z4*z7+ 3588*z3^3*z4*z7-
    2988*z2*z3^2*z5*z7+ 3588*z3^3*z5*z7+ 633*z2*z3*z4*z5*z7- 2988*z3^2*z4*z5*z7+
    600*z2*z3^2*z6*z7+ 3906*z3^3*z6*z7- 2355*z2*z3*z4*z6*z7+ 600*z3^2*z4*z6*z7-
    2355*z2*z3*z5*z6*z7+ 600*z3^2*z5*z6*z7+ 633*z2*z4*z5*z6*z7-
    2355*z3*z4*z5*z6*z7+ 600*z2*z3*z6^2*z7+ 3906*z3^2*z6^2*z7- 2988*z2*z4*z6^2*z7+
    600*z3*z4*z6^2*z7- 2988*z2*z5*z6^2*z7+ 600*z3*z5*z6^2*z7- 2988*z4*z5*z6^2*z7+
    3588*z2*z6^3*z7+ 3906*z3*z6^3*z7+ 3588*z4*z6^3*z7+ 3588*z5*z6^3*z7+
    318*z6^4*z7- 1776*z2*z3^2+ 2166*z3^3- 2202*z2*z3*z4- 1776*z3^2*z4-
    2202*z2*z3*z5- 1776*z3^2*z5- 1068*z2*z4*z5- 2202*z3*z4*z5- 3978*z2*z3*z6+
    390*z3^2*z6- 2202*z2*z4*z6- 3978*z3*z4*z6- 2202*z2*z5*z6- 3978*z3*z5*z6-
    2202*z4*z5*z6- 1776*z2*z6^2+ 390*z3*z6^2- 1776*z4*z6^2- 1776*z5*z6^2+
    2166*z6^3- 2202*z2*z3*z7- 1776*z3^2*z7- 1068*z2*z4*z7- 2202*z3*z4*z7-
    1068*z2*z5*z7- 2202*z3*z5*z7- 1068*z4*z5*z7- 2202*z2*z6*z7- 3978*z3*z6*z7-
    2202*z4*z6*z7- 2202*z5*z6*z7- 1776*z6^2*z7+ 3538*z2- 1169*z3+ 3538*z4+
    3538*z5- 1169*z6+ 3538*z7, - 4*z2*z3^14+ 2*z3^15+ 6*z2*z3^13*z4- 4*z3^14*z4+
    6*z2*z3^13*z5- 4*z3^14*z5- 8*z2*z3^12*z4*z5+ 6*z3^13*z4*z5+ 6*z2*z3^13*z6-
    4*z3^14*z6- 8*z2*z3^12*z4*z6+ 6*z3^13*z4*z6- 8*z2*z3^12*z5*z6+ 6*z3^13*z5*z6+
    10*z2*z3^11*z4*z5*z6- 8*z3^12*z4*z5*z6+ 2*z2*z3^13*z7- 2*z3^14*z7-
    2*z2*z3^12*z4*z7+ 2*z3^13*z4*z7- 2*z2*z3^12*z5*z7+ 2*z3^13*z5*z7+
    2*z2*z3^11*z4*z5*z7- 2*z3^12*z4*z5*z7- 2*z2*z3^12*z6*z7+ 2*z3^13*z6*z7+
    2*z2*z3^11*z4*z6*z7- 2*z3^12*z4*z6*z7+ 2*z2*z3^11*z5*z6*z7- 2*z3^12*z5*z6*z7-
    2*z2*z3^10*z4*z5*z6*z7+ 2*z3^11*z4*z5*z6*z7+ 2*z2*z3^12*z7^2- 2*z3^13*z7^2-
    2*z2*z3^11*z4*z7^2+ 2*z3^12*z4*z7^2- 2*z2*z3^11*z5*z7^2+ 2*z3^12*z5*z7^2+
    2*z2*z3^10*z4*z5*z7^2- 2*z3^11*z4*z5*z7^2- 2*z2*z3^11*z6*z7^2+
    2*z3^12*z6*z7^2+ 2*z2*z3^10*z4*z6*z7^2- 2*z3^11*z4*z6*z7^2+
    2*z2*z3^10*z5*z6*z7^2- 2*z3^11*z5*z6*z7^2- 2*z2*z3^9*z4*z5*z6*z7^2+
    2*z3^10*z4*z5*z6*z7^2+ 2*z2*z3^11*z7^3- 2*z3^12*z7^3- 2*z2*z3^10*z4*z7^3+
    2*z3^11*z4*z7^3- 2*z2*z3^10*z5*z7^3+ 2*z3^11*z5*z7^3+ 2*z2*z3^9*z4*z5*z7^3-
    2*z3^10*z4*z5*z7^3- 2*z2*z3^10*z6*z7^3+ 2*z3^11*z6*z7^3+ 2*z2*z3^9*z4*z6*z7^3-
    2*z3^10*z4*z6*z7^3+ 2*z2*z3^9*z5*z6*z7^3- 2*z3^10*z5*z6*z7^3-
    2*z2*z3^8*z4*z5*z6*z7^3+ 2*z3^9*z4*z5*z6*z7^3+ 2*z2*z3^10*z7^4- 2*z3^11*z7^4-
    2*z2*z3^9*z4*z7^4+ 2*z3^10*z4*z7^4- 2*z2*z3^9*z5*z7^4+ 2*z3^10*z5*z7^4+
    2*z2*z3^8*z4*z5*z7^4- 2*z3^9*z4*z5*z7^4- 2*z2*z3^9*z6*z7^4+ 2*z3^10*z6*z7^4+
    2*z2*z3^8*z4*z6*z7^4- 2*z3^9*z4*z6*z7^4+ 2*z2*z3^8*z5*z6*z7^4-
    2*z3^9*z5*z6*z7^4- 2*z2*z3^7*z4*z5*z6*z7^4+ 2*z3^8*z4*z5*z6*z7^4+
    2*z2*z3^9*z7^5- 2*z3^10*z7^5- 2*z2*z3^8*z4*z7^5+ 2*z3^9*z4*z7^5-
    2*z2*z3^8*z5*z7^5+ 2*z3^9*z5*z7^5+ 2*z2*z3^7*z4*z5*z7^5- 2*z3^8*z4*z5*z7^5-
    2*z2*z3^8*z6*z7^5+ 2*z3^9*z6*z7^5+ 2*z2*z3^7*z4*z6*z7^5- 2*z3^8*z4*z6*z7^5+
    2*z2*z3^7*z5*z6*z7^5- 2*z3^8*z5*z6*z7^5- 2*z2*z3^6*z4*z5*z6*z7^5+
    2*z3^7*z4*z5*z6*z7^5+ 2*z2*z3^8*z7^6- 2*z3^9*z7^6- 2*z2*z3^7*z4*z7^6+
    2*z3^8*z4*z7^6- 2*z2*z3^7*z5*z7^6+ 2*z3^8*z5*z7^6+ 2*z2*z3^6*z4*z5*z7^6-
    2*z3^7*z4*z5*z7^6- 2*z2*z3^7*z6*z7^6+ 2*z3^8*z6*z7^6+ 2*z2*z3^6*z4*z6*z7^6-
    2*z3^7*z4*z6*z7^6+ 2*z2*z3^6*z5*z6*z7^6- 2*z3^7*z5*z6*z7^6-
    2*z2*z3^5*z4*z5*z6*z7^6+ 2*z3^6*z4*z5*z6*z7^6+ 2*z2*z3^7*z7^7- 2*z3^8*z7^7-
    2*z2*z3^6*z4*z7^7+ 2*z3^7*z4*z7^7- 2*z2*z3^6*z5*z7^7+ 2*z3^7*z5*z7^7+
    2*z2*z3^5*z4*z5*z7^7- 2*z3^6*z4*z5*z7^7- 2*z2*z3^6*z6*z7^7+ 2*z3^7*z6*z7^7+
    2*z2*z3^5*z4*z6*z7^7- 2*z3^6*z4*z6*z7^7+ 2*z2*z3^5*z5*z6*z7^7-
    2*z3^6*z5*z6*z7^7- 2*z2*z3^4*z4*z5*z6*z7^7+ 2*z3^5*z4*z5*z6*z7^7+
    2*z2*z3^6*z7^8- 2*z3^7*z7^8- 2*z2*z3^5*z4*z7^8+ 2*z3^6*z4*z7^8-
    2*z2*z3^5*z5*z7^8+ 2*z3^6*z5*z7^8+ 2*z2*z3^4*z4*z5*z7^8- 2*z3^5*z4*z5*z7^8-
    2*z2*z3^5*z6*z7^8+ 2*z3^6*z6*z7^8+ 2*z2*z3^4*z4*z6*z7^8- 2*z3^5*z4*z6*z7^8+
    2*z2*z3^4*z5*z6*z7^8- 2*z3^5*z5*z6*z7^8- 2*z2*z3^3*z4*z5*z6*z7^8+
    2*z3^4*z4*z5*z6*z7^8+ 2*z2*z3^5*z7^9- 2*z3^6*z7^9- 2*z2*z3^4*z4*z7^9+
    2*z3^5*z4*z7^9- 2*z2*z3^4*z5*z7^9+ 2*z3^5*z5*z7^9+ 2*z2*z3^3*z4*z5*z7^9-
    2*z3^4*z4*z5*z7^9- 2*z2*z3^4*z6*z7^9+ 2*z3^5*z6*z7^9+ 2*z2*z3^3*z4*z6*z7^9-
    2*z3^4*z4*z6*z7^9+ 2*z2*z3^3*z5*z6*z7^9- 2*z3^4*z5*z6*z7^9-
    2*z2*z3^2*z4*z5*z6*z7^9+ 2*z3^3*z4*z5*z6*z7^9+ 2*z2*z3^4*z7^10- 2*z3^5*z7^10-
    2*z2*z3^3*z4*z7^10+ 2*z3^4*z4*z7^10- 2*z2*z3^3*z5*z7^10+ 2*z3^4*z5*z7^10+
    2*z2*z3^2*z4*z5*z7^10- 2*z3^3*z4*z5*z7^10- 2*z2*z3^3*z6*z7^10+
    2*z3^4*z6*z7^10+ 2*z2*z3^2*z4*z6*z7^10- 2*z3^3*z4*z6*z7^10+
    2*z2*z3^2*z5*z6*z7^10- 2*z3^3*z5*z6*z7^10- 2*z2*z3*z4*z5*z6*z7^10+
    2*z3^2*z4*z5*z6*z7^10+ 2*z2*z3^3*z7^11- 2*z3^4*z7^11- 2*z2*z3^2*z4*z7^11+
    2*z3^3*z4*z7^11- 2*z2*z3^2*z5*z7^11+ 2*z3^3*z5*z7^11+ 2*z2*z3*z4*z5*z7^11-
    2*z3^2*z4*z5*z7^11- 2*z2*z3^2*z6*z7^11+ 2*z3^3*z6*z7^11+ 2*z2*z3*z4*z6*z7^11-
    2*z3^2*z4*z6*z7^11+ 2*z2*z3*z5*z6*z7^11- 2*z3^2*z5*z6*z7^11+
    10*z2*z4*z5*z6*z7^11+ 2*z3*z4*z5*z6*z7^11+ 2*z2*z3^2*z7^12- 2*z3^3*z7^12-
    2*z2*z3*z4*z7^12+ 2*z3^2*z4*z7^12- 2*z2*z3*z5*z7^12+ 2*z3^2*z5*z7^12-
    8*z2*z4*z5*z7^12- 2*z3*z4*z5*z7^12- 2*z2*z3*z6*z7^12+ 2*z3^2*z6*z7^12-
    8*z2*z4*z6*z7^12- 2*z3*z4*z6*z7^12- 8*z2*z5*z6*z7^12- 2*z3*z5*z6*z7^12-
    8*z4*z5*z6*z7^12+ 2*z2*z3*z7^13- 2*z3^2*z7^13+ 6*z2*z4*z7^13+ 2*z3*z4*z7^13+
    6*z2*z5*z7^13+ 2*z3*z5*z7^13+ 6*z4*z5*z7^13+ 6*z2*z6*z7^13+ 2*z3*z6*z7^13+
    6*z4*z6*z7^13+ 6*z5*z6*z7^13- 4*z2*z7^14- 2*z3*z7^14- 4*z4*z7^14- 4*z5*z7^14-
    4*z6*z7^14+ 2*z7^15- 13*z2*z3^12+ 10*z3^13+ 10*z2*z3^11*z4- 13*z3^12*z4+
    10*z2*z3^11*z5- 13*z3^12*z5+ z2*z3^10*z4*z5+ 10*z3^11*z4*z5+ 10*z2*z3^11*z6-
    13*z3^12*z6+ z2*z3^10*z4*z6+ 10*z3^11*z4*z6+ z2*z3^10*z5*z6+ 10*z3^11*z5*z6-
    22*z2*z3^9*z4*z5*z6+ z3^10*z4*z5*z6- 3*z2*z3^11*z7- 3*z3^12*z7+
    11*z2*z3^10*z4*z7- 3*z3^11*z4*z7+ 11*z2*z3^10*z5*z7- 3*z3^11*z5*z7-
    21*z2*z3^9*z4*z5*z7+ 11*z3^10*z4*z5*z7+ 11*z2*z3^10*z6*z7- 3*z3^11*z6*z7-
    21*z2*z3^9*z4*z6*z7+ 11*z3^10*z4*z6*z7- 21*z2*z3^9*z5*z6*z7+
    11*z3^10*z5*z6*z7+ 33*z2*z3^8*z4*z5*z6*z7- 21*z3^9*z4*z5*z6*z7-
    3*z2*z3^10*z7^2- 3*z3^11*z7^2+ 11*z2*z3^9*z4*z7^2- 3*z3^10*z4*z7^2+
    11*z2*z3^9*z5*z7^2- 3*z3^10*z5*z7^2- 21*z2*z3^8*z4*z5*z7^2+
    11*z3^9*z4*z5*z7^2+ 11*z2*z3^9*z6*z7^2- 3*z3^10*z6*z7^2-
    21*z2*z3^8*z4*z6*z7^2+ 11*z3^9*z4*z6*z7^2- 21*z2*z3^8*z5*z6*z7^2+
    11*z3^9*z5*z6*z7^2+ 33*z2*z3^7*z4*z5*z6*z7^2- 21*z3^8*z4*z5*z6*z7^2-
    3*z2*z3^9*z7^3- 3*z3^10*z7^3+ 11*z2*z3^8*z4*z7^3- 3*z3^9*z4*z7^3+
    11*z2*z3^8*z5*z7^3- 3*z3^9*z5*z7^3- 21*z2*z3^7*z4*z5*z7^3+ 11*z3^8*z4*z5*z7^3+
    11*z2*z3^8*z6*z7^3- 3*z3^9*z6*z7^3- 21*z2*z3^7*z4*z6*z7^3+ 11*z3^8*z4*z6*z7^3-
    21*z2*z3^7*z5*z6*z7^3+ 11*z3^8*z5*z6*z7^3+ 33*z2*z3^6*z4*z5*z6*z7^3-
    21*z3^7*z4*z5*z6*z7^3- 3*z2*z3^8*z7^4- 3*z3^9*z7^4+ 11*z2*z3^7*z4*z7^4-
    3*z3^8*z4*z7^4+ 11*z2*z3^7*z5*z7^4- 3*z3^8*z5*z7^4- 21*z2*z3^6*z4*z5*z7^4+
    11*z3^7*z4*z5*z7^4+ 11*z2*z3^7*z6*z7^4- 3*z3^8*z6*z7^4- 21*z2*z3^6*z4*z6*z7^4+
    11*z3^7*z4*z6*z7^4- 21*z2*z3^6*z5*z6*z7^4+ 11*z3^7*z5*z6*z7^4+
    33*z2*z3^5*z4*z5*z6*z7^4- 21*z3^6*z4*z5*z6*z7^4- 3*z2*z3^7*z7^5- 3*z3^8*z7^5+
    11*z2*z3^6*z4*z7^5- 3*z3^7*z4*z7^5+ 11*z2*z3^6*z5*z7^5- 3*z3^7*z5*z7^5-
    21*z2*z3^5*z4*z5*z7^5+ 11*z3^6*z4*z5*z7^5+ 11*z2*z3^6*z6*z7^5- 3*z3^7*z6*z7^5-
    21*z2*z3^5*z4*z6*z7^5+ 11*z3^6*z4*z6*z7^5- 21*z2*z3^5*z5*z6*z7^5+
    11*z3^6*z5*z6*z7^5+ 33*z2*z3^4*z4*z5*z6*z7^5- 21*z3^5*z4*z5*z6*z7^5-
    3*z2*z3^6*z7^6- 3*z3^7*z7^6+ 11*z2*z3^5*z4*z7^6- 3*z3^6*z4*z7^6+
    11*z2*z3^5*z5*z7^6- 3*z3^6*z5*z7^6- 21*z2*z3^4*z4*z5*z7^6+ 11*z3^5*z4*z5*z7^6+
    11*z2*z3^5*z6*z7^6- 3*z3^6*z6*z7^6- 21*z2*z3^4*z4*z6*z7^6+ 11*z3^5*z4*z6*z7^6-
    21*z2*z3^4*z5*z6*z7^6+ 11*z3^5*z5*z6*z7^6+ 33*z2*z3^3*z4*z5*z6*z7^6-
    21*z3^4*z4*z5*z6*z7^6- 3*z2*z3^5*z7^7- 3*z3^6*z7^7+ 11*z2*z3^4*z4*z7^7-
    3*z3^5*z4*z7^7+ 11*z2*z3^4*z5*z7^7- 3*z3^5*z5*z7^7- 21*z2*z3^3*z4*z5*z7^7+
    11*z3^4*z4*z5*z7^7+ 11*z2*z3^4*z6*z7^7- 3*z3^5*z6*z7^7- 21*z2*z3^3*z4*z6*z7^7+
    11*z3^4*z4*z6*z7^7- 21*z2*z3^3*z5*z6*z7^7+ 11*z3^4*z5*z6*z7^7+
    33*z2*z3^2*z4*z5*z6*z7^7- 21*z3^3*z4*z5*z6*z7^7- 3*z2*z3^4*z7^8- 3*z3^5*z7^8+
    11*z2*z3^3*z4*z7^8- 3*z3^4*z4*z7^8+ 11*z2*z3^3*z5*z7^8- 3*z3^4*z5*z7^8-
    21*z2*z3^2*z4*z5*z7^8+ 11*z3^3*z4*z5*z7^8+ 11*z2*z3^3*z6*z7^8- 3*z3^4*z6*z7^8-
    21*z2*z3^2*z4*z6*z7^8+ 11*z3^3*z4*z6*z7^8- 21*z2*z3^2*z5*z6*z7^8+
    11*z3^3*z5*z6*z7^8+ 33*z2*z3*z4*z5*z6*z7^8- 21*z3^2*z4*z5*z6*z7^8-
    3*z2*z3^3*z7^9- 3*z3^4*z7^9+ 11*z2*z3^2*z4*z7^9- 3*z3^3*z4*z7^9+
    11*z2*z3^2*z5*z7^9- 3*z3^3*z5*z7^9- 21*z2*z3*z4*z5*z7^9+ 11*z3^2*z4*z5*z7^9+
    11*z2*z3^2*z6*z7^9- 3*z3^3*z6*z7^9- 21*z2*z3*z4*z6*z7^9+ 11*z3^2*z4*z6*z7^9-
    21*z2*z3*z5*z6*z7^9+ 11*z3^2*z5*z6*z7^9- 22*z2*z4*z5*z6*z7^9-
    21*z3*z4*z5*z6*z7^9- 3*z2*z3^2*z7^10- 3*z3^3*z7^10+ 11*z2*z3*z4*z7^10-
    3*z3^2*z4*z7^10+ 11*z2*z3*z5*z7^10- 3*z3^2*z5*z7^10+ z2*z4*z5*z7^10+
    11*z3*z4*z5*z7^10+ 11*z2*z3*z6*z7^10- 3*z3^2*z6*z7^10+ z2*z4*z6*z7^10+
    11*z3*z4*z6*z7^10+ z2*z5*z6*z7^10+ 11*z3*z5*z6*z7^10+ z4*z5*z6*z7^10-
    3*z2*z3*z7^11- 3*z3^2*z7^11+ 10*z2*z4*z7^11- 3*z3*z4*z7^11+ 10*z2*z5*z7^11-
    3*z3*z5*z7^11+ 10*z4*z5*z7^11+ 10*z2*z6*z7^11- 3*z3*z6*z7^11+ 10*z4*z6*z7^11+
    10*z5*z6*z7^11- 13*z2*z7^12- 3*z3*z7^12- 13*z4*z7^12- 13*z5*z7^12-
    13*z6*z7^12+ 10*z7^13- 12*z2*z3^10- 1107*z3^11+ 1121*z2*z3^9*z4- 12*z3^10*z4+
    1121*z2*z3^9*z5- 12*z3^10*z5- 2231*z2*z3^8*z4*z5+ 1121*z3^9*z4*z5+
    1121*z2*z3^9*z6- 12*z3^10*z6- 2231*z2*z3^8*z4*z6+ 1121*z3^9*z4*z6-
    2231*z2*z3^8*z5*z6+ 1121*z3^9*z5*z6+ 3363*z2*z3^7*z4*z5*z6-
    2231*z3^8*z4*z5*z6+ 1109*z2*z3^9*z7- 1119*z3^10*z7- 1110*z2*z3^8*z4*z7+
    1109*z3^9*z4*z7- 1110*z2*z3^8*z5*z7+ 1109*z3^9*z5*z7+ 1132*z2*z3^7*z4*z5*z7-
    1110*z3^8*z4*z5*z7- 1110*z2*z3^8*z6*z7+ 1109*z3^9*z6*z7+
    1132*z2*z3^7*z4*z6*z7- 1110*z3^8*z4*z6*z7+ 1132*z2*z3^7*z5*z6*z7-
    1110*z3^8*z5*z6*z7- 1187*z2*z3^6*z4*z5*z6*z7+ 1132*z3^7*z4*z5*z6*z7+
    1109*z2*z3^8*z7^2- 1119*z3^9*z7^2- 1110*z2*z3^7*z4*z7^2+ 1109*z3^8*z4*z7^2-
    1110*z2*z3^7*z5*z7^2+ 1109*z3^8*z5*z7^2+ 1132*z2*z3^6*z4*z5*z7^2-
    1110*z3^7*z4*z5*z7^2- 1110*z2*z3^7*z6*z7^2+ 1109*z3^8*z6*z7^2+
    1132*z2*z3^6*z4*z6*z7^2- 1110*z3^7*z4*z6*z7^2+ 1132*z2*z3^6*z5*z6*z7^2-
    1110*z3^7*z5*z6*z7^2- 1187*z2*z3^5*z4*z5*z6*z7^2+ 1132*z3^6*z4*z5*z6*z7^2+
    1109*z2*z3^7*z7^3- 1119*z3^8*z7^3- 1110*z2*z3^6*z4*z7^3+ 1109*z3^7*z4*z7^3-
    1110*z2*z3^6*z5*z7^3+ 1109*z3^7*z5*z7^3+ 1132*z2*z3^5*z4*z5*z7^3-
    1110*z3^6*z4*z5*z7^3- 1110*z2*z3^6*z6*z7^3+ 1109*z3^7*z6*z7^3+
    1132*z2*z3^5*z4*z6*z7^3- 1110*z3^6*z4*z6*z7^3+ 1132*z2*z3^5*z5*z6*z7^3-
    1110*z3^6*z5*z6*z7^3- 1187*z2*z3^4*z4*z5*z6*z7^3+ 1132*z3^5*z4*z5*z6*z7^3+
    1109*z2*z3^6*z7^4- 1119*z3^7*z7^4- 1110*z2*z3^5*z4*z7^4+ 1109*z3^6*z4*z7^4-
    1110*z2*z3^5*z5*z7^4+ 1109*z3^6*z5*z7^4+ 1132*z2*z3^4*z4*z5*z7^4-
    1110*z3^5*z4*z5*z7^4- 1110*z2*z3^5*z6*z7^4+ 1109*z3^6*z6*z7^4+
    1132*z2*z3^4*z4*z6*z7^4- 1110*z3^5*z4*z6*z7^4+ 1132*z2*z3^4*z5*z6*z7^4-
    1110*z3^5*z5*z6*z7^4- 1187*z2*z3^3*z4*z5*z6*z7^4+ 1132*z3^4*z4*z5*z6*z7^4+
    1109*z2*z3^5*z7^5- 1119*z3^6*z7^5- 1110*z2*z3^4*z4*z7^5+ 1109*z3^5*z4*z7^5-
    1110*z2*z3^4*z5*z7^5+ 1109*z3^5*z5*z7^5+ 1132*z2*z3^3*z4*z5*z7^5-
    1110*z3^4*z4*z5*z7^5- 1110*z2*z3^4*z6*z7^5+ 1109*z3^5*z6*z7^5+
    1132*z2*z3^3*z4*z6*z7^5- 1110*z3^4*z4*z6*z7^5+ 1132*z2*z3^3*z5*z6*z7^5-
    1110*z3^4*z5*z6*z7^5- 1187*z2*z3^2*z4*z5*z6*z7^5+ 1132*z3^3*z4*z5*z6*z7^5+
    1109*z2*z3^4*z7^6- 1119*z3^5*z7^6- 1110*z2*z3^3*z4*z7^6+ 1109*z3^4*z4*z7^6-
    1110*z2*z3^3*z5*z7^6+ 1109*z3^4*z5*z7^6+ 1132*z2*z3^2*z4*z5*z7^6-
    1110*z3^3*z4*z5*z7^6- 1110*z2*z3^3*z6*z7^6+ 1109*z3^4*z6*z7^6+
    1132*z2*z3^2*z4*z6*z7^6- 1110*z3^3*z4*z6*z7^6+ 1132*z2*z3^2*z5*z6*z7^6-
    1110*z3^3*z5*z6*z7^6- 1187*z2*z3*z4*z5*z6*z7^6+ 1132*z3^2*z4*z5*z6*z7^6+
    1109*z2*z3^3*z7^7- 1119*z3^4*z7^7- 1110*z2*z3^2*z4*z7^7+ 1109*z3^3*z4*z7^7-
    1110*z2*z3^2*z5*z7^7+ 1109*z3^3*z5*z7^7+ 1132*z2*z3*z4*z5*z7^7-
    1110*z3^2*z4*z5*z7^7- 1110*z2*z3^2*z6*z7^7+ 1109*z3^3*z6*z7^7+
    1132*z2*z3*z4*z6*z7^7- 1110*z3^2*z4*z6*z7^7+ 1132*z2*z3*z5*z6*z7^7-
    1110*z3^2*z5*z6*z7^7+ 3363*z2*z4*z5*z6*z7^7+ 1132*z3*z4*z5*z6*z7^7+
    1109*z2*z3^2*z7^8- 1119*z3^3*z7^8- 1110*z2*z3*z4*z7^8+ 1109*z3^2*z4*z7^8-
    1110*z2*z3*z5*z7^8+ 1109*z3^2*z5*z7^8- 2231*z2*z4*z5*z7^8- 1110*z3*z4*z5*z7^8-
    1110*z2*z3*z6*z7^8+ 1109*z3^2*z6*z7^8- 2231*z2*z4*z6*z7^8- 1110*z3*z4*z6*z7^8-
    2231*z2*z5*z6*z7^8- 1110*z3*z5*z6*z7^8- 2231*z4*z5*z6*z7^8+ 1109*z2*z3*z7^9-
    1119*z3^2*z7^9+ 1121*z2*z4*z7^9+ 1109*z3*z4*z7^9+ 1121*z2*z5*z7^9+
    1109*z3*z5*z7^9+ 1121*z4*z5*z7^9+ 1121*z2*z6*z7^9+ 1109*z3*z6*z7^9+
    1121*z4*z6*z7^9+ 1121*z5*z6*z7^9- 12*z2*z7^10- 1119*z3*z7^10- 12*z4*z7^10-
    12*z5*z7^10- 12*z6*z7^10- 1107*z7^11- 3374*z2*z3^8+ 2264*z3^9+
    3363*z2*z3^7*z4- 3374*z3^8*z4+ 3363*z2*z3^7*z5- 3374*z3^8*z5-
    1121*z2*z3^6*z4*z5+ 3363*z3^7*z4*z5+ 3363*z2*z3^7*z6- 3374*z3^8*z6-
    1121*z2*z3^6*z4*z6+ 3363*z3^7*z4*z6- 1121*z2*z3^6*z5*z6+ 3363*z3^7*z5*z6-
    4484*z2*z3^5*z4*z5*z6- 1121*z3^6*z4*z5*z6- 11*z2*z3^7*z7- 1110*z3^8*z7+
    2242*z2*z3^6*z4*z7- 11*z3^7*z4*z7+ 2242*z2*z3^6*z5*z7- 11*z3^7*z5*z7+
    3396*z2*z3^5*z4*z5*z7+ 2242*z3^6*z4*z5*z7+ 2242*z2*z3^6*z6*z7- 11*z3^7*z6*z7+
    3396*z2*z3^5*z4*z6*z7+ 2242*z3^6*z4*z6*z7+ 3396*z2*z3^5*z5*z6*z7+
    2242*z3^6*z5*z6*z7+ 1154*z2*z3^4*z4*z5*z6*z7+ 3396*z3^5*z4*z5*z6*z7-
    11*z2*z3^6*z7^2- 1110*z3^7*z7^2+ 2242*z2*z3^5*z4*z7^2- 11*z3^6*z4*z7^2+
    2242*z2*z3^5*z5*z7^2- 11*z3^6*z5*z7^2+ 3396*z2*z3^4*z4*z5*z7^2+
    2242*z3^5*z4*z5*z7^2+ 2242*z2*z3^5*z6*z7^2- 11*z3^6*z6*z7^2+
    3396*z2*z3^4*z4*z6*z7^2+ 2242*z3^5*z4*z6*z7^2+ 3396*z2*z3^4*z5*z6*z7^2+
    2242*z3^5*z5*z6*z7^2+ 1154*z2*z3^3*z4*z5*z6*z7^2+ 3396*z3^4*z4*z5*z6*z7^2-
    11*z2*z3^5*z7^3- 1110*z3^6*z7^3+ 2242*z2*z3^4*z4*z7^3- 11*z3^5*z4*z7^3+
    2242*z2*z3^4*z5*z7^3- 11*z3^5*z5*z7^3+ 3396*z2*z3^3*z4*z5*z7^3+
    2242*z3^4*z4*z5*z7^3+ 2242*z2*z3^4*z6*z7^3- 11*z3^5*z6*z7^3+
    3396*z2*z3^3*z4*z6*z7^3+ 2242*z3^4*z4*z6*z7^3+ 3396*z2*z3^3*z5*z6*z7^3+
    2242*z3^4*z5*z6*z7^3+ 1154*z2*z3^2*z4*z5*z6*z7^3+ 3396*z3^3*z4*z5*z6*z7^3-
    11*z2*z3^4*z7^4- 1110*z3^5*z7^4+ 2242*z2*z3^3*z4*z7^4- 11*z3^4*z4*z7^4+
    2242*z2*z3^3*z5*z7^4- 11*z3^4*z5*z7^4+ 3396*z2*z3^2*z4*z5*z7^4+
    2242*z3^3*z4*z5*z7^4+ 2242*z2*z3^3*z6*z7^4- 11*z3^4*z6*z7^4+
    3396*z2*z3^2*z4*z6*z7^4+ 2242*z3^3*z4*z6*z7^4+ 3396*z2*z3^2*z5*z6*z7^4+
    2242*z3^3*z5*z6*z7^4+ 1154*z2*z3*z4*z5*z6*z7^4+ 3396*z3^2*z4*z5*z6*z7^4-
    11*z2*z3^3*z7^5- 1110*z3^4*z7^5+ 2242*z2*z3^2*z4*z7^5- 11*z3^3*z4*z7^5+
    2242*z2*z3^2*z5*z7^5- 11*z3^3*z5*z7^5+ 3396*z2*z3*z4*z5*z7^5+
    2242*z3^2*z4*z5*z7^5+ 2242*z2*z3^2*z6*z7^5- 11*z3^3*z6*z7^5+
    3396*z2*z3*z4*z6*z7^5+ 2242*z3^2*z4*z6*z7^5+ 3396*z2*z3*z5*z6*z7^5+
    2242*z3^2*z5*z6*z7^5- 4484*z2*z4*z5*z6*z7^5+ 3396*z3*z4*z5*z6*z7^5-
    11*z2*z3^2*z7^6- 1110*z3^3*z7^6+ 2242*z2*z3*z4*z7^6- 11*z3^2*z4*z7^6+
    2242*z2*z3*z5*z7^6- 11*z3^2*z5*z7^6- 1121*z2*z4*z5*z7^6+ 2242*z3*z4*z5*z7^6+
    2242*z2*z3*z6*z7^6- 11*z3^2*z6*z7^6- 1121*z2*z4*z6*z7^6+ 2242*z3*z4*z6*z7^6-
    1121*z2*z5*z6*z7^6+ 2242*z3*z5*z6*z7^6- 1121*z4*z5*z6*z7^6- 11*z2*z3*z7^7-
    1110*z3^2*z7^7+ 3363*z2*z4*z7^7- 11*z3*z4*z7^7+ 3363*z2*z5*z7^7-
    11*z3*z5*z7^7+ 3363*z4*z5*z7^7+ 3363*z2*z6*z7^7- 11*z3*z6*z7^7+
    3363*z4*z6*z7^7+ 3363*z5*z6*z7^7- 3374*z2*z7^8- 1110*z3*z7^8- 3374*z4*z7^8-
    3374*z5*z7^8- 3374*z6*z7^8+ 2264*z7^9+ 147*z2*z3^6+ 2604*z3^7+
    2740*z2*z3^5*z4+ 147*z3^6*z4+ 2740*z2*z3^5*z5+ 147*z3^6*z5+
    4495*z2*z3^4*z4*z5+ 2740*z3^5*z4*z5+ 2740*z2*z3^5*z6+ 147*z3^6*z6+
    4495*z2*z3^4*z4*z6+ 2740*z3^5*z4*z6+ 4495*z2*z3^4*z5*z6+ 2740*z3^5*z5*z6+
    1755*z2*z3^3*z4*z5*z6+ 4495*z3^4*z4*z5*z6+ 2887*z2*z3^5*z7+ 2751*z3^6*z7-
    1766*z2*z3^4*z4*z7+ 2887*z3^5*z4*z7- 1766*z2*z3^4*z5*z7+ 2887*z3^5*z5*z7-
    2751*z2*z3^3*z4*z5*z7- 1766*z3^4*z4*z5*z7- 1766*z2*z3^4*z6*z7+
    2887*z3^5*z6*z7- 2751*z2*z3^3*z4*z6*z7- 1766*z3^4*z4*z6*z7-
    2751*z2*z3^3*z5*z6*z7- 1766*z3^4*z5*z6*z7- 2887*z2*z3^2*z4*z5*z6*z7-
    2751*z3^3*z4*z5*z6*z7+ 2887*z2*z3^4*z7^2+ 2751*z3^5*z7^2-
    1766*z2*z3^3*z4*z7^2+ 2887*z3^4*z4*z7^2- 1766*z2*z3^3*z5*z7^2+
    2887*z3^4*z5*z7^2- 2751*z2*z3^2*z4*z5*z7^2- 1766*z3^3*z4*z5*z7^2-
    1766*z2*z3^3*z6*z7^2+ 2887*z3^4*z6*z7^2- 2751*z2*z3^2*z4*z6*z7^2-
    1766*z3^3*z4*z6*z7^2- 2751*z2*z3^2*z5*z6*z7^2- 1766*z3^3*z5*z6*z7^2-
    2887*z2*z3*z4*z5*z6*z7^2- 2751*z3^2*z4*z5*z6*z7^2+ 2887*z2*z3^3*z7^3+
    2751*z3^4*z7^3- 1766*z2*z3^2*z4*z7^3+ 2887*z3^3*z4*z7^3- 1766*z2*z3^2*z5*z7^3+
    2887*z3^3*z5*z7^3- 2751*z2*z3*z4*z5*z7^3- 1766*z3^2*z4*z5*z7^3-
    1766*z2*z3^2*z6*z7^3+ 2887*z3^3*z6*z7^3- 2751*z2*z3*z4*z6*z7^3-
    1766*z3^2*z4*z6*z7^3- 2751*z2*z3*z5*z6*z7^3- 1766*z3^2*z5*z6*z7^3+
    1755*z2*z4*z5*z6*z7^3- 2751*z3*z4*z5*z6*z7^3+ 2887*z2*z3^2*z7^4+
    2751*z3^3*z7^4- 1766*z2*z3*z4*z7^4+ 2887*z3^2*z4*z7^4- 1766*z2*z3*z5*z7^4+
    2887*z3^2*z5*z7^4+ 4495*z2*z4*z5*z7^4- 1766*z3*z4*z5*z7^4- 1766*z2*z3*z6*z7^4+
    2887*z3^2*z6*z7^4+ 4495*z2*z4*z6*z7^4- 1766*z3*z4*z6*z7^4+ 4495*z2*z5*z6*z7^4-
    1766*z3*z5*z6*z7^4+ 4495*z4*z5*z6*z7^4+ 2887*z2*z3*z7^5+ 2751*z3^2*z7^5+
    2740*z2*z4*z7^5+ 2887*z3*z4*z7^5+ 2740*z2*z5*z7^5+ 2887*z3*z5*z7^5+
    2740*z4*z5*z7^5+ 2740*z2*z6*z7^5+ 2887*z3*z6*z7^5+ 2740*z4*z6*z7^5+
    2740*z5*z6*z7^5+ 147*z2*z7^6+ 2751*z3*z7^6+ 147*z4*z7^6+ 147*z5*z7^6+
    147*z6*z7^6+ 2604*z7^7+ 318*z2*z3^4+ 2037*z3^5+ 3588*z2*z3^3*z4+ 318*z3^4*z4+
    3588*z2*z3^3*z5+ 318*z3^4*z5- 2988*z2*z3^2*z4*z5+ 3588*z3^3*z4*z5+
    3588*z2*z3^3*z6+ 318*z3^4*z6- 2988*z2*z3^2*z4*z6+ 3588*z3^3*z4*z6-
    2988*z2*z3^2*z5*z6+ 3588*z3^3*z5*z6+ 633*z2*z3*z4*z5*z6- 2988*z3^2*z4*z5*z6+
    3906*z2*z3^3*z7+ 2355*z3^4*z7+ 600*z2*z3^2*z4*z7+ 3906*z3^3*z4*z7+
    600*z2*z3^2*z5*z7+ 3906*z3^3*z5*z7- 2355*z2*z3*z4*z5*z7+ 600*z3^2*z4*z5*z7+
    600*z2*z3^2*z6*z7+ 3906*z3^3*z6*z7- 2355*z2*z3*z4*z6*z7+ 600*z3^2*z4*z6*z7-
    2355*z2*z3*z5*z6*z7+ 600*z3^2*z5*z6*z7+ 633*z2*z4*z5*z6*z7-
    2355*z3*z4*z5*z6*z7+ 3906*z2*z3^2*z7^2+ 2355*z3^3*z7^2+ 600*z2*z3*z4*z7^2+
    3906*z3^2*z4*z7^2+ 600*z2*z3*z5*z7^2+ 3906*z3^2*z5*z7^2- 2988*z2*z4*z5*z7^2+
    600*z3*z4*z5*z7^2+ 600*z2*z3*z6*z7^2+ 3906*z3^2*z6*z7^2- 2988*z2*z4*z6*z7^2+
    600*z3*z4*z6*z7^2- 2988*z2*z5*z6*z7^2+ 600*z3*z5*z6*z7^2- 2988*z4*z5*z6*z7^2+
    3906*z2*z3*z7^3+ 2355*z3^2*z7^3+ 3588*z2*z4*z7^3+ 3906*z3*z4*z7^3+
    3588*z2*z5*z7^3+ 3906*z3*z5*z7^3+ 3588*z4*z5*z7^3+ 3588*z2*z6*z7^3+
    3906*z3*z6*z7^3+ 3588*z4*z6*z7^3+ 3588*z5*z6*z7^3+ 318*z2*z7^4+ 2355*z3*z7^4+
    318*z4*z7^4+ 318*z5*z7^4+ 318*z6*z7^4+ 2037*z7^5- 1776*z2*z3^2+ 2166*z3^3-
    2202*z2*z3*z4- 1776*z3^2*z4- 2202*z2*z3*z5- 1776*z3^2*z5- 1068*z2*z4*z5-
    2202*z3*z4*z5- 2202*z2*z3*z6- 1776*z3^2*z6- 1068*z2*z4*z6- 2202*z3*z4*z6-
    1068*z2*z5*z6- 2202*z3*z5*z6- 1068*z4*z5*z6- 3978*z2*z3*z7+ 390*z3^2*z7-
    2202*z2*z4*z7- 3978*z3*z4*z7- 2202*z2*z5*z7- 3978*z3*z5*z7- 2202*z4*z5*z7-
    2202*z2*z6*z7- 3978*z3*z6*z7- 2202*z4*z6*z7- 2202*z5*z6*z7- 1776*z2*z7^2+
    390*z3*z7^2- 1776*z4*z7^2- 1776*z5*z7^2- 1776*z6*z7^2+ 2166*z7^3+ 3538*z2-
    1169*z3+ 3538*z4+ 3538*z5+ 3538*z6- 1169*z7, 6*z2*z3*z4^13- 4*z2*z4^14-
    4*z3*z4^14+ 2*z4^15- 2*z2*z3*z4^12*z5+ 2*z2*z4^13*z5+ 2*z3*z4^13*z5-
    2*z4^14*z5- 2*z2*z3*z4^11*z5^2+ 2*z2*z4^12*z5^2+ 2*z3*z4^12*z5^2-
    2*z4^13*z5^2- 2*z2*z3*z4^10*z5^3+ 2*z2*z4^11*z5^3+ 2*z3*z4^11*z5^3-
    2*z4^12*z5^3- 2*z2*z3*z4^9*z5^4+ 2*z2*z4^10*z5^4+ 2*z3*z4^10*z5^4-
    2*z4^11*z5^4- 2*z2*z3*z4^8*z5^5+ 2*z2*z4^9*z5^5+ 2*z3*z4^9*z5^5- 2*z4^10*z5^5-
    2*z2*z3*z4^7*z5^6+ 2*z2*z4^8*z5^6+ 2*z3*z4^8*z5^6- 2*z4^9*z5^6-
    2*z2*z3*z4^6*z5^7+ 2*z2*z4^7*z5^7+ 2*z3*z4^7*z5^7- 2*z4^8*z5^7-
    2*z2*z3*z4^5*z5^8+ 2*z2*z4^6*z5^8+ 2*z3*z4^6*z5^8- 2*z4^7*z5^8-
    2*z2*z3*z4^4*z5^9+ 2*z2*z4^5*z5^9+ 2*z3*z4^5*z5^9- 2*z4^6*z5^9-
    2*z2*z3*z4^3*z5^10+ 2*z2*z4^4*z5^10+ 2*z3*z4^4*z5^10- 2*z4^5*z5^10-
    2*z2*z3*z4^2*z5^11+ 2*z2*z4^3*z5^11+ 2*z3*z4^3*z5^11- 2*z4^4*z5^11-
    2*z2*z3*z4*z5^12+ 2*z2*z4^2*z5^12+ 2*z3*z4^2*z5^12- 2*z4^3*z5^12+
    6*z2*z3*z5^13+ 2*z2*z4*z5^13+ 2*z3*z4*z5^13- 2*z4^2*z5^13- 4*z2*z5^14-
    4*z3*z5^14- 2*z4*z5^14+ 2*z5^15- 8*z2*z3*z4^12*z6+ 6*z2*z4^13*z6+
    6*z3*z4^13*z6- 4*z4^14*z6+ 2*z2*z3*z4^11*z5*z6- 2*z2*z4^12*z5*z6-
    2*z3*z4^12*z5*z6+ 2*z4^13*z5*z6+ 2*z2*z3*z4^10*z5^2*z6- 2*z2*z4^11*z5^2*z6-
    2*z3*z4^11*z5^2*z6+ 2*z4^12*z5^2*z6+ 2*z2*z3*z4^9*z5^3*z6- 2*z2*z4^10*z5^3*z6-
    2*z3*z4^10*z5^3*z6+ 2*z4^11*z5^3*z6+ 2*z2*z3*z4^8*z5^4*z6- 2*z2*z4^9*z5^4*z6-
    2*z3*z4^9*z5^4*z6+ 2*z4^10*z5^4*z6+ 2*z2*z3*z4^7*z5^5*z6- 2*z2*z4^8*z5^5*z6-
    2*z3*z4^8*z5^5*z6+ 2*z4^9*z5^5*z6+ 2*z2*z3*z4^6*z5^6*z6- 2*z2*z4^7*z5^6*z6-
    2*z3*z4^7*z5^6*z6+ 2*z4^8*z5^6*z6+ 2*z2*z3*z4^5*z5^7*z6- 2*z2*z4^6*z5^7*z6-
    2*z3*z4^6*z5^7*z6+ 2*z4^7*z5^7*z6+ 2*z2*z3*z4^4*z5^8*z6- 2*z2*z4^5*z5^8*z6-
    2*z3*z4^5*z5^8*z6+ 2*z4^6*z5^8*z6+ 2*z2*z3*z4^3*z5^9*z6- 2*z2*z4^4*z5^9*z6-
    2*z3*z4^4*z5^9*z6+ 2*z4^5*z5^9*z6+ 2*z2*z3*z4^2*z5^10*z6- 2*z2*z4^3*z5^10*z6-
    2*z3*z4^3*z5^10*z6+ 2*z4^4*z5^10*z6+ 2*z2*z3*z4*z5^11*z6- 2*z2*z4^2*z5^11*z6-
    2*z3*z4^2*z5^11*z6+ 2*z4^3*z5^11*z6- 8*z2*z3*z5^12*z6- 2*z2*z4*z5^12*z6-
    2*z3*z4*z5^12*z6+ 2*z4^2*z5^12*z6+ 6*z2*z5^13*z6+ 6*z3*z5^13*z6+
    2*z4*z5^13*z6- 4*z5^14*z6- 8*z2*z3*z4^12*z7+ 6*z2*z4^13*z7+ 6*z3*z4^13*z7-
    4*z4^14*z7+ 2*z2*z3*z4^11*z5*z7- 2*z2*z4^12*z5*z7- 2*z3*z4^12*z5*z7+
    2*z4^13*z5*z7+ 2*z2*z3*z4^10*z5^2*z7- 2*z2*z4^11*z5^2*z7- 2*z3*z4^11*z5^2*z7+
    2*z4^12*z5^2*z7+ 2*z2*z3*z4^9*z5^3*z7- 2*z2*z4^10*z5^3*z7- 2*z3*z4^10*z5^3*z7+
    2*z4^11*z5^3*z7+ 2*z2*z3*z4^8*z5^4*z7- 2*z2*z4^9*z5^4*z7- 2*z3*z4^9*z5^4*z7+
    2*z4^10*z5^4*z7+ 2*z2*z3*z4^7*z5^5*z7- 2*z2*z4^8*z5^5*z7- 2*z3*z4^8*z5^5*z7+
    2*z4^9*z5^5*z7+ 2*z2*z3*z4^6*z5^6*z7- 2*z2*z4^7*z5^6*z7- 2*z3*z4^7*z5^6*z7+
    2*z4^8*z5^6*z7+ 2*z2*z3*z4^5*z5^7*z7- 2*z2*z4^6*z5^7*z7- 2*z3*z4^6*z5^7*z7+
    2*z4^7*z5^7*z7+ 2*z2*z3*z4^4*z5^8*z7- 2*z2*z4^5*z5^8*z7- 2*z3*z4^5*z5^8*z7+
    2*z4^6*z5^8*z7+ 2*z2*z3*z4^3*z5^9*z7- 2*z2*z4^4*z5^9*z7- 2*z3*z4^4*z5^9*z7+
    2*z4^5*z5^9*z7+ 2*z2*z3*z4^2*z5^10*z7- 2*z2*z4^3*z5^10*z7- 2*z3*z4^3*z5^10*z7+
    2*z4^4*z5^10*z7+ 2*z2*z3*z4*z5^11*z7- 2*z2*z4^2*z5^11*z7- 2*z3*z4^2*z5^11*z7+
    2*z4^3*z5^11*z7- 8*z2*z3*z5^12*z7- 2*z2*z4*z5^12*z7- 2*z3*z4*z5^12*z7+
    2*z4^2*z5^12*z7+ 6*z2*z5^13*z7+ 6*z3*z5^13*z7+ 2*z4*z5^13*z7- 4*z5^14*z7+
    10*z2*z3*z4^11*z6*z7- 8*z2*z4^12*z6*z7- 8*z3*z4^12*z6*z7+ 6*z4^13*z6*z7-
    2*z2*z3*z4^10*z5*z6*z7+ 2*z2*z4^11*z5*z6*z7+ 2*z3*z4^11*z5*z6*z7-
    2*z4^12*z5*z6*z7- 2*z2*z3*z4^9*z5^2*z6*z7+ 2*z2*z4^10*z5^2*z6*z7+
    2*z3*z4^10*z5^2*z6*z7- 2*z4^11*z5^2*z6*z7- 2*z2*z3*z4^8*z5^3*z6*z7+
    2*z2*z4^9*z5^3*z6*z7+ 2*z3*z4^9*z5^3*z6*z7- 2*z4^10*z5^3*z6*z7-
    2*z2*z3*z4^7*z5^4*z6*z7+ 2*z2*z4^8*z5^4*z6*z7+ 2*z3*z4^8*z5^4*z6*z7-
    2*z4^9*z5^4*z6*z7- 2*z2*z3*z4^6*z5^5*z6*z7+ 2*z2*z4^7*z5^5*z6*z7+
    2*z3*z4^7*z5^5*z6*z7- 2*z4^8*z5^5*z6*z7- 2*z2*z3*z4^5*z5^6*z6*z7+
    2*z2*z4^6*z5^6*z6*z7+ 2*z3*z4^6*z5^6*z6*z7- 2*z4^7*z5^6*z6*z7-
    2*z2*z3*z4^4*z5^7*z6*z7+ 2*z2*z4^5*z5^7*z6*z7+ 2*z3*z4^5*z5^7*z6*z7-
    2*z4^6*z5^7*z6*z7- 2*z2*z3*z4^3*z5^8*z6*z7+ 2*z2*z4^4*z5^8*z6*z7+
    2*z3*z4^4*z5^8*z6*z7- 2*z4^5*z5^8*z6*z7- 2*z2*z3*z4^2*z5^9*z6*z7+
    2*z2*z4^3*z5^9*z6*z7+ 2*z3*z4^3*z5^9*z6*z7- 2*z4^4*z5^9*z6*z7-
    2*z2*z3*z4*z5^10*z6*z7+ 2*z2*z4^2*z5^10*z6*z7+ 2*z3*z4^2*z5^10*z6*z7-
    2*z4^3*z5^10*z6*z7+ 10*z2*z3*z5^11*z6*z7+ 2*z2*z4*z5^11*z6*z7+
    2*z3*z4*z5^11*z6*z7- 2*z4^2*z5^11*z6*z7- 8*z2*z5^12*z6*z7- 8*z3*z5^12*z6*z7-
    2*z4*z5^12*z6*z7+ 6*z5^13*z6*z7+ 10*z2*z3*z4^11- 13*z2*z4^12- 13*z3*z4^12+
    10*z4^13+ 11*z2*z3*z4^10*z5- 3*z2*z4^11*z5- 3*z3*z4^11*z5- 3*z4^12*z5+
    11*z2*z3*z4^9*z5^2- 3*z2*z4^10*z5^2- 3*z3*z4^10*z5^2- 3*z4^11*z5^2+
    11*z2*z3*z4^8*z5^3- 3*z2*z4^9*z5^3- 3*z3*z4^9*z5^3- 3*z4^10*z5^3+
    11*z2*z3*z4^7*z5^4- 3*z2*z4^8*z5^4- 3*z3*z4^8*z5^4- 3*z4^9*z5^4+
    11*z2*z3*z4^6*z5^5- 3*z2*z4^7*z5^5- 3*z3*z4^7*z5^5- 3*z4^8*z5^5+
    11*z2*z3*z4^5*z5^6- 3*z2*z4^6*z5^6- 3*z3*z4^6*z5^6- 3*z4^7*z5^6+
    11*z2*z3*z4^4*z5^7- 3*z2*z4^5*z5^7- 3*z3*z4^5*z5^7- 3*z4^6*z5^7+
    11*z2*z3*z4^3*z5^8- 3*z2*z4^4*z5^8- 3*z3*z4^4*z5^8- 3*z4^5*z5^8+
    11*z2*z3*z4^2*z5^9- 3*z2*z4^3*z5^9- 3*z3*z4^3*z5^9- 3*z4^4*z5^9+
    11*z2*z3*z4*z5^10- 3*z2*z4^2*z5^10- 3*z3*z4^2*z5^10- 3*z4^3*z5^10+
    10*z2*z3*z5^11- 3*z2*z4*z5^11- 3*z3*z4*z5^11- 3*z4^2*z5^11- 13*z2*z5^12-
    13*z3*z5^12- 3*z4*z5^12+ 10*z5^13+ z2*z3*z4^10*z6+ 10*z2*z4^11*z6+
    10*z3*z4^11*z6- 13*z4^12*z6- 21*z2*z3*z4^9*z5*z6+ 11*z2*z4^10*z5*z6+
    11*z3*z4^10*z5*z6- 3*z4^11*z5*z6- 21*z2*z3*z4^8*z5^2*z6+ 11*z2*z4^9*z5^2*z6+
    11*z3*z4^9*z5^2*z6- 3*z4^10*z5^2*z6- 21*z2*z3*z4^7*z5^3*z6+
    11*z2*z4^8*z5^3*z6+ 11*z3*z4^8*z5^3*z6- 3*z4^9*z5^3*z6- 21*z2*z3*z4^6*z5^4*z6+
    11*z2*z4^7*z5^4*z6+ 11*z3*z4^7*z5^4*z6- 3*z4^8*z5^4*z6- 21*z2*z3*z4^5*z5^5*z6+
    11*z2*z4^6*z5^5*z6+ 11*z3*z4^6*z5^5*z6- 3*z4^7*z5^5*z6- 21*z2*z3*z4^4*z5^6*z6+
    11*z2*z4^5*z5^6*z6+ 11*z3*z4^5*z5^6*z6- 3*z4^6*z5^6*z6- 21*z2*z3*z4^3*z5^7*z6+
    11*z2*z4^4*z5^7*z6+ 11*z3*z4^4*z5^7*z6- 3*z4^5*z5^7*z6- 21*z2*z3*z4^2*z5^8*z6+
    11*z2*z4^3*z5^8*z6+ 11*z3*z4^3*z5^8*z6- 3*z4^4*z5^8*z6- 21*z2*z3*z4*z5^9*z6+
    11*z2*z4^2*z5^9*z6+ 11*z3*z4^2*z5^9*z6- 3*z4^3*z5^9*z6+ z2*z3*z5^10*z6+
    11*z2*z4*z5^10*z6+ 11*z3*z4*z5^10*z6- 3*z4^2*z5^10*z6+ 10*z2*z5^11*z6+
    10*z3*z5^11*z6- 3*z4*z5^11*z6- 13*z5^12*z6+ z2*z3*z4^10*z7+ 10*z2*z4^11*z7+
    10*z3*z4^11*z7- 13*z4^12*z7- 21*z2*z3*z4^9*z5*z7+ 11*z2*z4^10*z5*z7+
    11*z3*z4^10*z5*z7- 3*z4^11*z5*z7- 21*z2*z3*z4^8*z5^2*z7+ 11*z2*z4^9*z5^2*z7+
    11*z3*z4^9*z5^2*z7- 3*z4^10*z5^2*z7- 21*z2*z3*z4^7*z5^3*z7+
    11*z2*z4^8*z5^3*z7+ 11*z3*z4^8*z5^3*z7- 3*z4^9*z5^3*z7- 21*z2*z3*z4^6*z5^4*z7+
    11*z2*z4^7*z5^4*z7+ 11*z3*z4^7*z5^4*z7- 3*z4^8*z5^4*z7- 21*z2*z3*z4^5*z5^5*z7+
    11*z2*z4^6*z5^5*z7+ 11*z3*z4^6*z5^5*z7- 3*z4^7*z5^5*z7- 21*z2*z3*z4^4*z5^6*z7+
    11*z2*z4^5*z5^6*z7+ 11*z3*z4^5*z5^6*z7- 3*z4^6*z5^6*z7- 21*z2*z3*z4^3*z5^7*z7+
    11*z2*z4^4*z5^7*z7+ 11*z3*z4^4*z5^7*z7- 3*z4^5*z5^7*z7- 21*z2*z3*z4^2*z5^8*z7+
    11*z2*z4^3*z5^8*z7+ 11*z3*z4^3*z5^8*z7- 3*z4^4*z5^8*z7- 21*z2*z3*z4*z5^9*z7+
    11*z2*z4^2*z5^9*z7+ 11*z3*z4^2*z5^9*z7- 3*z4^3*z5^9*z7+ z2*z3*z5^10*z7+
    11*z2*z4*z5^10*z7+ 11*z3*z4*z5^10*z7- 3*z4^2*z5^10*z7+ 10*z2*z5^11*z7+
    10*z3*z5^11*z7- 3*z4*z5^11*z7- 13*z5^12*z7- 22*z2*z3*z4^9*z6*z7+
    z2*z4^10*z6*z7+ z3*z4^10*z6*z7+ 10*z4^11*z6*z7+ 33*z2*z3*z4^8*z5*z6*z7-
    21*z2*z4^9*z5*z6*z7- 21*z3*z4^9*z5*z6*z7+ 11*z4^10*z5*z6*z7+
    33*z2*z3*z4^7*z5^2*z6*z7- 21*z2*z4^8*z5^2*z6*z7- 21*z3*z4^8*z5^2*z6*z7+
    11*z4^9*z5^2*z6*z7+ 33*z2*z3*z4^6*z5^3*z6*z7- 21*z2*z4^7*z5^3*z6*z7-
    21*z3*z4^7*z5^3*z6*z7+ 11*z4^8*z5^3*z6*z7+ 33*z2*z3*z4^5*z5^4*z6*z7-
    21*z2*z4^6*z5^4*z6*z7- 21*z3*z4^6*z5^4*z6*z7+ 11*z4^7*z5^4*z6*z7+
    33*z2*z3*z4^4*z5^5*z6*z7- 21*z2*z4^5*z5^5*z6*z7- 21*z3*z4^5*z5^5*z6*z7+
    11*z4^6*z5^5*z6*z7+ 33*z2*z3*z4^3*z5^6*z6*z7- 21*z2*z4^4*z5^6*z6*z7-
    21*z3*z4^4*z5^6*z6*z7+ 11*z4^5*z5^6*z6*z7+ 33*z2*z3*z4^2*z5^7*z6*z7-
    21*z2*z4^3*z5^7*z6*z7- 21*z3*z4^3*z5^7*z6*z7+ 11*z4^4*z5^7*z6*z7+
    33*z2*z3*z4*z5^8*z6*z7- 21*z2*z4^2*z5^8*z6*z7- 21*z3*z4^2*z5^8*z6*z7+
    11*z4^3*z5^8*z6*z7- 22*z2*z3*z5^9*z6*z7- 21*z2*z4*z5^9*z6*z7-
    21*z3*z4*z5^9*z6*z7+ 11*z4^2*z5^9*z6*z7+ z2*z5^10*z6*z7+ z3*z5^10*z6*z7+
    11*z4*z5^10*z6*z7+ 10*z5^11*z6*z7+ 1121*z2*z3*z4^9- 12*z2*z4^10- 12*z3*z4^10-
    1107*z4^11- 1110*z2*z3*z4^8*z5+ 1109*z2*z4^9*z5+ 1109*z3*z4^9*z5-
    1119*z4^10*z5- 1110*z2*z3*z4^7*z5^2+ 1109*z2*z4^8*z5^2+ 1109*z3*z4^8*z5^2-
    1119*z4^9*z5^2- 1110*z2*z3*z4^6*z5^3+ 1109*z2*z4^7*z5^3+ 1109*z3*z4^7*z5^3-
    1119*z4^8*z5^3- 1110*z2*z3*z4^5*z5^4+ 1109*z2*z4^6*z5^4+ 1109*z3*z4^6*z5^4-
    1119*z4^7*z5^4- 1110*z2*z3*z4^4*z5^5+ 1109*z2*z4^5*z5^5+ 1109*z3*z4^5*z5^5-
    1119*z4^6*z5^5- 1110*z2*z3*z4^3*z5^6+ 1109*z2*z4^4*z5^6+ 1109*z3*z4^4*z5^6-
    1119*z4^5*z5^6- 1110*z2*z3*z4^2*z5^7+ 1109*z2*z4^3*z5^7+ 1109*z3*z4^3*z5^7-
    1119*z4^4*z5^7- 1110*z2*z3*z4*z5^8+ 1109*z2*z4^2*z5^8+ 1109*z3*z4^2*z5^8-
    1119*z4^3*z5^8+ 1121*z2*z3*z5^9+ 1109*z2*z4*z5^9+ 1109*z3*z4*z5^9-
    1119*z4^2*z5^9- 12*z2*z5^10- 12*z3*z5^10- 1119*z4*z5^10- 1107*z5^11-
    2231*z2*z3*z4^8*z6+ 1121*z2*z4^9*z6+ 1121*z3*z4^9*z6- 12*z4^10*z6+
    1132*z2*z3*z4^7*z5*z6- 1110*z2*z4^8*z5*z6- 1110*z3*z4^8*z5*z6+
    1109*z4^9*z5*z6+ 1132*z2*z3*z4^6*z5^2*z6- 1110*z2*z4^7*z5^2*z6-
    1110*z3*z4^7*z5^2*z6+ 1109*z4^8*z5^2*z6+ 1132*z2*z3*z4^5*z5^3*z6-
    1110*z2*z4^6*z5^3*z6- 1110*z3*z4^6*z5^3*z6+ 1109*z4^7*z5^3*z6+
    1132*z2*z3*z4^4*z5^4*z6- 1110*z2*z4^5*z5^4*z6- 1110*z3*z4^5*z5^4*z6+
    1109*z4^6*z5^4*z6+ 1132*z2*z3*z4^3*z5^5*z6- 1110*z2*z4^4*z5^5*z6-
    1110*z3*z4^4*z5^5*z6+ 1109*z4^5*z5^5*z6+ 1132*z2*z3*z4^2*z5^6*z6-
    1110*z2*z4^3*z5^6*z6- 1110*z3*z4^3*z5^6*z6+ 1109*z4^4*z5^6*z6+
    1132*z2*z3*z4*z5^7*z6- 1110*z2*z4^2*z5^7*z6- 1110*z3*z4^2*z5^7*z6+
    1109*z4^3*z5^7*z6- 2231*z2*z3*z5^8*z6- 1110*z2*z4*z5^8*z6- 1110*z3*z4*z5^8*z6+
    1109*z4^2*z5^8*z6+ 1121*z2*z5^9*z6+ 1121*z3*z5^9*z6+ 1109*z4*z5^9*z6-
    12*z5^10*z6- 2231*z2*z3*z4^8*z7+ 1121*z2*z4^9*z7+ 1121*z3*z4^9*z7-
    12*z4^10*z7+ 1132*z2*z3*z4^7*z5*z7- 1110*z2*z4^8*z5*z7- 1110*z3*z4^8*z5*z7+
    1109*z4^9*z5*z7+ 1132*z2*z3*z4^6*z5^2*z7- 1110*z2*z4^7*z5^2*z7-
    1110*z3*z4^7*z5^2*z7+ 1109*z4^8*z5^2*z7+ 1132*z2*z3*z4^5*z5^3*z7-
    1110*z2*z4^6*z5^3*z7- 1110*z3*z4^6*z5^3*z7+ 1109*z4^7*z5^3*z7+
    1132*z2*z3*z4^4*z5^4*z7- 1110*z2*z4^5*z5^4*z7- 1110*z3*z4^5*z5^4*z7+
    1109*z4^6*z5^4*z7+ 1132*z2*z3*z4^3*z5^5*z7- 1110*z2*z4^4*z5^5*z7-
    1110*z3*z4^4*z5^5*z7+ 1109*z4^5*z5^5*z7+ 1132*z2*z3*z4^2*z5^6*z7-
    1110*z2*z4^3*z5^6*z7- 1110*z3*z4^3*z5^6*z7+ 1109*z4^4*z5^6*z7+
    1132*z2*z3*z4*z5^7*z7- 1110*z2*z4^2*z5^7*z7- 1110*z3*z4^2*z5^7*z7+
    1109*z4^3*z5^7*z7- 2231*z2*z3*z5^8*z7- 1110*z2*z4*z5^8*z7- 1110*z3*z4*z5^8*z7+
    1109*z4^2*z5^8*z7+ 1121*z2*z5^9*z7+ 1121*z3*z5^9*z7+ 1109*z4*z5^9*z7-
    12*z5^10*z7+ 3363*z2*z3*z4^7*z6*z7- 2231*z2*z4^8*z6*z7- 2231*z3*z4^8*z6*z7+
    1121*z4^9*z6*z7- 1187*z2*z3*z4^6*z5*z6*z7+ 1132*z2*z4^7*z5*z6*z7+
    1132*z3*z4^7*z5*z6*z7- 1110*z4^8*z5*z6*z7- 1187*z2*z3*z4^5*z5^2*z6*z7+
    1132*z2*z4^6*z5^2*z6*z7+ 1132*z3*z4^6*z5^2*z6*z7- 1110*z4^7*z5^2*z6*z7-
    1187*z2*z3*z4^4*z5^3*z6*z7+ 1132*z2*z4^5*z5^3*z6*z7+ 1132*z3*z4^5*z5^3*z6*z7-
    1110*z4^6*z5^3*z6*z7- 1187*z2*z3*z4^3*z5^4*z6*z7+ 1132*z2*z4^4*z5^4*z6*z7+
    1132*z3*z4^4*z5^4*z6*z7- 1110*z4^5*z5^4*z6*z7- 1187*z2*z3*z4^2*z5^5*z6*z7+
    1132*z2*z4^3*z5^5*z6*z7+ 1132*z3*z4^3*z5^5*z6*z7- 1110*z4^4*z5^5*z6*z7-
    1187*z2*z3*z4*z5^6*z6*z7+ 1132*z2*z4^2*z5^6*z6*z7+ 1132*z3*z4^2*z5^6*z6*z7-
    1110*z4^3*z5^6*z6*z7+ 3363*z2*z3*z5^7*z6*z7+ 1132*z2*z4*z5^7*z6*z7+
    1132*z3*z4*z5^7*z6*z7- 1110*z4^2*z5^7*z6*z7- 2231*z2*z5^8*z6*z7-
    2231*z3*z5^8*z6*z7- 1110*z4*z5^8*z6*z7+ 1121*z5^9*z6*z7+ 3363*z2*z3*z4^7-
    3374*z2*z4^8- 3374*z3*z4^8+ 2264*z4^9+ 2242*z2*z3*z4^6*z5- 11*z2*z4^7*z5-
    11*z3*z4^7*z5- 1110*z4^8*z5+ 2242*z2*z3*z4^5*z5^2- 11*z2*z4^6*z5^2-
    11*z3*z4^6*z5^2- 1110*z4^7*z5^2+ 2242*z2*z3*z4^4*z5^3- 11*z2*z4^5*z5^3-
    11*z3*z4^5*z5^3- 1110*z4^6*z5^3+ 2242*z2*z3*z4^3*z5^4- 11*z2*z4^4*z5^4-
    11*z3*z4^4*z5^4- 1110*z4^5*z5^4+ 2242*z2*z3*z4^2*z5^5- 11*z2*z4^3*z5^5-
    11*z3*z4^3*z5^5- 1110*z4^4*z5^5+ 2242*z2*z3*z4*z5^6- 11*z2*z4^2*z5^6-
    11*z3*z4^2*z5^6- 1110*z4^3*z5^6+ 3363*z2*z3*z5^7- 11*z2*z4*z5^7-
    11*z3*z4*z5^7- 1110*z4^2*z5^7- 3374*z2*z5^8- 3374*z3*z5^8- 1110*z4*z5^8+
    2264*z5^9- 1121*z2*z3*z4^6*z6+ 3363*z2*z4^7*z6+ 3363*z3*z4^7*z6- 3374*z4^8*z6+
    3396*z2*z3*z4^5*z5*z6+ 2242*z2*z4^6*z5*z6+ 2242*z3*z4^6*z5*z6- 11*z4^7*z5*z6+
    3396*z2*z3*z4^4*z5^2*z6+ 2242*z2*z4^5*z5^2*z6+ 2242*z3*z4^5*z5^2*z6-
    11*z4^6*z5^2*z6+ 3396*z2*z3*z4^3*z5^3*z6+ 2242*z2*z4^4*z5^3*z6+
    2242*z3*z4^4*z5^3*z6- 11*z4^5*z5^3*z6+ 3396*z2*z3*z4^2*z5^4*z6+
    2242*z2*z4^3*z5^4*z6+ 2242*z3*z4^3*z5^4*z6- 11*z4^4*z5^4*z6+
    3396*z2*z3*z4*z5^5*z6+ 2242*z2*z4^2*z5^5*z6+ 2242*z3*z4^2*z5^5*z6-
    11*z4^3*z5^5*z6- 1121*z2*z3*z5^6*z6+ 2242*z2*z4*z5^6*z6+ 2242*z3*z4*z5^6*z6-
    11*z4^2*z5^6*z6+ 3363*z2*z5^7*z6+ 3363*z3*z5^7*z6- 11*z4*z5^7*z6-
    3374*z5^8*z6- 1121*z2*z3*z4^6*z7+ 3363*z2*z4^7*z7+ 3363*z3*z4^7*z7-
    3374*z4^8*z7+ 3396*z2*z3*z4^5*z5*z7+ 2242*z2*z4^6*z5*z7+ 2242*z3*z4^6*z5*z7-
    11*z4^7*z5*z7+ 3396*z2*z3*z4^4*z5^2*z7+ 2242*z2*z4^5*z5^2*z7+
    2242*z3*z4^5*z5^2*z7- 11*z4^6*z5^2*z7+ 3396*z2*z3*z4^3*z5^3*z7+
    2242*z2*z4^4*z5^3*z7+ 2242*z3*z4^4*z5^3*z7- 11*z4^5*z5^3*z7+
    3396*z2*z3*z4^2*z5^4*z7+ 2242*z2*z4^3*z5^4*z7+ 2242*z3*z4^3*z5^4*z7-
    11*z4^4*z5^4*z7+ 3396*z2*z3*z4*z5^5*z7+ 2242*z2*z4^2*z5^5*z7+
    2242*z3*z4^2*z5^5*z7- 11*z4^3*z5^5*z7- 1121*z2*z3*z5^6*z7+ 2242*z2*z4*z5^6*z7+
    2242*z3*z4*z5^6*z7- 11*z4^2*z5^6*z7+ 3363*z2*z5^7*z7+ 3363*z3*z5^7*z7-
    11*z4*z5^7*z7- 3374*z5^8*z7- 4484*z2*z3*z4^5*z6*z7- 1121*z2*z4^6*z6*z7-
    1121*z3*z4^6*z6*z7+ 3363*z4^7*z6*z7+ 1154*z2*z3*z4^4*z5*z6*z7+
    3396*z2*z4^5*z5*z6*z7+ 3396*z3*z4^5*z5*z6*z7+ 2242*z4^6*z5*z6*z7+
    1154*z2*z3*z4^3*z5^2*z6*z7+ 3396*z2*z4^4*z5^2*z6*z7+ 3396*z3*z4^4*z5^2*z6*z7+
    2242*z4^5*z5^2*z6*z7+ 1154*z2*z3*z4^2*z5^3*z6*z7+ 3396*z2*z4^3*z5^3*z6*z7+
    3396*z3*z4^3*z5^3*z6*z7+ 2242*z4^4*z5^3*z6*z7+ 1154*z2*z3*z4*z5^4*z6*z7+
    3396*z2*z4^2*z5^4*z6*z7+ 3396*z3*z4^2*z5^4*z6*z7+ 2242*z4^3*z5^4*z6*z7-
    4484*z2*z3*z5^5*z6*z7+ 3396*z2*z4*z5^5*z6*z7+ 3396*z3*z4*z5^5*z6*z7+
    2242*z4^2*z5^5*z6*z7- 1121*z2*z5^6*z6*z7- 1121*z3*z5^6*z6*z7+
    2242*z4*z5^6*z6*z7+ 3363*z5^7*z6*z7+ 2740*z2*z3*z4^5+ 147*z2*z4^6+
    147*z3*z4^6+ 2604*z4^7- 1766*z2*z3*z4^4*z5+ 2887*z2*z4^5*z5+ 2887*z3*z4^5*z5+
    2751*z4^6*z5- 1766*z2*z3*z4^3*z5^2+ 2887*z2*z4^4*z5^2+ 2887*z3*z4^4*z5^2+
    2751*z4^5*z5^2- 1766*z2*z3*z4^2*z5^3+ 2887*z2*z4^3*z5^3+ 2887*z3*z4^3*z5^3+
    2751*z4^4*z5^3- 1766*z2*z3*z4*z5^4+ 2887*z2*z4^2*z5^4+ 2887*z3*z4^2*z5^4+
    2751*z4^3*z5^4+ 2740*z2*z3*z5^5+ 2887*z2*z4*z5^5+ 2887*z3*z4*z5^5+
    2751*z4^2*z5^5+ 147*z2*z5^6+ 147*z3*z5^6+ 2751*z4*z5^6+ 2604*z5^7+
    4495*z2*z3*z4^4*z6+ 2740*z2*z4^5*z6+ 2740*z3*z4^5*z6+ 147*z4^6*z6-
    2751*z2*z3*z4^3*z5*z6- 1766*z2*z4^4*z5*z6- 1766*z3*z4^4*z5*z6+
    2887*z4^5*z5*z6- 2751*z2*z3*z4^2*z5^2*z6- 1766*z2*z4^3*z5^2*z6-
    1766*z3*z4^3*z5^2*z6+ 2887*z4^4*z5^2*z6- 2751*z2*z3*z4*z5^3*z6-
    1766*z2*z4^2*z5^3*z6- 1766*z3*z4^2*z5^3*z6+ 2887*z4^3*z5^3*z6+
    4495*z2*z3*z5^4*z6- 1766*z2*z4*z5^4*z6- 1766*z3*z4*z5^4*z6+ 2887*z4^2*z5^4*z6+
    2740*z2*z5^5*z6+ 2740*z3*z5^5*z6+ 2887*z4*z5^5*z6+ 147*z5^6*z6+
    4495*z2*z3*z4^4*z7+ 2740*z2*z4^5*z7+ 2740*z3*z4^5*z7+ 147*z4^6*z7-
    2751*z2*z3*z4^3*z5*z7- 1766*z2*z4^4*z5*z7- 1766*z3*z4^4*z5*z7+
    2887*z4^5*z5*z7- 2751*z2*z3*z4^2*z5^2*z7- 1766*z2*z4^3*z5^2*z7-
    1766*z3*z4^3*z5^2*z7+ 2887*z4^4*z5^2*z7- 2751*z2*z3*z4*z5^3*z7-
    1766*z2*z4^2*z5^3*z7- 1766*z3*z4^2*z5^3*z7+ 2887*z4^3*z5^3*z7+
    4495*z2*z3*z5^4*z7- 1766*z2*z4*z5^4*z7- 1766*z3*z4*z5^4*z7+ 2887*z4^2*z5^4*z7+
    2740*z2*z5^5*z7+ 2740*z3*z5^5*z7+ 2887*z4*z5^5*z7+ 147*z5^6*z7+
    1755*z2*z3*z4^3*z6*z7+ 4495*z2*z4^4*z6*z7+ 4495*z3*z4^4*z6*z7+
    2740*z4^5*z6*z7- 2887*z2*z3*z4^2*z5*z6*z7- 2751*z2*z4^3*z5*z6*z7-
    2751*z3*z4^3*z5*z6*z7- 1766*z4^4*z5*z6*z7- 2887*z2*z3*z4*z5^2*z6*z7-
    2751*z2*z4^2*z5^2*z6*z7- 2751*z3*z4^2*z5^2*z6*z7- 1766*z4^3*z5^2*z6*z7+
    1755*z2*z3*z5^3*z6*z7- 2751*z2*z4*z5^3*z6*z7- 2751*z3*z4*z5^3*z6*z7-
    1766*z4^2*z5^3*z6*z7+ 4495*z2*z5^4*z6*z7+ 4495*z3*z5^4*z6*z7-
    1766*z4*z5^4*z6*z7+ 2740*z5^5*z6*z7+ 3588*z2*z3*z4^3+ 318*z2*z4^4+
    318*z3*z4^4+ 2037*z4^5+ 600*z2*z3*z4^2*z5+ 3906*z2*z4^3*z5+ 3906*z3*z4^3*z5+
    2355*z4^4*z5+ 600*z2*z3*z4*z5^2+ 3906*z2*z4^2*z5^2+ 3906*z3*z4^2*z5^2+
    2355*z4^3*z5^2+ 3588*z2*z3*z5^3+ 3906*z2*z4*z5^3+ 3906*z3*z4*z5^3+
    2355*z4^2*z5^3+ 318*z2*z5^4+ 318*z3*z5^4+ 2355*z4*z5^4+ 2037*z5^5-
    2988*z2*z3*z4^2*z6+ 3588*z2*z4^3*z6+ 3588*z3*z4^3*z6+ 318*z4^4*z6-
    2355*z2*z3*z4*z5*z6+ 600*z2*z4^2*z5*z6+ 600*z3*z4^2*z5*z6+ 3906*z4^3*z5*z6-
    2988*z2*z3*z5^2*z6+ 600*z2*z4*z5^2*z6+ 600*z3*z4*z5^2*z6+ 3906*z4^2*z5^2*z6+
    3588*z2*z5^3*z6+ 3588*z3*z5^3*z6+ 3906*z4*z5^3*z6+ 318*z5^4*z6-
    2988*z2*z3*z4^2*z7+ 3588*z2*z4^3*z7+ 3588*z3*z4^3*z7+ 318*z4^4*z7-
    2355*z2*z3*z4*z5*z7+ 600*z2*z4^2*z5*z7+ 600*z3*z4^2*z5*z7+ 3906*z4^3*z5*z7-
    2988*z2*z3*z5^2*z7+ 600*z2*z4*z5^2*z7+ 600*z3*z4*z5^2*z7+ 3906*z4^2*z5^2*z7+
    3588*z2*z5^3*z7+ 3588*z3*z5^3*z7+ 3906*z4*z5^3*z7+ 318*z5^4*z7+
    633*z2*z3*z4*z6*z7- 2988*z2*z4^2*z6*z7- 2988*z3*z4^2*z6*z7+ 3588*z4^3*z6*z7+
    633*z2*z3*z5*z6*z7- 2355*z2*z4*z5*z6*z7- 2355*z3*z4*z5*z6*z7+
    600*z4^2*z5*z6*z7- 2988*z2*z5^2*z6*z7- 2988*z3*z5^2*z6*z7+ 600*z4*z5^2*z6*z7+
    3588*z5^3*z6*z7- 2202*z2*z3*z4- 1776*z2*z4^2- 1776*z3*z4^2+ 2166*z4^3-
    2202*z2*z3*z5- 3978*z2*z4*z5- 3978*z3*z4*z5+ 390*z4^2*z5- 1776*z2*z5^2-
    1776*z3*z5^2+ 390*z4*z5^2+ 2166*z5^3- 1068*z2*z3*z6- 2202*z2*z4*z6-
    2202*z3*z4*z6- 1776*z4^2*z6- 2202*z2*z5*z6- 2202*z3*z5*z6- 3978*z4*z5*z6-
    1776*z5^2*z6- 1068*z2*z3*z7- 2202*z2*z4*z7- 2202*z3*z4*z7- 1776*z4^2*z7-
    2202*z2*z5*z7- 2202*z3*z5*z7- 3978*z4*z5*z7- 1776*z5^2*z7- 1068*z2*z6*z7-
    1068*z3*z6*z7- 2202*z4*z6*z7- 2202*z5*z6*z7+ 3538*z2+ 3538*z3- 1169*z4-
    1169*z5+ 3538*z6+ 3538*z7, 6*z2*z3*z4^13- 4*z2*z4^14- 4*z3*z4^14+ 2*z4^15-
    8*z2*z3*z4^12*z5+ 6*z2*z4^13*z5+ 6*z3*z4^13*z5- 4*z4^14*z5- 2*z2*z3*z4^12*z6+
    2*z2*z4^13*z6+ 2*z3*z4^13*z6- 2*z4^14*z6+ 2*z2*z3*z4^11*z5*z6-
    2*z2*z4^12*z5*z6- 2*z3*z4^12*z5*z6+ 2*z4^13*z5*z6- 2*z2*z3*z4^11*z6^2+
    2*z2*z4^12*z6^2+ 2*z3*z4^12*z6^2- 2*z4^13*z6^2+ 2*z2*z3*z4^10*z5*z6^2-
    2*z2*z4^11*z5*z6^2- 2*z3*z4^11*z5*z6^2+ 2*z4^12*z5*z6^2- 2*z2*z3*z4^10*z6^3+
    2*z2*z4^11*z6^3+ 2*z3*z4^11*z6^3- 2*z4^12*z6^3+ 2*z2*z3*z4^9*z5*z6^3-
    2*z2*z4^10*z5*z6^3- 2*z3*z4^10*z5*z6^3+ 2*z4^11*z5*z6^3- 2*z2*z3*z4^9*z6^4+
    2*z2*z4^10*z6^4+ 2*z3*z4^10*z6^4- 2*z4^11*z6^4+ 2*z2*z3*z4^8*z5*z6^4-
    2*z2*z4^9*z5*z6^4- 2*z3*z4^9*z5*z6^4+ 2*z4^10*z5*z6^4- 2*z2*z3*z4^8*z6^5+
    2*z2*z4^9*z6^5+ 2*z3*z4^9*z6^5- 2*z4^10*z6^5+ 2*z2*z3*z4^7*z5*z6^5-
    2*z2*z4^8*z5*z6^5- 2*z3*z4^8*z5*z6^5+ 2*z4^9*z5*z6^5- 2*z2*z3*z4^7*z6^6+
    2*z2*z4^8*z6^6+ 2*z3*z4^8*z6^6- 2*z4^9*z6^6+ 2*z2*z3*z4^6*z5*z6^6-
    2*z2*z4^7*z5*z6^6- 2*z3*z4^7*z5*z6^6+ 2*z4^8*z5*z6^6- 2*z2*z3*z4^6*z6^7+
    2*z2*z4^7*z6^7+ 2*z3*z4^7*z6^7- 2*z4^8*z6^7+ 2*z2*z3*z4^5*z5*z6^7-
    2*z2*z4^6*z5*z6^7- 2*z3*z4^6*z5*z6^7+ 2*z4^7*z5*z6^7- 2*z2*z3*z4^5*z6^8+
    2*z2*z4^6*z6^8+ 2*z3*z4^6*z6^8- 2*z4^7*z6^8+ 2*z2*z3*z4^4*z5*z6^8-
    2*z2*z4^5*z5*z6^8- 2*z3*z4^5*z5*z6^8+ 2*z4^6*z5*z6^8- 2*z2*z3*z4^4*z6^9+
    2*z2*z4^5*z6^9+ 2*z3*z4^5*z6^9- 2*z4^6*z6^9+ 2*z2*z3*z4^3*z5*z6^9-
    2*z2*z4^4*z5*z6^9- 2*z3*z4^4*z5*z6^9+ 2*z4^5*z5*z6^9- 2*z2*z3*z4^3*z6^10+
    2*z2*z4^4*z6^10+ 2*z3*z4^4*z6^10- 2*z4^5*z6^10+ 2*z2*z3*z4^2*z5*z6^10-
    2*z2*z4^3*z5*z6^10- 2*z3*z4^3*z5*z6^10+ 2*z4^4*z5*z6^10- 2*z2*z3*z4^2*z6^11+
    2*z2*z4^3*z6^11+ 2*z3*z4^3*z6^11- 2*z4^4*z6^11+ 2*z2*z3*z4*z5*z6^11-
    2*z2*z4^2*z5*z6^11- 2*z3*z4^2*z5*z6^11+ 2*z4^3*z5*z6^11- 2*z2*z3*z4*z6^12+
    2*z2*z4^2*z6^12+ 2*z3*z4^2*z6^12- 2*z4^3*z6^12- 8*z2*z3*z5*z6^12-
    2*z2*z4*z5*z6^12- 2*z3*z4*z5*z6^12+ 2*z4^2*z5*z6^12+ 6*z2*z3*z6^13+
    2*z2*z4*z6^13+ 2*z3*z4*z6^13- 2*z4^2*z6^13+ 6*z2*z5*z6^13+ 6*z3*z5*z6^13+
    2*z4*z5*z6^13- 4*z2*z6^14- 4*z3*z6^14- 2*z4*z6^14- 4*z5*z6^14+ 2*z6^15-
    8*z2*z3*z4^12*z7+ 6*z2*z4^13*z7+ 6*z3*z4^13*z7- 4*z4^14*z7+
    10*z2*z3*z4^11*z5*z7- 8*z2*z4^12*z5*z7- 8*z3*z4^12*z5*z7+ 6*z4^13*z5*z7+
    2*z2*z3*z4^11*z6*z7- 2*z2*z4^12*z6*z7- 2*z3*z4^12*z6*z7+ 2*z4^13*z6*z7-
    2*z2*z3*z4^10*z5*z6*z7+ 2*z2*z4^11*z5*z6*z7+ 2*z3*z4^11*z5*z6*z7-
    2*z4^12*z5*z6*z7+ 2*z2*z3*z4^10*z6^2*z7- 2*z2*z4^11*z6^2*z7-
    2*z3*z4^11*z6^2*z7+ 2*z4^12*z6^2*z7- 2*z2*z3*z4^9*z5*z6^2*z7+
    2*z2*z4^10*z5*z6^2*z7+ 2*z3*z4^10*z5*z6^2*z7- 2*z4^11*z5*z6^2*z7+
    2*z2*z3*z4^9*z6^3*z7- 2*z2*z4^10*z6^3*z7- 2*z3*z4^10*z6^3*z7+ 2*z4^11*z6^3*z7-
    2*z2*z3*z4^8*z5*z6^3*z7+ 2*z2*z4^9*z5*z6^3*z7+ 2*z3*z4^9*z5*z6^3*z7-
    2*z4^10*z5*z6^3*z7+ 2*z2*z3*z4^8*z6^4*z7- 2*z2*z4^9*z6^4*z7-
    2*z3*z4^9*z6^4*z7+ 2*z4^10*z6^4*z7- 2*z2*z3*z4^7*z5*z6^4*z7+
    2*z2*z4^8*z5*z6^4*z7+ 2*z3*z4^8*z5*z6^4*z7- 2*z4^9*z5*z6^4*z7+
    2*z2*z3*z4^7*z6^5*z7- 2*z2*z4^8*z6^5*z7- 2*z3*z4^8*z6^5*z7+ 2*z4^9*z6^5*z7-
    2*z2*z3*z4^6*z5*z6^5*z7+ 2*z2*z4^7*z5*z6^5*z7+ 2*z3*z4^7*z5*z6^5*z7-
    2*z4^8*z5*z6^5*z7+ 2*z2*z3*z4^6*z6^6*z7- 2*z2*z4^7*z6^6*z7- 2*z3*z4^7*z6^6*z7+
    2*z4^8*z6^6*z7- 2*z2*z3*z4^5*z5*z6^6*z7+ 2*z2*z4^6*z5*z6^6*z7+
    2*z3*z4^6*z5*z6^6*z7- 2*z4^7*z5*z6^6*z7+ 2*z2*z3*z4^5*z6^7*z7-
    2*z2*z4^6*z6^7*z7- 2*z3*z4^6*z6^7*z7+ 2*z4^7*z6^7*z7- 2*z2*z3*z4^4*z5*z6^7*z7+
    2*z2*z4^5*z5*z6^7*z7+ 2*z3*z4^5*z5*z6^7*z7- 2*z4^6*z5*z6^7*z7+
    2*z2*z3*z4^4*z6^8*z7- 2*z2*z4^5*z6^8*z7- 2*z3*z4^5*z6^8*z7+ 2*z4^6*z6^8*z7-
    2*z2*z3*z4^3*z5*z6^8*z7+ 2*z2*z4^4*z5*z6^8*z7+ 2*z3*z4^4*z5*z6^8*z7-
    2*z4^5*z5*z6^8*z7+ 2*z2*z3*z4^3*z6^9*z7- 2*z2*z4^4*z6^9*z7- 2*z3*z4^4*z6^9*z7+
    2*z4^5*z6^9*z7- 2*z2*z3*z4^2*z5*z6^9*z7+ 2*z2*z4^3*z5*z6^9*z7+
    2*z3*z4^3*z5*z6^9*z7- 2*z4^4*z5*z6^9*z7+ 2*z2*z3*z4^2*z6^10*z7-
    2*z2*z4^3*z6^10*z7- 2*z3*z4^3*z6^10*z7+ 2*z4^4*z6^10*z7-
    2*z2*z3*z4*z5*z6^10*z7+ 2*z2*z4^2*z5*z6^10*z7+ 2*z3*z4^2*z5*z6^10*z7-
    2*z4^3*z5*z6^10*z7+ 2*z2*z3*z4*z6^11*z7- 2*z2*z4^2*z6^11*z7-
    2*z3*z4^2*z6^11*z7+ 2*z4^3*z6^11*z7+ 10*z2*z3*z5*z6^11*z7+
    2*z2*z4*z5*z6^11*z7+ 2*z3*z4*z5*z6^11*z7- 2*z4^2*z5*z6^11*z7-
    8*z2*z3*z6^12*z7- 2*z2*z4*z6^12*z7- 2*z3*z4*z6^12*z7+ 2*z4^2*z6^12*z7-
    8*z2*z5*z6^12*z7- 8*z3*z5*z6^12*z7- 2*z4*z5*z6^12*z7+ 6*z2*z6^13*z7+
    6*z3*z6^13*z7+ 2*z4*z6^13*z7+ 6*z5*z6^13*z7- 4*z6^14*z7+ 10*z2*z3*z4^11-
    13*z2*z4^12- 13*z3*z4^12+ 10*z4^13+ z2*z3*z4^10*z5+ 10*z2*z4^11*z5+
    10*z3*z4^11*z5- 13*z4^12*z5+ 11*z2*z3*z4^10*z6- 3*z2*z4^11*z6- 3*z3*z4^11*z6-
    3*z4^12*z6- 21*z2*z3*z4^9*z5*z6+ 11*z2*z4^10*z5*z6+ 11*z3*z4^10*z5*z6-
    3*z4^11*z5*z6+ 11*z2*z3*z4^9*z6^2- 3*z2*z4^10*z6^2- 3*z3*z4^10*z6^2-
    3*z4^11*z6^2- 21*z2*z3*z4^8*z5*z6^2+ 11*z2*z4^9*z5*z6^2+ 11*z3*z4^9*z5*z6^2-
    3*z4^10*z5*z6^2+ 11*z2*z3*z4^8*z6^3- 3*z2*z4^9*z6^3- 3*z3*z4^9*z6^3-
    3*z4^10*z6^3- 21*z2*z3*z4^7*z5*z6^3+ 11*z2*z4^8*z5*z6^3+ 11*z3*z4^8*z5*z6^3-
    3*z4^9*z5*z6^3+ 11*z2*z3*z4^7*z6^4- 3*z2*z4^8*z6^4- 3*z3*z4^8*z6^4-
    3*z4^9*z6^4- 21*z2*z3*z4^6*z5*z6^4+ 11*z2*z4^7*z5*z6^4+ 11*z3*z4^7*z5*z6^4-
    3*z4^8*z5*z6^4+ 11*z2*z3*z4^6*z6^5- 3*z2*z4^7*z6^5- 3*z3*z4^7*z6^5-
    3*z4^8*z6^5- 21*z2*z3*z4^5*z5*z6^5+ 11*z2*z4^6*z5*z6^5+ 11*z3*z4^6*z5*z6^5-
    3*z4^7*z5*z6^5+ 11*z2*z3*z4^5*z6^6- 3*z2*z4^6*z6^6- 3*z3*z4^6*z6^6-
    3*z4^7*z6^6- 21*z2*z3*z4^4*z5*z6^6+ 11*z2*z4^5*z5*z6^6+ 11*z3*z4^5*z5*z6^6-
    3*z4^6*z5*z6^6+ 11*z2*z3*z4^4*z6^7- 3*z2*z4^5*z6^7- 3*z3*z4^5*z6^7-
    3*z4^6*z6^7- 21*z2*z3*z4^3*z5*z6^7+ 11*z2*z4^4*z5*z6^7+ 11*z3*z4^4*z5*z6^7-
    3*z4^5*z5*z6^7+ 11*z2*z3*z4^3*z6^8- 3*z2*z4^4*z6^8- 3*z3*z4^4*z6^8-
    3*z4^5*z6^8- 21*z2*z3*z4^2*z5*z6^8+ 11*z2*z4^3*z5*z6^8+ 11*z3*z4^3*z5*z6^8-
    3*z4^4*z5*z6^8+ 11*z2*z3*z4^2*z6^9- 3*z2*z4^3*z6^9- 3*z3*z4^3*z6^9-
    3*z4^4*z6^9- 21*z2*z3*z4*z5*z6^9+ 11*z2*z4^2*z5*z6^9+ 11*z3*z4^2*z5*z6^9-
    3*z4^3*z5*z6^9+ 11*z2*z3*z4*z6^10- 3*z2*z4^2*z6^10- 3*z3*z4^2*z6^10-
    3*z4^3*z6^10+ z2*z3*z5*z6^10+ 11*z2*z4*z5*z6^10+ 11*z3*z4*z5*z6^10-
    3*z4^2*z5*z6^10+ 10*z2*z3*z6^11- 3*z2*z4*z6^11- 3*z3*z4*z6^11- 3*z4^2*z6^11+
    10*z2*z5*z6^11+ 10*z3*z5*z6^11- 3*z4*z5*z6^11- 13*z2*z6^12- 13*z3*z6^12-
    3*z4*z6^12- 13*z5*z6^12+ 10*z6^13+ z2*z3*z4^10*z7+ 10*z2*z4^11*z7+
    10*z3*z4^11*z7- 13*z4^12*z7- 22*z2*z3*z4^9*z5*z7+ z2*z4^10*z5*z7+
    z3*z4^10*z5*z7+ 10*z4^11*z5*z7- 21*z2*z3*z4^9*z6*z7+ 11*z2*z4^10*z6*z7+
    11*z3*z4^10*z6*z7- 3*z4^11*z6*z7+ 33*z2*z3*z4^8*z5*z6*z7- 21*z2*z4^9*z5*z6*z7-
    21*z3*z4^9*z5*z6*z7+ 11*z4^10*z5*z6*z7- 21*z2*z3*z4^8*z6^2*z7+
    11*z2*z4^9*z6^2*z7+ 11*z3*z4^9*z6^2*z7- 3*z4^10*z6^2*z7+
    33*z2*z3*z4^7*z5*z6^2*z7- 21*z2*z4^8*z5*z6^2*z7- 21*z3*z4^8*z5*z6^2*z7+
    11*z4^9*z5*z6^2*z7- 21*z2*z3*z4^7*z6^3*z7+ 11*z2*z4^8*z6^3*z7+
    11*z3*z4^8*z6^3*z7- 3*z4^9*z6^3*z7+ 33*z2*z3*z4^6*z5*z6^3*z7-
    21*z2*z4^7*z5*z6^3*z7- 21*z3*z4^7*z5*z6^3*z7+ 11*z4^8*z5*z6^3*z7-
    21*z2*z3*z4^6*z6^4*z7+ 11*z2*z4^7*z6^4*z7+ 11*z3*z4^7*z6^4*z7- 3*z4^8*z6^4*z7+
    33*z2*z3*z4^5*z5*z6^4*z7- 21*z2*z4^6*z5*z6^4*z7- 21*z3*z4^6*z5*z6^4*z7+
    11*z4^7*z5*z6^4*z7- 21*z2*z3*z4^5*z6^5*z7+ 11*z2*z4^6*z6^5*z7+
    11*z3*z4^6*z6^5*z7- 3*z4^7*z6^5*z7+ 33*z2*z3*z4^4*z5*z6^5*z7-
    21*z2*z4^5*z5*z6^5*z7- 21*z3*z4^5*z5*z6^5*z7+ 11*z4^6*z5*z6^5*z7-
    21*z2*z3*z4^4*z6^6*z7+ 11*z2*z4^5*z6^6*z7+ 11*z3*z4^5*z6^6*z7- 3*z4^6*z6^6*z7+
    33*z2*z3*z4^3*z5*z6^6*z7- 21*z2*z4^4*z5*z6^6*z7- 21*z3*z4^4*z5*z6^6*z7+
    11*z4^5*z5*z6^6*z7- 21*z2*z3*z4^3*z6^7*z7+ 11*z2*z4^4*z6^7*z7+
    11*z3*z4^4*z6^7*z7- 3*z4^5*z6^7*z7+ 33*z2*z3*z4^2*z5*z6^7*z7-
    21*z2*z4^3*z5*z6^7*z7- 21*z3*z4^3*z5*z6^7*z7+ 11*z4^4*z5*z6^7*z7-
    21*z2*z3*z4^2*z6^8*z7+ 11*z2*z4^3*z6^8*z7+ 11*z3*z4^3*z6^8*z7- 3*z4^4*z6^8*z7+
    33*z2*z3*z4*z5*z6^8*z7- 21*z2*z4^2*z5*z6^8*z7- 21*z3*z4^2*z5*z6^8*z7+
    11*z4^3*z5*z6^8*z7- 21*z2*z3*z4*z6^9*z7+ 11*z2*z4^2*z6^9*z7+
    11*z3*z4^2*z6^9*z7- 3*z4^3*z6^9*z7- 22*z2*z3*z5*z6^9*z7- 21*z2*z4*z5*z6^9*z7-
    21*z3*z4*z5*z6^9*z7+ 11*z4^2*z5*z6^9*z7+ z2*z3*z6^10*z7+ 11*z2*z4*z6^10*z7+
    11*z3*z4*z6^10*z7- 3*z4^2*z6^10*z7+ z2*z5*z6^10*z7+ z3*z5*z6^10*z7+
    11*z4*z5*z6^10*z7+ 10*z2*z6^11*z7+ 10*z3*z6^11*z7- 3*z4*z6^11*z7+
    10*z5*z6^11*z7- 13*z6^12*z7+ 1121*z2*z3*z4^9- 12*z2*z4^10- 12*z3*z4^10-
    1107*z4^11- 2231*z2*z3*z4^8*z5+ 1121*z2*z4^9*z5+ 1121*z3*z4^9*z5- 12*z4^10*z5-
    1110*z2*z3*z4^8*z6+ 1109*z2*z4^9*z6+ 1109*z3*z4^9*z6- 1119*z4^10*z6+
    1132*z2*z3*z4^7*z5*z6- 1110*z2*z4^8*z5*z6- 1110*z3*z4^8*z5*z6+
    1109*z4^9*z5*z6- 1110*z2*z3*z4^7*z6^2+ 1109*z2*z4^8*z6^2+ 1109*z3*z4^8*z6^2-
    1119*z4^9*z6^2+ 1132*z2*z3*z4^6*z5*z6^2- 1110*z2*z4^7*z5*z6^2-
    1110*z3*z4^7*z5*z6^2+ 1109*z4^8*z5*z6^2- 1110*z2*z3*z4^6*z6^3+
    1109*z2*z4^7*z6^3+ 1109*z3*z4^7*z6^3- 1119*z4^8*z6^3+ 1132*z2*z3*z4^5*z5*z6^3-
    1110*z2*z4^6*z5*z6^3- 1110*z3*z4^6*z5*z6^3+ 1109*z4^7*z5*z6^3-
    1110*z2*z3*z4^5*z6^4+ 1109*z2*z4^6*z6^4+ 1109*z3*z4^6*z6^4- 1119*z4^7*z6^4+
    1132*z2*z3*z4^4*z5*z6^4- 1110*z2*z4^5*z5*z6^4- 1110*z3*z4^5*z5*z6^4+
    1109*z4^6*z5*z6^4- 1110*z2*z3*z4^4*z6^5+ 1109*z2*z4^5*z6^5+ 1109*z3*z4^5*z6^5-
    1119*z4^6*z6^5+ 1132*z2*z3*z4^3*z5*z6^5- 1110*z2*z4^4*z5*z6^5-
    1110*z3*z4^4*z5*z6^5+ 1109*z4^5*z5*z6^5- 1110*z2*z3*z4^3*z6^6+
    1109*z2*z4^4*z6^6+ 1109*z3*z4^4*z6^6- 1119*z4^5*z6^6+ 1132*z2*z3*z4^2*z5*z6^6-
    1110*z2*z4^3*z5*z6^6- 1110*z3*z4^3*z5*z6^6+ 1109*z4^4*z5*z6^6-
    1110*z2*z3*z4^2*z6^7+ 1109*z2*z4^3*z6^7+ 1109*z3*z4^3*z6^7- 1119*z4^4*z6^7+
    1132*z2*z3*z4*z5*z6^7- 1110*z2*z4^2*z5*z6^7- 1110*z3*z4^2*z5*z6^7+
    1109*z4^3*z5*z6^7- 1110*z2*z3*z4*z6^8+ 1109*z2*z4^2*z6^8+ 1109*z3*z4^2*z6^8-
    1119*z4^3*z6^8- 2231*z2*z3*z5*z6^8- 1110*z2*z4*z5*z6^8- 1110*z3*z4*z5*z6^8+
    1109*z4^2*z5*z6^8+ 1121*z2*z3*z6^9+ 1109*z2*z4*z6^9+ 1109*z3*z4*z6^9-
    1119*z4^2*z6^9+ 1121*z2*z5*z6^9+ 1121*z3*z5*z6^9+ 1109*z4*z5*z6^9-
    12*z2*z6^10- 12*z3*z6^10- 1119*z4*z6^10- 12*z5*z6^10- 1107*z6^11-
    2231*z2*z3*z4^8*z7+ 1121*z2*z4^9*z7+ 1121*z3*z4^9*z7- 12*z4^10*z7+
    3363*z2*z3*z4^7*z5*z7- 2231*z2*z4^8*z5*z7- 2231*z3*z4^8*z5*z7+
    1121*z4^9*z5*z7+ 1132*z2*z3*z4^7*z6*z7- 1110*z2*z4^8*z6*z7-
    1110*z3*z4^8*z6*z7+ 1109*z4^9*z6*z7- 1187*z2*z3*z4^6*z5*z6*z7+
    1132*z2*z4^7*z5*z6*z7+ 1132*z3*z4^7*z5*z6*z7- 1110*z4^8*z5*z6*z7+
    1132*z2*z3*z4^6*z6^2*z7- 1110*z2*z4^7*z6^2*z7- 1110*z3*z4^7*z6^2*z7+
    1109*z4^8*z6^2*z7- 1187*z2*z3*z4^5*z5*z6^2*z7+ 1132*z2*z4^6*z5*z6^2*z7+
    1132*z3*z4^6*z5*z6^2*z7- 1110*z4^7*z5*z6^2*z7+ 1132*z2*z3*z4^5*z6^3*z7-
    1110*z2*z4^6*z6^3*z7- 1110*z3*z4^6*z6^3*z7+ 1109*z4^7*z6^3*z7-
    1187*z2*z3*z4^4*z5*z6^3*z7+ 1132*z2*z4^5*z5*z6^3*z7+ 1132*z3*z4^5*z5*z6^3*z7-
    1110*z4^6*z5*z6^3*z7+ 1132*z2*z3*z4^4*z6^4*z7- 1110*z2*z4^5*z6^4*z7-
    1110*z3*z4^5*z6^4*z7+ 1109*z4^6*z6^4*z7- 1187*z2*z3*z4^3*z5*z6^4*z7+
    1132*z2*z4^4*z5*z6^4*z7+ 1132*z3*z4^4*z5*z6^4*z7- 1110*z4^5*z5*z6^4*z7+
    1132*z2*z3*z4^3*z6^5*z7- 1110*z2*z4^4*z6^5*z7- 1110*z3*z4^4*z6^5*z7+
    1109*z4^5*z6^5*z7- 1187*z2*z3*z4^2*z5*z6^5*z7+ 1132*z2*z4^3*z5*z6^5*z7+
    1132*z3*z4^3*z5*z6^5*z7- 1110*z4^4*z5*z6^5*z7+ 1132*z2*z3*z4^2*z6^6*z7-
    1110*z2*z4^3*z6^6*z7- 1110*z3*z4^3*z6^6*z7+ 1109*z4^4*z6^6*z7-
    1187*z2*z3*z4*z5*z6^6*z7+ 1132*z2*z4^2*z5*z6^6*z7+ 1132*z3*z4^2*z5*z6^6*z7-
    1110*z4^3*z5*z6^6*z7+ 1132*z2*z3*z4*z6^7*z7- 1110*z2*z4^2*z6^7*z7-
    1110*z3*z4^2*z6^7*z7+ 1109*z4^3*z6^7*z7+ 3363*z2*z3*z5*z6^7*z7+
    1132*z2*z4*z5*z6^7*z7+ 1132*z3*z4*z5*z6^7*z7- 1110*z4^2*z5*z6^7*z7-
    2231*z2*z3*z6^8*z7- 1110*z2*z4*z6^8*z7- 1110*z3*z4*z6^8*z7+ 1109*z4^2*z6^8*z7-
    2231*z2*z5*z6^8*z7- 2231*z3*z5*z6^8*z7- 1110*z4*z5*z6^8*z7+ 1121*z2*z6^9*z7+
    1121*z3*z6^9*z7+ 1109*z4*z6^9*z7+ 1121*z5*z6^9*z7- 12*z6^10*z7+
    3363*z2*z3*z4^7- 3374*z2*z4^8- 3374*z3*z4^8+ 2264*z4^9- 1121*z2*z3*z4^6*z5+
    3363*z2*z4^7*z5+ 3363*z3*z4^7*z5- 3374*z4^8*z5+ 2242*z2*z3*z4^6*z6-
    11*z2*z4^7*z6- 11*z3*z4^7*z6- 1110*z4^8*z6+ 3396*z2*z3*z4^5*z5*z6+
    2242*z2*z4^6*z5*z6+ 2242*z3*z4^6*z5*z6- 11*z4^7*z5*z6+ 2242*z2*z3*z4^5*z6^2-
    11*z2*z4^6*z6^2- 11*z3*z4^6*z6^2- 1110*z4^7*z6^2+ 3396*z2*z3*z4^4*z5*z6^2+
    2242*z2*z4^5*z5*z6^2+ 2242*z3*z4^5*z5*z6^2- 11*z4^6*z5*z6^2+
    2242*z2*z3*z4^4*z6^3- 11*z2*z4^5*z6^3- 11*z3*z4^5*z6^3- 1110*z4^6*z6^3+
    3396*z2*z3*z4^3*z5*z6^3+ 2242*z2*z4^4*z5*z6^3+ 2242*z3*z4^4*z5*z6^3-
    11*z4^5*z5*z6^3+ 2242*z2*z3*z4^3*z6^4- 11*z2*z4^4*z6^4- 11*z3*z4^4*z6^4-
    1110*z4^5*z6^4+ 3396*z2*z3*z4^2*z5*z6^4+ 2242*z2*z4^3*z5*z6^4+
    2242*z3*z4^3*z5*z6^4- 11*z4^4*z5*z6^4+ 2242*z2*z3*z4^2*z6^5- 11*z2*z4^3*z6^5-
    11*z3*z4^3*z6^5- 1110*z4^4*z6^5+ 3396*z2*z3*z4*z5*z6^5+ 2242*z2*z4^2*z5*z6^5+
    2242*z3*z4^2*z5*z6^5- 11*z4^3*z5*z6^5+ 2242*z2*z3*z4*z6^6- 11*z2*z4^2*z6^6-
    11*z3*z4^2*z6^6- 1110*z4^3*z6^6- 1121*z2*z3*z5*z6^6+ 2242*z2*z4*z5*z6^6+
    2242*z3*z4*z5*z6^6- 11*z4^2*z5*z6^6+ 3363*z2*z3*z6^7- 11*z2*z4*z6^7-
    11*z3*z4*z6^7- 1110*z4^2*z6^7+ 3363*z2*z5*z6^7+ 3363*z3*z5*z6^7-
    11*z4*z5*z6^7- 3374*z2*z6^8- 3374*z3*z6^8- 1110*z4*z6^8- 3374*z5*z6^8+
    2264*z6^9- 1121*z2*z3*z4^6*z7+ 3363*z2*z4^7*z7+ 3363*z3*z4^7*z7- 3374*z4^8*z7-
    4484*z2*z3*z4^5*z5*z7- 1121*z2*z4^6*z5*z7- 1121*z3*z4^6*z5*z7+
    3363*z4^7*z5*z7+ 3396*z2*z3*z4^5*z6*z7+ 2242*z2*z4^6*z6*z7+
    2242*z3*z4^6*z6*z7- 11*z4^7*z6*z7+ 1154*z2*z3*z4^4*z5*z6*z7+
    3396*z2*z4^5*z5*z6*z7+ 3396*z3*z4^5*z5*z6*z7+ 2242*z4^6*z5*z6*z7+
    3396*z2*z3*z4^4*z6^2*z7+ 2242*z2*z4^5*z6^2*z7+ 2242*z3*z4^5*z6^2*z7-
    11*z4^6*z6^2*z7+ 1154*z2*z3*z4^3*z5*z6^2*z7+ 3396*z2*z4^4*z5*z6^2*z7+
    3396*z3*z4^4*z5*z6^2*z7+ 2242*z4^5*z5*z6^2*z7+ 3396*z2*z3*z4^3*z6^3*z7+
    2242*z2*z4^4*z6^3*z7+ 2242*z3*z4^4*z6^3*z7- 11*z4^5*z6^3*z7+
    1154*z2*z3*z4^2*z5*z6^3*z7+ 3396*z2*z4^3*z5*z6^3*z7+ 3396*z3*z4^3*z5*z6^3*z7+
    2242*z4^4*z5*z6^3*z7+ 3396*z2*z3*z4^2*z6^4*z7+ 2242*z2*z4^3*z6^4*z7+
    2242*z3*z4^3*z6^4*z7- 11*z4^4*z6^4*z7+ 1154*z2*z3*z4*z5*z6^4*z7+
    3396*z2*z4^2*z5*z6^4*z7+ 3396*z3*z4^2*z5*z6^4*z7+ 2242*z4^3*z5*z6^4*z7+
    3396*z2*z3*z4*z6^5*z7+ 2242*z2*z4^2*z6^5*z7+ 2242*z3*z4^2*z6^5*z7-
    11*z4^3*z6^5*z7- 4484*z2*z3*z5*z6^5*z7+ 3396*z2*z4*z5*z6^5*z7+
    3396*z3*z4*z5*z6^5*z7+ 2242*z4^2*z5*z6^5*z7- 1121*z2*z3*z6^6*z7+
    2242*z2*z4*z6^6*z7+ 2242*z3*z4*z6^6*z7- 11*z4^2*z6^6*z7- 1121*z2*z5*z6^6*z7-
    1121*z3*z5*z6^6*z7+ 2242*z4*z5*z6^6*z7+ 3363*z2*z6^7*z7+ 3363*z3*z6^7*z7-
    11*z4*z6^7*z7+ 3363*z5*z6^7*z7- 3374*z6^8*z7+ 2740*z2*z3*z4^5+ 147*z2*z4^6+
    147*z3*z4^6+ 2604*z4^7+ 4495*z2*z3*z4^4*z5+ 2740*z2*z4^5*z5+ 2740*z3*z4^5*z5+
    147*z4^6*z5- 1766*z2*z3*z4^4*z6+ 2887*z2*z4^5*z6+ 2887*z3*z4^5*z6+
    2751*z4^6*z6- 2751*z2*z3*z4^3*z5*z6- 1766*z2*z4^4*z5*z6- 1766*z3*z4^4*z5*z6+
    2887*z4^5*z5*z6- 1766*z2*z3*z4^3*z6^2+ 2887*z2*z4^4*z6^2+ 2887*z3*z4^4*z6^2+
    2751*z4^5*z6^2- 2751*z2*z3*z4^2*z5*z6^2- 1766*z2*z4^3*z5*z6^2-
    1766*z3*z4^3*z5*z6^2+ 2887*z4^4*z5*z6^2- 1766*z2*z3*z4^2*z6^3+
    2887*z2*z4^3*z6^3+ 2887*z3*z4^3*z6^3+ 2751*z4^4*z6^3- 2751*z2*z3*z4*z5*z6^3-
    1766*z2*z4^2*z5*z6^3- 1766*z3*z4^2*z5*z6^3+ 2887*z4^3*z5*z6^3-
    1766*z2*z3*z4*z6^4+ 2887*z2*z4^2*z6^4+ 2887*z3*z4^2*z6^4+ 2751*z4^3*z6^4+
    4495*z2*z3*z5*z6^4- 1766*z2*z4*z5*z6^4- 1766*z3*z4*z5*z6^4+ 2887*z4^2*z5*z6^4+
    2740*z2*z3*z6^5+ 2887*z2*z4*z6^5+ 2887*z3*z4*z6^5+ 2751*z4^2*z6^5+
    2740*z2*z5*z6^5+ 2740*z3*z5*z6^5+ 2887*z4*z5*z6^5+ 147*z2*z6^6+ 147*z3*z6^6+
    2751*z4*z6^6+ 147*z5*z6^6+ 2604*z6^7+ 4495*z2*z3*z4^4*z7+ 2740*z2*z4^5*z7+
    2740*z3*z4^5*z7+ 147*z4^6*z7+ 1755*z2*z3*z4^3*z5*z7+ 4495*z2*z4^4*z5*z7+
    4495*z3*z4^4*z5*z7+ 2740*z4^5*z5*z7- 2751*z2*z3*z4^3*z6*z7-
    1766*z2*z4^4*z6*z7- 1766*z3*z4^4*z6*z7+ 2887*z4^5*z6*z7-
    2887*z2*z3*z4^2*z5*z6*z7- 2751*z2*z4^3*z5*z6*z7- 2751*z3*z4^3*z5*z6*z7-
    1766*z4^4*z5*z6*z7- 2751*z2*z3*z4^2*z6^2*z7- 1766*z2*z4^3*z6^2*z7-
    1766*z3*z4^3*z6^2*z7+ 2887*z4^4*z6^2*z7- 2887*z2*z3*z4*z5*z6^2*z7-
    2751*z2*z4^2*z5*z6^2*z7- 2751*z3*z4^2*z5*z6^2*z7- 1766*z4^3*z5*z6^2*z7-
    2751*z2*z3*z4*z6^3*z7- 1766*z2*z4^2*z6^3*z7- 1766*z3*z4^2*z6^3*z7+
    2887*z4^3*z6^3*z7+ 1755*z2*z3*z5*z6^3*z7- 2751*z2*z4*z5*z6^3*z7-
    2751*z3*z4*z5*z6^3*z7- 1766*z4^2*z5*z6^3*z7+ 4495*z2*z3*z6^4*z7-
    1766*z2*z4*z6^4*z7- 1766*z3*z4*z6^4*z7+ 2887*z4^2*z6^4*z7+ 4495*z2*z5*z6^4*z7+
    4495*z3*z5*z6^4*z7- 1766*z4*z5*z6^4*z7+ 2740*z2*z6^5*z7+ 2740*z3*z6^5*z7+
    2887*z4*z6^5*z7+ 2740*z5*z6^5*z7+ 147*z6^6*z7+ 3588*z2*z3*z4^3+ 318*z2*z4^4+
    318*z3*z4^4+ 2037*z4^5- 2988*z2*z3*z4^2*z5+ 3588*z2*z4^3*z5+ 3588*z3*z4^3*z5+
    318*z4^4*z5+ 600*z2*z3*z4^2*z6+ 3906*z2*z4^3*z6+ 3906*z3*z4^3*z6+
    2355*z4^4*z6- 2355*z2*z3*z4*z5*z6+ 600*z2*z4^2*z5*z6+ 600*z3*z4^2*z5*z6+
    3906*z4^3*z5*z6+ 600*z2*z3*z4*z6^2+ 3906*z2*z4^2*z6^2+ 3906*z3*z4^2*z6^2+
    2355*z4^3*z6^2- 2988*z2*z3*z5*z6^2+ 600*z2*z4*z5*z6^2+ 600*z3*z4*z5*z6^2+
    3906*z4^2*z5*z6^2+ 3588*z2*z3*z6^3+ 3906*z2*z4*z6^3+ 3906*z3*z4*z6^3+
    2355*z4^2*z6^3+ 3588*z2*z5*z6^3+ 3588*z3*z5*z6^3+ 3906*z4*z5*z6^3+
    318*z2*z6^4+ 318*z3*z6^4+ 2355*z4*z6^4+ 318*z5*z6^4+ 2037*z6^5-
    2988*z2*z3*z4^2*z7+ 3588*z2*z4^3*z7+ 3588*z3*z4^3*z7+ 318*z4^4*z7+
    633*z2*z3*z4*z5*z7- 2988*z2*z4^2*z5*z7- 2988*z3*z4^2*z5*z7+ 3588*z4^3*z5*z7-
    2355*z2*z3*z4*z6*z7+ 600*z2*z4^2*z6*z7+ 600*z3*z4^2*z6*z7+ 3906*z4^3*z6*z7+
    633*z2*z3*z5*z6*z7- 2355*z2*z4*z5*z6*z7- 2355*z3*z4*z5*z6*z7+
    600*z4^2*z5*z6*z7- 2988*z2*z3*z6^2*z7+ 600*z2*z4*z6^2*z7+ 600*z3*z4*z6^2*z7+
    3906*z4^2*z6^2*z7- 2988*z2*z5*z6^2*z7- 2988*z3*z5*z6^2*z7+ 600*z4*z5*z6^2*z7+
    3588*z2*z6^3*z7+ 3588*z3*z6^3*z7+ 3906*z4*z6^3*z7+ 3588*z5*z6^3*z7+
    318*z6^4*z7- 2202*z2*z3*z4- 1776*z2*z4^2- 1776*z3*z4^2+ 2166*z4^3-
    1068*z2*z3*z5- 2202*z2*z4*z5- 2202*z3*z4*z5- 1776*z4^2*z5- 2202*z2*z3*z6-
    3978*z2*z4*z6- 3978*z3*z4*z6+ 390*z4^2*z6- 2202*z2*z5*z6- 2202*z3*z5*z6-
    3978*z4*z5*z6- 1776*z2*z6^2- 1776*z3*z6^2+ 390*z4*z6^2- 1776*z5*z6^2+
    2166*z6^3- 1068*z2*z3*z7- 2202*z2*z4*z7- 2202*z3*z4*z7- 1776*z4^2*z7-
    1068*z2*z5*z7- 1068*z3*z5*z7- 2202*z4*z5*z7- 2202*z2*z6*z7- 2202*z3*z6*z7-
    3978*z4*z6*z7- 2202*z5*z6*z7- 1776*z6^2*z7+ 3538*z2+ 3538*z3- 1169*z4+
    3538*z5- 1169*z6+ 3538*z7, 6*z2*z3*z4^13- 4*z2*z4^14- 4*z3*z4^14+ 2*z4^15-
    8*z2*z3*z4^12*z5+ 6*z2*z4^13*z5+ 6*z3*z4^13*z5- 4*z4^14*z5- 8*z2*z3*z4^12*z6+
    6*z2*z4^13*z6+ 6*z3*z4^13*z6- 4*z4^14*z6+ 10*z2*z3*z4^11*z5*z6-
    8*z2*z4^12*z5*z6- 8*z3*z4^12*z5*z6+ 6*z4^13*z5*z6- 2*z2*z3*z4^12*z7+
    2*z2*z4^13*z7+ 2*z3*z4^13*z7- 2*z4^14*z7+ 2*z2*z3*z4^11*z5*z7-
    2*z2*z4^12*z5*z7- 2*z3*z4^12*z5*z7+ 2*z4^13*z5*z7+ 2*z2*z3*z4^11*z6*z7-
    2*z2*z4^12*z6*z7- 2*z3*z4^12*z6*z7+ 2*z4^13*z6*z7- 2*z2*z3*z4^10*z5*z6*z7+
    2*z2*z4^11*z5*z6*z7+ 2*z3*z4^11*z5*z6*z7- 2*z4^12*z5*z6*z7-
    2*z2*z3*z4^11*z7^2+ 2*z2*z4^12*z7^2+ 2*z3*z4^12*z7^2- 2*z4^13*z7^2+
    2*z2*z3*z4^10*z5*z7^2- 2*z2*z4^11*z5*z7^2- 2*z3*z4^11*z5*z7^2+
    2*z4^12*z5*z7^2+ 2*z2*z3*z4^10*z6*z7^2- 2*z2*z4^11*z6*z7^2-
    2*z3*z4^11*z6*z7^2+ 2*z4^12*z6*z7^2- 2*z2*z3*z4^9*z5*z6*z7^2+
    2*z2*z4^10*z5*z6*z7^2+ 2*z3*z4^10*z5*z6*z7^2- 2*z4^11*z5*z6*z7^2-
    2*z2*z3*z4^10*z7^3+ 2*z2*z4^11*z7^3+ 2*z3*z4^11*z7^3- 2*z4^12*z7^3+
    2*z2*z3*z4^9*z5*z7^3- 2*z2*z4^10*z5*z7^3- 2*z3*z4^10*z5*z7^3+ 2*z4^11*z5*z7^3+
    2*z2*z3*z4^9*z6*z7^3- 2*z2*z4^10*z6*z7^3- 2*z3*z4^10*z6*z7^3+ 2*z4^11*z6*z7^3-
    2*z2*z3*z4^8*z5*z6*z7^3+ 2*z2*z4^9*z5*z6*z7^3+ 2*z3*z4^9*z5*z6*z7^3-
    2*z4^10*z5*z6*z7^3- 2*z2*z3*z4^9*z7^4+ 2*z2*z4^10*z7^4+ 2*z3*z4^10*z7^4-
    2*z4^11*z7^4+ 2*z2*z3*z4^8*z5*z7^4- 2*z2*z4^9*z5*z7^4- 2*z3*z4^9*z5*z7^4+
    2*z4^10*z5*z7^4+ 2*z2*z3*z4^8*z6*z7^4- 2*z2*z4^9*z6*z7^4- 2*z3*z4^9*z6*z7^4+
    2*z4^10*z6*z7^4- 2*z2*z3*z4^7*z5*z6*z7^4+ 2*z2*z4^8*z5*z6*z7^4+
    2*z3*z4^8*z5*z6*z7^4- 2*z4^9*z5*z6*z7^4- 2*z2*z3*z4^8*z7^5+ 2*z2*z4^9*z7^5+
    2*z3*z4^9*z7^5- 2*z4^10*z7^5+ 2*z2*z3*z4^7*z5*z7^5- 2*z2*z4^8*z5*z7^5-
    2*z3*z4^8*z5*z7^5+ 2*z4^9*z5*z7^5+ 2*z2*z3*z4^7*z6*z7^5- 2*z2*z4^8*z6*z7^5-
    2*z3*z4^8*z6*z7^5+ 2*z4^9*z6*z7^5- 2*z2*z3*z4^6*z5*z6*z7^5+
    2*z2*z4^7*z5*z6*z7^5+ 2*z3*z4^7*z5*z6*z7^5- 2*z4^8*z5*z6*z7^5-
    2*z2*z3*z4^7*z7^6+ 2*z2*z4^8*z7^6+ 2*z3*z4^8*z7^6- 2*z4^9*z7^6+
    2*z2*z3*z4^6*z5*z7^6- 2*z2*z4^7*z5*z7^6- 2*z3*z4^7*z5*z7^6+ 2*z4^8*z5*z7^6+
    2*z2*z3*z4^6*z6*z7^6- 2*z2*z4^7*z6*z7^6- 2*z3*z4^7*z6*z7^6+ 2*z4^8*z6*z7^6-
    2*z2*z3*z4^5*z5*z6*z7^6+ 2*z2*z4^6*z5*z6*z7^6+ 2*z3*z4^6*z5*z6*z7^6-
    2*z4^7*z5*z6*z7^6- 2*z2*z3*z4^6*z7^7+ 2*z2*z4^7*z7^7+ 2*z3*z4^7*z7^7-
    2*z4^8*z7^7+ 2*z2*z3*z4^5*z5*z7^7- 2*z2*z4^6*z5*z7^7- 2*z3*z4^6*z5*z7^7+
    2*z4^7*z5*z7^7+ 2*z2*z3*z4^5*z6*z7^7- 2*z2*z4^6*z6*z7^7- 2*z3*z4^6*z6*z7^7+
    2*z4^7*z6*z7^7- 2*z2*z3*z4^4*z5*z6*z7^7+ 2*z2*z4^5*z5*z6*z7^7+
    2*z3*z4^5*z5*z6*z7^7- 2*z4^6*z5*z6*z7^7- 2*z2*z3*z4^5*z7^8+ 2*z2*z4^6*z7^8+
    2*z3*z4^6*z7^8- 2*z4^7*z7^8+ 2*z2*z3*z4^4*z5*z7^8- 2*z2*z4^5*z5*z7^8-
    2*z3*z4^5*z5*z7^8+ 2*z4^6*z5*z7^8+ 2*z2*z3*z4^4*z6*z7^8- 2*z2*z4^5*z6*z7^8-
    2*z3*z4^5*z6*z7^8+ 2*z4^6*z6*z7^8- 2*z2*z3*z4^3*z5*z6*z7^8+
    2*z2*z4^4*z5*z6*z7^8+ 2*z3*z4^4*z5*z6*z7^8- 2*z4^5*z5*z6*z7^8-
    2*z2*z3*z4^4*z7^9+ 2*z2*z4^5*z7^9+ 2*z3*z4^5*z7^9- 2*z4^6*z7^9+
    2*z2*z3*z4^3*z5*z7^9- 2*z2*z4^4*z5*z7^9- 2*z3*z4^4*z5*z7^9+ 2*z4^5*z5*z7^9+
    2*z2*z3*z4^3*z6*z7^9- 2*z2*z4^4*z6*z7^9- 2*z3*z4^4*z6*z7^9+ 2*z4^5*z6*z7^9-
    2*z2*z3*z4^2*z5*z6*z7^9+ 2*z2*z4^3*z5*z6*z7^9+ 2*z3*z4^3*z5*z6*z7^9-
    2*z4^4*z5*z6*z7^9- 2*z2*z3*z4^3*z7^10+ 2*z2*z4^4*z7^10+ 2*z3*z4^4*z7^10-
    2*z4^5*z7^10+ 2*z2*z3*z4^2*z5*z7^10- 2*z2*z4^3*z5*z7^10- 2*z3*z4^3*z5*z7^10+
    2*z4^4*z5*z7^10+ 2*z2*z3*z4^2*z6*z7^10- 2*z2*z4^3*z6*z7^10-
    2*z3*z4^3*z6*z7^10+ 2*z4^4*z6*z7^10- 2*z2*z3*z4*z5*z6*z7^10+
    2*z2*z4^2*z5*z6*z7^10+ 2*z3*z4^2*z5*z6*z7^10- 2*z4^3*z5*z6*z7^10-
    2*z2*z3*z4^2*z7^11+ 2*z2*z4^3*z7^11+ 2*z3*z4^3*z7^11- 2*z4^4*z7^11+
    2*z2*z3*z4*z5*z7^11- 2*z2*z4^2*z5*z7^11- 2*z3*z4^2*z5*z7^11+ 2*z4^3*z5*z7^11+
    2*z2*z3*z4*z6*z7^11- 2*z2*z4^2*z6*z7^11- 2*z3*z4^2*z6*z7^11+ 2*z4^3*z6*z7^11+
    10*z2*z3*z5*z6*z7^11+ 2*z2*z4*z5*z6*z7^11+ 2*z3*z4*z5*z6*z7^11-
    2*z4^2*z5*z6*z7^11- 2*z2*z3*z4*z7^12+ 2*z2*z4^2*z7^12+ 2*z3*z4^2*z7^12-
    2*z4^3*z7^12- 8*z2*z3*z5*z7^12- 2*z2*z4*z5*z7^12- 2*z3*z4*z5*z7^12+
    2*z4^2*z5*z7^12- 8*z2*z3*z6*z7^12- 2*z2*z4*z6*z7^12- 2*z3*z4*z6*z7^12+
    2*z4^2*z6*z7^12- 8*z2*z5*z6*z7^12- 8*z3*z5*z6*z7^12- 2*z4*z5*z6*z7^12+
    6*z2*z3*z7^13+ 2*z2*z4*z7^13+ 2*z3*z4*z7^13- 2*z4^2*z7^13+ 6*z2*z5*z7^13+
    6*z3*z5*z7^13+ 2*z4*z5*z7^13+ 6*z2*z6*z7^13+ 6*z3*z6*z7^13+ 2*z4*z6*z7^13+
    6*z5*z6*z7^13- 4*z2*z7^14- 4*z3*z7^14- 2*z4*z7^14- 4*z5*z7^14- 4*z6*z7^14+
    2*z7^15+ 10*z2*z3*z4^11- 13*z2*z4^12- 13*z3*z4^12+ 10*z4^13+ z2*z3*z4^10*z5+
    10*z2*z4^11*z5+ 10*z3*z4^11*z5- 13*z4^12*z5+ z2*z3*z4^10*z6+ 10*z2*z4^11*z6+
    10*z3*z4^11*z6- 13*z4^12*z6- 22*z2*z3*z4^9*z5*z6+ z2*z4^10*z5*z6+
    z3*z4^10*z5*z6+ 10*z4^11*z5*z6+ 11*z2*z3*z4^10*z7- 3*z2*z4^11*z7-
    3*z3*z4^11*z7- 3*z4^12*z7- 21*z2*z3*z4^9*z5*z7+ 11*z2*z4^10*z5*z7+
    11*z3*z4^10*z5*z7- 3*z4^11*z5*z7- 21*z2*z3*z4^9*z6*z7+ 11*z2*z4^10*z6*z7+
    11*z3*z4^10*z6*z7- 3*z4^11*z6*z7+ 33*z2*z3*z4^8*z5*z6*z7- 21*z2*z4^9*z5*z6*z7-
    21*z3*z4^9*z5*z6*z7+ 11*z4^10*z5*z6*z7+ 11*z2*z3*z4^9*z7^2- 3*z2*z4^10*z7^2-
    3*z3*z4^10*z7^2- 3*z4^11*z7^2- 21*z2*z3*z4^8*z5*z7^2+ 11*z2*z4^9*z5*z7^2+
    11*z3*z4^9*z5*z7^2- 3*z4^10*z5*z7^2- 21*z2*z3*z4^8*z6*z7^2+
    11*z2*z4^9*z6*z7^2+ 11*z3*z4^9*z6*z7^2- 3*z4^10*z6*z7^2+
    33*z2*z3*z4^7*z5*z6*z7^2- 21*z2*z4^8*z5*z6*z7^2- 21*z3*z4^8*z5*z6*z7^2+
    11*z4^9*z5*z6*z7^2+ 11*z2*z3*z4^8*z7^3- 3*z2*z4^9*z7^3- 3*z3*z4^9*z7^3-
    3*z4^10*z7^3- 21*z2*z3*z4^7*z5*z7^3+ 11*z2*z4^8*z5*z7^3+ 11*z3*z4^8*z5*z7^3-
    3*z4^9*z5*z7^3- 21*z2*z3*z4^7*z6*z7^3+ 11*z2*z4^8*z6*z7^3+ 11*z3*z4^8*z6*z7^3-
    3*z4^9*z6*z7^3+ 33*z2*z3*z4^6*z5*z6*z7^3- 21*z2*z4^7*z5*z6*z7^3-
    21*z3*z4^7*z5*z6*z7^3+ 11*z4^8*z5*z6*z7^3+ 11*z2*z3*z4^7*z7^4- 3*z2*z4^8*z7^4-
    3*z3*z4^8*z7^4- 3*z4^9*z7^4- 21*z2*z3*z4^6*z5*z7^4+ 11*z2*z4^7*z5*z7^4+
    11*z3*z4^7*z5*z7^4- 3*z4^8*z5*z7^4- 21*z2*z3*z4^6*z6*z7^4+ 11*z2*z4^7*z6*z7^4+
    11*z3*z4^7*z6*z7^4- 3*z4^8*z6*z7^4+ 33*z2*z3*z4^5*z5*z6*z7^4-
    21*z2*z4^6*z5*z6*z7^4- 21*z3*z4^6*z5*z6*z7^4+ 11*z4^7*z5*z6*z7^4+
    11*z2*z3*z4^6*z7^5- 3*z2*z4^7*z7^5- 3*z3*z4^7*z7^5- 3*z4^8*z7^5-
    21*z2*z3*z4^5*z5*z7^5+ 11*z2*z4^6*z5*z7^5+ 11*z3*z4^6*z5*z7^5- 3*z4^7*z5*z7^5-
    21*z2*z3*z4^5*z6*z7^5+ 11*z2*z4^6*z6*z7^5+ 11*z3*z4^6*z6*z7^5- 3*z4^7*z6*z7^5+
    33*z2*z3*z4^4*z5*z6*z7^5- 21*z2*z4^5*z5*z6*z7^5- 21*z3*z4^5*z5*z6*z7^5+
    11*z4^6*z5*z6*z7^5+ 11*z2*z3*z4^5*z7^6- 3*z2*z4^6*z7^6- 3*z3*z4^6*z7^6-
    3*z4^7*z7^6- 21*z2*z3*z4^4*z5*z7^6+ 11*z2*z4^5*z5*z7^6+ 11*z3*z4^5*z5*z7^6-
    3*z4^6*z5*z7^6- 21*z2*z3*z4^4*z6*z7^6+ 11*z2*z4^5*z6*z7^6+ 11*z3*z4^5*z6*z7^6-
    3*z4^6*z6*z7^6+ 33*z2*z3*z4^3*z5*z6*z7^6- 21*z2*z4^4*z5*z6*z7^6-
    21*z3*z4^4*z5*z6*z7^6+ 11*z4^5*z5*z6*z7^6+ 11*z2*z3*z4^4*z7^7- 3*z2*z4^5*z7^7-
    3*z3*z4^5*z7^7- 3*z4^6*z7^7- 21*z2*z3*z4^3*z5*z7^7+ 11*z2*z4^4*z5*z7^7+
    11*z3*z4^4*z5*z7^7- 3*z4^5*z5*z7^7- 21*z2*z3*z4^3*z6*z7^7+ 11*z2*z4^4*z6*z7^7+
    11*z3*z4^4*z6*z7^7- 3*z4^5*z6*z7^7+ 33*z2*z3*z4^2*z5*z6*z7^7-
    21*z2*z4^3*z5*z6*z7^7- 21*z3*z4^3*z5*z6*z7^7+ 11*z4^4*z5*z6*z7^7+
    11*z2*z3*z4^3*z7^8- 3*z2*z4^4*z7^8- 3*z3*z4^4*z7^8- 3*z4^5*z7^8-
    21*z2*z3*z4^2*z5*z7^8+ 11*z2*z4^3*z5*z7^8+ 11*z3*z4^3*z5*z7^8- 3*z4^4*z5*z7^8-
    21*z2*z3*z4^2*z6*z7^8+ 11*z2*z4^3*z6*z7^8+ 11*z3*z4^3*z6*z7^8- 3*z4^4*z6*z7^8+
    33*z2*z3*z4*z5*z6*z7^8- 21*z2*z4^2*z5*z6*z7^8- 21*z3*z4^2*z5*z6*z7^8+
    11*z4^3*z5*z6*z7^8+ 11*z2*z3*z4^2*z7^9- 3*z2*z4^3*z7^9- 3*z3*z4^3*z7^9-
    3*z4^4*z7^9- 21*z2*z3*z4*z5*z7^9+ 11*z2*z4^2*z5*z7^9+ 11*z3*z4^2*z5*z7^9-
    3*z4^3*z5*z7^9- 21*z2*z3*z4*z6*z7^9+ 11*z2*z4^2*z6*z7^9+ 11*z3*z4^2*z6*z7^9-
    3*z4^3*z6*z7^9- 22*z2*z3*z5*z6*z7^9- 21*z2*z4*z5*z6*z7^9- 21*z3*z4*z5*z6*z7^9+
    11*z4^2*z5*z6*z7^9+ 11*z2*z3*z4*z7^10- 3*z2*z4^2*z7^10- 3*z3*z4^2*z7^10-
    3*z4^3*z7^10+ z2*z3*z5*z7^10+ 11*z2*z4*z5*z7^10+ 11*z3*z4*z5*z7^10-
    3*z4^2*z5*z7^10+ z2*z3*z6*z7^10+ 11*z2*z4*z6*z7^10+ 11*z3*z4*z6*z7^10-
    3*z4^2*z6*z7^10+ z2*z5*z6*z7^10+ z3*z5*z6*z7^10+ 11*z4*z5*z6*z7^10+
    10*z2*z3*z7^11- 3*z2*z4*z7^11- 3*z3*z4*z7^11- 3*z4^2*z7^11+ 10*z2*z5*z7^11+
    10*z3*z5*z7^11- 3*z4*z5*z7^11+ 10*z2*z6*z7^11+ 10*z3*z6*z7^11- 3*z4*z6*z7^11+
    10*z5*z6*z7^11- 13*z2*z7^12- 13*z3*z7^12- 3*z4*z7^12- 13*z5*z7^12-
    13*z6*z7^12+ 10*z7^13+ 1121*z2*z3*z4^9- 12*z2*z4^10- 12*z3*z4^10- 1107*z4^11-
    2231*z2*z3*z4^8*z5+ 1121*z2*z4^9*z5+ 1121*z3*z4^9*z5- 12*z4^10*z5-
    2231*z2*z3*z4^8*z6+ 1121*z2*z4^9*z6+ 1121*z3*z4^9*z6- 12*z4^10*z6+
    3363*z2*z3*z4^7*z5*z6- 2231*z2*z4^8*z5*z6- 2231*z3*z4^8*z5*z6+
    1121*z4^9*z5*z6- 1110*z2*z3*z4^8*z7+ 1109*z2*z4^9*z7+ 1109*z3*z4^9*z7-
    1119*z4^10*z7+ 1132*z2*z3*z4^7*z5*z7- 1110*z2*z4^8*z5*z7- 1110*z3*z4^8*z5*z7+
    1109*z4^9*z5*z7+ 1132*z2*z3*z4^7*z6*z7- 1110*z2*z4^8*z6*z7-
    1110*z3*z4^8*z6*z7+ 1109*z4^9*z6*z7- 1187*z2*z3*z4^6*z5*z6*z7+
    1132*z2*z4^7*z5*z6*z7+ 1132*z3*z4^7*z5*z6*z7- 1110*z4^8*z5*z6*z7-
    1110*z2*z3*z4^7*z7^2+ 1109*z2*z4^8*z7^2+ 1109*z3*z4^8*z7^2- 1119*z4^9*z7^2+
    1132*z2*z3*z4^6*z5*z7^2- 1110*z2*z4^7*z5*z7^2- 1110*z3*z4^7*z5*z7^2+
    1109*z4^8*z5*z7^2+ 1132*z2*z3*z4^6*z6*z7^2- 1110*z2*z4^7*z6*z7^2-
    1110*z3*z4^7*z6*z7^2+ 1109*z4^8*z6*z7^2- 1187*z2*z3*z4^5*z5*z6*z7^2+
    1132*z2*z4^6*z5*z6*z7^2+ 1132*z3*z4^6*z5*z6*z7^2- 1110*z4^7*z5*z6*z7^2-
    1110*z2*z3*z4^6*z7^3+ 1109*z2*z4^7*z7^3+ 1109*z3*z4^7*z7^3- 1119*z4^8*z7^3+
    1132*z2*z3*z4^5*z5*z7^3- 1110*z2*z4^6*z5*z7^3- 1110*z3*z4^6*z5*z7^3+
    1109*z4^7*z5*z7^3+ 1132*z2*z3*z4^5*z6*z7^3- 1110*z2*z4^6*z6*z7^3-
    1110*z3*z4^6*z6*z7^3+ 1109*z4^7*z6*z7^3- 1187*z2*z3*z4^4*z5*z6*z7^3+
    1132*z2*z4^5*z5*z6*z7^3+ 1132*z3*z4^5*z5*z6*z7^3- 1110*z4^6*z5*z6*z7^3-
    1110*z2*z3*z4^5*z7^4+ 1109*z2*z4^6*z7^4+ 1109*z3*z4^6*z7^4- 1119*z4^7*z7^4+
    1132*z2*z3*z4^4*z5*z7^4- 1110*z2*z4^5*z5*z7^4- 1110*z3*z4^5*z5*z7^4+
    1109*z4^6*z5*z7^4+ 1132*z2*z3*z4^4*z6*z7^4- 1110*z2*z4^5*z6*z7^4-
    1110*z3*z4^5*z6*z7^4+ 1109*z4^6*z6*z7^4- 1187*z2*z3*z4^3*z5*z6*z7^4+
    1132*z2*z4^4*z5*z6*z7^4+ 1132*z3*z4^4*z5*z6*z7^4- 1110*z4^5*z5*z6*z7^4-
    1110*z2*z3*z4^4*z7^5+ 1109*z2*z4^5*z7^5+ 1109*z3*z4^5*z7^5- 1119*z4^6*z7^5+
    1132*z2*z3*z4^3*z5*z7^5- 1110*z2*z4^4*z5*z7^5- 1110*z3*z4^4*z5*z7^5+
    1109*z4^5*z5*z7^5+ 1132*z2*z3*z4^3*z6*z7^5- 1110*z2*z4^4*z6*z7^5-
    1110*z3*z4^4*z6*z7^5+ 1109*z4^5*z6*z7^5- 1187*z2*z3*z4^2*z5*z6*z7^5+
    1132*z2*z4^3*z5*z6*z7^5+ 1132*z3*z4^3*z5*z6*z7^5- 1110*z4^4*z5*z6*z7^5-
    1110*z2*z3*z4^3*z7^6+ 1109*z2*z4^4*z7^6+ 1109*z3*z4^4*z7^6- 1119*z4^5*z7^6+
    1132*z2*z3*z4^2*z5*z7^6- 1110*z2*z4^3*z5*z7^6- 1110*z3*z4^3*z5*z7^6+
    1109*z4^4*z5*z7^6+ 1132*z2*z3*z4^2*z6*z7^6- 1110*z2*z4^3*z6*z7^6-
    1110*z3*z4^3*z6*z7^6+ 1109*z4^4*z6*z7^6- 1187*z2*z3*z4*z5*z6*z7^6+
    1132*z2*z4^2*z5*z6*z7^6+ 1132*z3*z4^2*z5*z6*z7^6- 1110*z4^3*z5*z6*z7^6-
    1110*z2*z3*z4^2*z7^7+ 1109*z2*z4^3*z7^7+ 1109*z3*z4^3*z7^7- 1119*z4^4*z7^7+
    1132*z2*z3*z4*z5*z7^7- 1110*z2*z4^2*z5*z7^7- 1110*z3*z4^2*z5*z7^7+
    1109*z4^3*z5*z7^7+ 1132*z2*z3*z4*z6*z7^7- 1110*z2*z4^2*z6*z7^7-
    1110*z3*z4^2*z6*z7^7+ 1109*z4^3*z6*z7^7+ 3363*z2*z3*z5*z6*z7^7+
    1132*z2*z4*z5*z6*z7^7+ 1132*z3*z4*z5*z6*z7^7- 1110*z4^2*z5*z6*z7^7-
    1110*z2*z3*z4*z7^8+ 1109*z2*z4^2*z7^8+ 1109*z3*z4^2*z7^8- 1119*z4^3*z7^8-
    2231*z2*z3*z5*z7^8- 1110*z2*z4*z5*z7^8- 1110*z3*z4*z5*z7^8+ 1109*z4^2*z5*z7^8-
    2231*z2*z3*z6*z7^8- 1110*z2*z4*z6*z7^8- 1110*z3*z4*z6*z7^8+ 1109*z4^2*z6*z7^8-
    2231*z2*z5*z6*z7^8- 2231*z3*z5*z6*z7^8- 1110*z4*z5*z6*z7^8+ 1121*z2*z3*z7^9+
    1109*z2*z4*z7^9+ 1109*z3*z4*z7^9- 1119*z4^2*z7^9+ 1121*z2*z5*z7^9+
    1121*z3*z5*z7^9+ 1109*z4*z5*z7^9+ 1121*z2*z6*z7^9+ 1121*z3*z6*z7^9+
    1109*z4*z6*z7^9+ 1121*z5*z6*z7^9- 12*z2*z7^10- 12*z3*z7^10- 1119*z4*z7^10-
    12*z5*z7^10- 12*z6*z7^10- 1107*z7^11+ 3363*z2*z3*z4^7- 3374*z2*z4^8-
    3374*z3*z4^8+ 2264*z4^9- 1121*z2*z3*z4^6*z5+ 3363*z2*z4^7*z5+ 3363*z3*z4^7*z5-
    3374*z4^8*z5- 1121*z2*z3*z4^6*z6+ 3363*z2*z4^7*z6+ 3363*z3*z4^7*z6-
    3374*z4^8*z6- 4484*z2*z3*z4^5*z5*z6- 1121*z2*z4^6*z5*z6- 1121*z3*z4^6*z5*z6+
    3363*z4^7*z5*z6+ 2242*z2*z3*z4^6*z7- 11*z2*z4^7*z7- 11*z3*z4^7*z7-
    1110*z4^8*z7+ 3396*z2*z3*z4^5*z5*z7+ 2242*z2*z4^6*z5*z7+ 2242*z3*z4^6*z5*z7-
    11*z4^7*z5*z7+ 3396*z2*z3*z4^5*z6*z7+ 2242*z2*z4^6*z6*z7+ 2242*z3*z4^6*z6*z7-
    11*z4^7*z6*z7+ 1154*z2*z3*z4^4*z5*z6*z7+ 3396*z2*z4^5*z5*z6*z7+
    3396*z3*z4^5*z5*z6*z7+ 2242*z4^6*z5*z6*z7+ 2242*z2*z3*z4^5*z7^2-
    11*z2*z4^6*z7^2- 11*z3*z4^6*z7^2- 1110*z4^7*z7^2+ 3396*z2*z3*z4^4*z5*z7^2+
    2242*z2*z4^5*z5*z7^2+ 2242*z3*z4^5*z5*z7^2- 11*z4^6*z5*z7^2+
    3396*z2*z3*z4^4*z6*z7^2+ 2242*z2*z4^5*z6*z7^2+ 2242*z3*z4^5*z6*z7^2-
    11*z4^6*z6*z7^2+ 1154*z2*z3*z4^3*z5*z6*z7^2+ 3396*z2*z4^4*z5*z6*z7^2+
    3396*z3*z4^4*z5*z6*z7^2+ 2242*z4^5*z5*z6*z7^2+ 2242*z2*z3*z4^4*z7^3-
    11*z2*z4^5*z7^3- 11*z3*z4^5*z7^3- 1110*z4^6*z7^3+ 3396*z2*z3*z4^3*z5*z7^3+
    2242*z2*z4^4*z5*z7^3+ 2242*z3*z4^4*z5*z7^3- 11*z4^5*z5*z7^3+
    3396*z2*z3*z4^3*z6*z7^3+ 2242*z2*z4^4*z6*z7^3+ 2242*z3*z4^4*z6*z7^3-
    11*z4^5*z6*z7^3+ 1154*z2*z3*z4^2*z5*z6*z7^3+ 3396*z2*z4^3*z5*z6*z7^3+
    3396*z3*z4^3*z5*z6*z7^3+ 2242*z4^4*z5*z6*z7^3+ 2242*z2*z3*z4^3*z7^4-
    11*z2*z4^4*z7^4- 11*z3*z4^4*z7^4- 1110*z4^5*z7^4+ 3396*z2*z3*z4^2*z5*z7^4+
    2242*z2*z4^3*z5*z7^4+ 2242*z3*z4^3*z5*z7^4- 11*z4^4*z5*z7^4+
    3396*z2*z3*z4^2*z6*z7^4+ 2242*z2*z4^3*z6*z7^4+ 2242*z3*z4^3*z6*z7^4-
    11*z4^4*z6*z7^4+ 1154*z2*z3*z4*z5*z6*z7^4+ 3396*z2*z4^2*z5*z6*z7^4+
    3396*z3*z4^2*z5*z6*z7^4+ 2242*z4^3*z5*z6*z7^4+ 2242*z2*z3*z4^2*z7^5-
    11*z2*z4^3*z7^5- 11*z3*z4^3*z7^5- 1110*z4^4*z7^5+ 3396*z2*z3*z4*z5*z7^5+
    2242*z2*z4^2*z5*z7^5+ 2242*z3*z4^2*z5*z7^5- 11*z4^3*z5*z7^5+
    3396*z2*z3*z4*z6*z7^5+ 2242*z2*z4^2*z6*z7^5+ 2242*z3*z4^2*z6*z7^5-
    11*z4^3*z6*z7^5- 4484*z2*z3*z5*z6*z7^5+ 3396*z2*z4*z5*z6*z7^5+
    3396*z3*z4*z5*z6*z7^5+ 2242*z4^2*z5*z6*z7^5+ 2242*z2*z3*z4*z7^6-
    11*z2*z4^2*z7^6- 11*z3*z4^2*z7^6- 1110*z4^3*z7^6- 1121*z2*z3*z5*z7^6+
    2242*z2*z4*z5*z7^6+ 2242*z3*z4*z5*z7^6- 11*z4^2*z5*z7^6- 1121*z2*z3*z6*z7^6+
    2242*z2*z4*z6*z7^6+ 2242*z3*z4*z6*z7^6- 11*z4^2*z6*z7^6- 1121*z2*z5*z6*z7^6-
    1121*z3*z5*z6*z7^6+ 2242*z4*z5*z6*z7^6+ 3363*z2*z3*z7^7- 11*z2*z4*z7^7-
    11*z3*z4*z7^7- 1110*z4^2*z7^7+ 3363*z2*z5*z7^7+ 3363*z3*z5*z7^7-
    11*z4*z5*z7^7+ 3363*z2*z6*z7^7+ 3363*z3*z6*z7^7- 11*z4*z6*z7^7+
    3363*z5*z6*z7^7- 3374*z2*z7^8- 3374*z3*z7^8- 1110*z4*z7^8- 3374*z5*z7^8-
    3374*z6*z7^8+ 2264*z7^9+ 2740*z2*z3*z4^5+ 147*z2*z4^6+ 147*z3*z4^6+ 2604*z4^7+
    4495*z2*z3*z4^4*z5+ 2740*z2*z4^5*z5+ 2740*z3*z4^5*z5+ 147*z4^6*z5+
    4495*z2*z3*z4^4*z6+ 2740*z2*z4^5*z6+ 2740*z3*z4^5*z6+ 147*z4^6*z6+
    1755*z2*z3*z4^3*z5*z6+ 4495*z2*z4^4*z5*z6+ 4495*z3*z4^4*z5*z6+
    2740*z4^5*z5*z6- 1766*z2*z3*z4^4*z7+ 2887*z2*z4^5*z7+ 2887*z3*z4^5*z7+
    2751*z4^6*z7- 2751*z2*z3*z4^3*z5*z7- 1766*z2*z4^4*z5*z7- 1766*z3*z4^4*z5*z7+
    2887*z4^5*z5*z7- 2751*z2*z3*z4^3*z6*z7- 1766*z2*z4^4*z6*z7-
    1766*z3*z4^4*z6*z7+ 2887*z4^5*z6*z7- 2887*z2*z3*z4^2*z5*z6*z7-
    2751*z2*z4^3*z5*z6*z7- 2751*z3*z4^3*z5*z6*z7- 1766*z4^4*z5*z6*z7-
    1766*z2*z3*z4^3*z7^2+ 2887*z2*z4^4*z7^2+ 2887*z3*z4^4*z7^2+ 2751*z4^5*z7^2-
    2751*z2*z3*z4^2*z5*z7^2- 1766*z2*z4^3*z5*z7^2- 1766*z3*z4^3*z5*z7^2+
    2887*z4^4*z5*z7^2- 2751*z2*z3*z4^2*z6*z7^2- 1766*z2*z4^3*z6*z7^2-
    1766*z3*z4^3*z6*z7^2+ 2887*z4^4*z6*z7^2- 2887*z2*z3*z4*z5*z6*z7^2-
    2751*z2*z4^2*z5*z6*z7^2- 2751*z3*z4^2*z5*z6*z7^2- 1766*z4^3*z5*z6*z7^2-
    1766*z2*z3*z4^2*z7^3+ 2887*z2*z4^3*z7^3+ 2887*z3*z4^3*z7^3+ 2751*z4^4*z7^3-
    2751*z2*z3*z4*z5*z7^3- 1766*z2*z4^2*z5*z7^3- 1766*z3*z4^2*z5*z7^3+
    2887*z4^3*z5*z7^3- 2751*z2*z3*z4*z6*z7^3- 1766*z2*z4^2*z6*z7^3-
    1766*z3*z4^2*z6*z7^3+ 2887*z4^3*z6*z7^3+ 1755*z2*z3*z5*z6*z7^3-
    2751*z2*z4*z5*z6*z7^3- 2751*z3*z4*z5*z6*z7^3- 1766*z4^2*z5*z6*z7^3-
    1766*z2*z3*z4*z7^4+ 2887*z2*z4^2*z7^4+ 2887*z3*z4^2*z7^4+ 2751*z4^3*z7^4+
    4495*z2*z3*z5*z7^4- 1766*z2*z4*z5*z7^4- 1766*z3*z4*z5*z7^4+ 2887*z4^2*z5*z7^4+
    4495*z2*z3*z6*z7^4- 1766*z2*z4*z6*z7^4- 1766*z3*z4*z6*z7^4+ 2887*z4^2*z6*z7^4+
    4495*z2*z5*z6*z7^4+ 4495*z3*z5*z6*z7^4- 1766*z4*z5*z6*z7^4+ 2740*z2*z3*z7^5+
    2887*z2*z4*z7^5+ 2887*z3*z4*z7^5+ 2751*z4^2*z7^5+ 2740*z2*z5*z7^5+
    2740*z3*z5*z7^5+ 2887*z4*z5*z7^5+ 2740*z2*z6*z7^5+ 2740*z3*z6*z7^5+
    2887*z4*z6*z7^5+ 2740*z5*z6*z7^5+ 147*z2*z7^6+ 147*z3*z7^6+ 2751*z4*z7^6+
    147*z5*z7^6+ 147*z6*z7^6+ 2604*z7^7+ 3588*z2*z3*z4^3+ 318*z2*z4^4+
    318*z3*z4^4+ 2037*z4^5- 2988*z2*z3*z4^2*z5+ 3588*z2*z4^3*z5+ 3588*z3*z4^3*z5+
    318*z4^4*z5- 2988*z2*z3*z4^2*z6+ 3588*z2*z4^3*z6+ 3588*z3*z4^3*z6+
    318*z4^4*z6+ 633*z2*z3*z4*z5*z6- 2988*z2*z4^2*z5*z6- 2988*z3*z4^2*z5*z6+
    3588*z4^3*z5*z6+ 600*z2*z3*z4^2*z7+ 3906*z2*z4^3*z7+ 3906*z3*z4^3*z7+
    2355*z4^4*z7- 2355*z2*z3*z4*z5*z7+ 600*z2*z4^2*z5*z7+ 600*z3*z4^2*z5*z7+
    3906*z4^3*z5*z7- 2355*z2*z3*z4*z6*z7+ 600*z2*z4^2*z6*z7+ 600*z3*z4^2*z6*z7+
    3906*z4^3*z6*z7+ 633*z2*z3*z5*z6*z7- 2355*z2*z4*z5*z6*z7- 2355*z3*z4*z5*z6*z7+
    600*z4^2*z5*z6*z7+ 600*z2*z3*z4*z7^2+ 3906*z2*z4^2*z7^2+ 3906*z3*z4^2*z7^2+
    2355*z4^3*z7^2- 2988*z2*z3*z5*z7^2+ 600*z2*z4*z5*z7^2+ 600*z3*z4*z5*z7^2+
    3906*z4^2*z5*z7^2- 2988*z2*z3*z6*z7^2+ 600*z2*z4*z6*z7^2+ 600*z3*z4*z6*z7^2+
    3906*z4^2*z6*z7^2- 2988*z2*z5*z6*z7^2- 2988*z3*z5*z6*z7^2+ 600*z4*z5*z6*z7^2+
    3588*z2*z3*z7^3+ 3906*z2*z4*z7^3+ 3906*z3*z4*z7^3+ 2355*z4^2*z7^3+
    3588*z2*z5*z7^3+ 3588*z3*z5*z7^3+ 3906*z4*z5*z7^3+ 3588*z2*z6*z7^3+
    3588*z3*z6*z7^3+ 3906*z4*z6*z7^3+ 3588*z5*z6*z7^3+ 318*z2*z7^4+ 318*z3*z7^4+
    2355*z4*z7^4+ 318*z5*z7^4+ 318*z6*z7^4+ 2037*z7^5- 2202*z2*z3*z4-
    1776*z2*z4^2- 1776*z3*z4^2+ 2166*z4^3- 1068*z2*z3*z5- 2202*z2*z4*z5-
    2202*z3*z4*z5- 1776*z4^2*z5- 1068*z2*z3*z6- 2202*z2*z4*z6- 2202*z3*z4*z6-
    1776*z4^2*z6- 1068*z2*z5*z6- 1068*z3*z5*z6- 2202*z4*z5*z6- 2202*z2*z3*z7-
    3978*z2*z4*z7- 3978*z3*z4*z7+ 390*z4^2*z7- 2202*z2*z5*z7- 2202*z3*z5*z7-
    3978*z4*z5*z7- 2202*z2*z6*z7- 2202*z3*z6*z7- 3978*z4*z6*z7- 2202*z5*z6*z7-
    1776*z2*z7^2- 1776*z3*z7^2+ 390*z4*z7^2- 1776*z5*z7^2- 1776*z6*z7^2+
    2166*z7^3+ 3538*z2+ 3538*z3- 1169*z4+ 3538*z5+ 3538*z6- 1169*z7, -
    8*z2*z3*z4*z5^12+ 6*z2*z3*z5^13+ 6*z2*z4*z5^13+ 6*z3*z4*z5^13- 4*z2*z5^14-
    4*z3*z5^14- 4*z4*z5^14+ 2*z5^15+ 2*z2*z3*z4*z5^11*z6- 2*z2*z3*z5^12*z6-
    2*z2*z4*z5^12*z6- 2*z3*z4*z5^12*z6+ 2*z2*z5^13*z6+ 2*z3*z5^13*z6+
    2*z4*z5^13*z6- 2*z5^14*z6+ 2*z2*z3*z4*z5^10*z6^2- 2*z2*z3*z5^11*z6^2-
    2*z2*z4*z5^11*z6^2- 2*z3*z4*z5^11*z6^2+ 2*z2*z5^12*z6^2+ 2*z3*z5^12*z6^2+
    2*z4*z5^12*z6^2- 2*z5^13*z6^2+ 2*z2*z3*z4*z5^9*z6^3- 2*z2*z3*z5^10*z6^3-
    2*z2*z4*z5^10*z6^3- 2*z3*z4*z5^10*z6^3+ 2*z2*z5^11*z6^3+ 2*z3*z5^11*z6^3+
    2*z4*z5^11*z6^3- 2*z5^12*z6^3+ 2*z2*z3*z4*z5^8*z6^4- 2*z2*z3*z5^9*z6^4-
    2*z2*z4*z5^9*z6^4- 2*z3*z4*z5^9*z6^4+ 2*z2*z5^10*z6^4+ 2*z3*z5^10*z6^4+
    2*z4*z5^10*z6^4- 2*z5^11*z6^4+ 2*z2*z3*z4*z5^7*z6^5- 2*z2*z3*z5^8*z6^5-
    2*z2*z4*z5^8*z6^5- 2*z3*z4*z5^8*z6^5+ 2*z2*z5^9*z6^5+ 2*z3*z5^9*z6^5+
    2*z4*z5^9*z6^5- 2*z5^10*z6^5+ 2*z2*z3*z4*z5^6*z6^6- 2*z2*z3*z5^7*z6^6-
    2*z2*z4*z5^7*z6^6- 2*z3*z4*z5^7*z6^6+ 2*z2*z5^8*z6^6+ 2*z3*z5^8*z6^6+
    2*z4*z5^8*z6^6- 2*z5^9*z6^6+ 2*z2*z3*z4*z5^5*z6^7- 2*z2*z3*z5^6*z6^7-
    2*z2*z4*z5^6*z6^7- 2*z3*z4*z5^6*z6^7+ 2*z2*z5^7*z6^7+ 2*z3*z5^7*z6^7+
    2*z4*z5^7*z6^7- 2*z5^8*z6^7+ 2*z2*z3*z4*z5^4*z6^8- 2*z2*z3*z5^5*z6^8-
    2*z2*z4*z5^5*z6^8- 2*z3*z4*z5^5*z6^8+ 2*z2*z5^6*z6^8+ 2*z3*z5^6*z6^8+
    2*z4*z5^6*z6^8- 2*z5^7*z6^8+ 2*z2*z3*z4*z5^3*z6^9- 2*z2*z3*z5^4*z6^9-
    2*z2*z4*z5^4*z6^9- 2*z3*z4*z5^4*z6^9+ 2*z2*z5^5*z6^9+ 2*z3*z5^5*z6^9+
    2*z4*z5^5*z6^9- 2*z5^6*z6^9+ 2*z2*z3*z4*z5^2*z6^10- 2*z2*z3*z5^3*z6^10-
    2*z2*z4*z5^3*z6^10- 2*z3*z4*z5^3*z6^10+ 2*z2*z5^4*z6^10+ 2*z3*z5^4*z6^10+
    2*z4*z5^4*z6^10- 2*z5^5*z6^10+ 2*z2*z3*z4*z5*z6^11- 2*z2*z3*z5^2*z6^11-
    2*z2*z4*z5^2*z6^11- 2*z3*z4*z5^2*z6^11+ 2*z2*z5^3*z6^11+ 2*z3*z5^3*z6^11+
    2*z4*z5^3*z6^11- 2*z5^4*z6^11- 8*z2*z3*z4*z6^12- 2*z2*z3*z5*z6^12-
    2*z2*z4*z5*z6^12- 2*z3*z4*z5*z6^12+ 2*z2*z5^2*z6^12+ 2*z3*z5^2*z6^12+
    2*z4*z5^2*z6^12- 2*z5^3*z6^12+ 6*z2*z3*z6^13+ 6*z2*z4*z6^13+ 6*z3*z4*z6^13+
    2*z2*z5*z6^13+ 2*z3*z5*z6^13+ 2*z4*z5*z6^13- 2*z5^2*z6^13- 4*z2*z6^14-
    4*z3*z6^14- 4*z4*z6^14- 2*z5*z6^14+ 2*z6^15+ 10*z2*z3*z4*z5^11*z7-
    8*z2*z3*z5^12*z7- 8*z2*z4*z5^12*z7- 8*z3*z4*z5^12*z7+ 6*z2*z5^13*z7+
    6*z3*z5^13*z7+ 6*z4*z5^13*z7- 4*z5^14*z7- 2*z2*z3*z4*z5^10*z6*z7+
    2*z2*z3*z5^11*z6*z7+ 2*z2*z4*z5^11*z6*z7+ 2*z3*z4*z5^11*z6*z7-
    2*z2*z5^12*z6*z7- 2*z3*z5^12*z6*z7- 2*z4*z5^12*z6*z7+ 2*z5^13*z6*z7-
    2*z2*z3*z4*z5^9*z6^2*z7+ 2*z2*z3*z5^10*z6^2*z7+ 2*z2*z4*z5^10*z6^2*z7+
    2*z3*z4*z5^10*z6^2*z7- 2*z2*z5^11*z6^2*z7- 2*z3*z5^11*z6^2*z7-
    2*z4*z5^11*z6^2*z7+ 2*z5^12*z6^2*z7- 2*z2*z3*z4*z5^8*z6^3*z7+
    2*z2*z3*z5^9*z6^3*z7+ 2*z2*z4*z5^9*z6^3*z7+ 2*z3*z4*z5^9*z6^3*z7-
    2*z2*z5^10*z6^3*z7- 2*z3*z5^10*z6^3*z7- 2*z4*z5^10*z6^3*z7+ 2*z5^11*z6^3*z7-
    2*z2*z3*z4*z5^7*z6^4*z7+ 2*z2*z3*z5^8*z6^4*z7+ 2*z2*z4*z5^8*z6^4*z7+
    2*z3*z4*z5^8*z6^4*z7- 2*z2*z5^9*z6^4*z7- 2*z3*z5^9*z6^4*z7- 2*z4*z5^9*z6^4*z7+
    2*z5^10*z6^4*z7- 2*z2*z3*z4*z5^6*z6^5*z7+ 2*z2*z3*z5^7*z6^5*z7+
    2*z2*z4*z5^7*z6^5*z7+ 2*z3*z4*z5^7*z6^5*z7- 2*z2*z5^8*z6^5*z7-
    2*z3*z5^8*z6^5*z7- 2*z4*z5^8*z6^5*z7+ 2*z5^9*z6^5*z7- 2*z2*z3*z4*z5^5*z6^6*z7+
    2*z2*z3*z5^6*z6^6*z7+ 2*z2*z4*z5^6*z6^6*z7+ 2*z3*z4*z5^6*z6^6*z7-
    2*z2*z5^7*z6^6*z7- 2*z3*z5^7*z6^6*z7- 2*z4*z5^7*z6^6*z7+ 2*z5^8*z6^6*z7-
    2*z2*z3*z4*z5^4*z6^7*z7+ 2*z2*z3*z5^5*z6^7*z7+ 2*z2*z4*z5^5*z6^7*z7+
    2*z3*z4*z5^5*z6^7*z7- 2*z2*z5^6*z6^7*z7- 2*z3*z5^6*z6^7*z7- 2*z4*z5^6*z6^7*z7+
    2*z5^7*z6^7*z7- 2*z2*z3*z4*z5^3*z6^8*z7+ 2*z2*z3*z5^4*z6^8*z7+
    2*z2*z4*z5^4*z6^8*z7+ 2*z3*z4*z5^4*z6^8*z7- 2*z2*z5^5*z6^8*z7-
    2*z3*z5^5*z6^8*z7- 2*z4*z5^5*z6^8*z7+ 2*z5^6*z6^8*z7- 2*z2*z3*z4*z5^2*z6^9*z7+
    2*z2*z3*z5^3*z6^9*z7+ 2*z2*z4*z5^3*z6^9*z7+ 2*z3*z4*z5^3*z6^9*z7-
    2*z2*z5^4*z6^9*z7- 2*z3*z5^4*z6^9*z7- 2*z4*z5^4*z6^9*z7+ 2*z5^5*z6^9*z7-
    2*z2*z3*z4*z5*z6^10*z7+ 2*z2*z3*z5^2*z6^10*z7+ 2*z2*z4*z5^2*z6^10*z7+
    2*z3*z4*z5^2*z6^10*z7- 2*z2*z5^3*z6^10*z7- 2*z3*z5^3*z6^10*z7-
    2*z4*z5^3*z6^10*z7+ 2*z5^4*z6^10*z7+ 10*z2*z3*z4*z6^11*z7+
    2*z2*z3*z5*z6^11*z7+ 2*z2*z4*z5*z6^11*z7+ 2*z3*z4*z5*z6^11*z7-
    2*z2*z5^2*z6^11*z7- 2*z3*z5^2*z6^11*z7- 2*z4*z5^2*z6^11*z7+ 2*z5^3*z6^11*z7-
    8*z2*z3*z6^12*z7- 8*z2*z4*z6^12*z7- 8*z3*z4*z6^12*z7- 2*z2*z5*z6^12*z7-
    2*z3*z5*z6^12*z7- 2*z4*z5*z6^12*z7+ 2*z5^2*z6^12*z7+ 6*z2*z6^13*z7+
    6*z3*z6^13*z7+ 6*z4*z6^13*z7+ 2*z5*z6^13*z7- 4*z6^14*z7+ z2*z3*z4*z5^10+
    10*z2*z3*z5^11+ 10*z2*z4*z5^11+ 10*z3*z4*z5^11- 13*z2*z5^12- 13*z3*z5^12-
    13*z4*z5^12+ 10*z5^13- 21*z2*z3*z4*z5^9*z6+ 11*z2*z3*z5^10*z6+
    11*z2*z4*z5^10*z6+ 11*z3*z4*z5^10*z6- 3*z2*z5^11*z6- 3*z3*z5^11*z6-
    3*z4*z5^11*z6- 3*z5^12*z6- 21*z2*z3*z4*z5^8*z6^2+ 11*z2*z3*z5^9*z6^2+
    11*z2*z4*z5^9*z6^2+ 11*z3*z4*z5^9*z6^2- 3*z2*z5^10*z6^2- 3*z3*z5^10*z6^2-
    3*z4*z5^10*z6^2- 3*z5^11*z6^2- 21*z2*z3*z4*z5^7*z6^3+ 11*z2*z3*z5^8*z6^3+
    11*z2*z4*z5^8*z6^3+ 11*z3*z4*z5^8*z6^3- 3*z2*z5^9*z6^3- 3*z3*z5^9*z6^3-
    3*z4*z5^9*z6^3- 3*z5^10*z6^3- 21*z2*z3*z4*z5^6*z6^4+ 11*z2*z3*z5^7*z6^4+
    11*z2*z4*z5^7*z6^4+ 11*z3*z4*z5^7*z6^4- 3*z2*z5^8*z6^4- 3*z3*z5^8*z6^4-
    3*z4*z5^8*z6^4- 3*z5^9*z6^4- 21*z2*z3*z4*z5^5*z6^5+ 11*z2*z3*z5^6*z6^5+
    11*z2*z4*z5^6*z6^5+ 11*z3*z4*z5^6*z6^5- 3*z2*z5^7*z6^5- 3*z3*z5^7*z6^5-
    3*z4*z5^7*z6^5- 3*z5^8*z6^5- 21*z2*z3*z4*z5^4*z6^6+ 11*z2*z3*z5^5*z6^6+
    11*z2*z4*z5^5*z6^6+ 11*z3*z4*z5^5*z6^6- 3*z2*z5^6*z6^6- 3*z3*z5^6*z6^6-
    3*z4*z5^6*z6^6- 3*z5^7*z6^6- 21*z2*z3*z4*z5^3*z6^7+ 11*z2*z3*z5^4*z6^7+
    11*z2*z4*z5^4*z6^7+ 11*z3*z4*z5^4*z6^7- 3*z2*z5^5*z6^7- 3*z3*z5^5*z6^7-
    3*z4*z5^5*z6^7- 3*z5^6*z6^7- 21*z2*z3*z4*z5^2*z6^8+ 11*z2*z3*z5^3*z6^8+
    11*z2*z4*z5^3*z6^8+ 11*z3*z4*z5^3*z6^8- 3*z2*z5^4*z6^8- 3*z3*z5^4*z6^8-
    3*z4*z5^4*z6^8- 3*z5^5*z6^8- 21*z2*z3*z4*z5*z6^9+ 11*z2*z3*z5^2*z6^9+
    11*z2*z4*z5^2*z6^9+ 11*z3*z4*z5^2*z6^9- 3*z2*z5^3*z6^9- 3*z3*z5^3*z6^9-
    3*z4*z5^3*z6^9- 3*z5^4*z6^9+ z2*z3*z4*z6^10+ 11*z2*z3*z5*z6^10+
    11*z2*z4*z5*z6^10+ 11*z3*z4*z5*z6^10- 3*z2*z5^2*z6^10- 3*z3*z5^2*z6^10-
    3*z4*z5^2*z6^10- 3*z5^3*z6^10+ 10*z2*z3*z6^11+ 10*z2*z4*z6^11+ 10*z3*z4*z6^11-
    3*z2*z5*z6^11- 3*z3*z5*z6^11- 3*z4*z5*z6^11- 3*z5^2*z6^11- 13*z2*z6^12-
    13*z3*z6^12- 13*z4*z6^12- 3*z5*z6^12+ 10*z6^13- 22*z2*z3*z4*z5^9*z7+
    z2*z3*z5^10*z7+ z2*z4*z5^10*z7+ z3*z4*z5^10*z7+ 10*z2*z5^11*z7+
    10*z3*z5^11*z7+ 10*z4*z5^11*z7- 13*z5^12*z7+ 33*z2*z3*z4*z5^8*z6*z7-
    21*z2*z3*z5^9*z6*z7- 21*z2*z4*z5^9*z6*z7- 21*z3*z4*z5^9*z6*z7+
    11*z2*z5^10*z6*z7+ 11*z3*z5^10*z6*z7+ 11*z4*z5^10*z6*z7- 3*z5^11*z6*z7+
    33*z2*z3*z4*z5^7*z6^2*z7- 21*z2*z3*z5^8*z6^2*z7- 21*z2*z4*z5^8*z6^2*z7-
    21*z3*z4*z5^8*z6^2*z7+ 11*z2*z5^9*z6^2*z7+ 11*z3*z5^9*z6^2*z7+
    11*z4*z5^9*z6^2*z7- 3*z5^10*z6^2*z7+ 33*z2*z3*z4*z5^6*z6^3*z7-
    21*z2*z3*z5^7*z6^3*z7- 21*z2*z4*z5^7*z6^3*z7- 21*z3*z4*z5^7*z6^3*z7+
    11*z2*z5^8*z6^3*z7+ 11*z3*z5^8*z6^3*z7+ 11*z4*z5^8*z6^3*z7- 3*z5^9*z6^3*z7+
    33*z2*z3*z4*z5^5*z6^4*z7- 21*z2*z3*z5^6*z6^4*z7- 21*z2*z4*z5^6*z6^4*z7-
    21*z3*z4*z5^6*z6^4*z7+ 11*z2*z5^7*z6^4*z7+ 11*z3*z5^7*z6^4*z7+
    11*z4*z5^7*z6^4*z7- 3*z5^8*z6^4*z7+ 33*z2*z3*z4*z5^4*z6^5*z7-
    21*z2*z3*z5^5*z6^5*z7- 21*z2*z4*z5^5*z6^5*z7- 21*z3*z4*z5^5*z6^5*z7+
    11*z2*z5^6*z6^5*z7+ 11*z3*z5^6*z6^5*z7+ 11*z4*z5^6*z6^5*z7- 3*z5^7*z6^5*z7+
    33*z2*z3*z4*z5^3*z6^6*z7- 21*z2*z3*z5^4*z6^6*z7- 21*z2*z4*z5^4*z6^6*z7-
    21*z3*z4*z5^4*z6^6*z7+ 11*z2*z5^5*z6^6*z7+ 11*z3*z5^5*z6^6*z7+
    11*z4*z5^5*z6^6*z7- 3*z5^6*z6^6*z7+ 33*z2*z3*z4*z5^2*z6^7*z7-
    21*z2*z3*z5^3*z6^7*z7- 21*z2*z4*z5^3*z6^7*z7- 21*z3*z4*z5^3*z6^7*z7+
    11*z2*z5^4*z6^7*z7+ 11*z3*z5^4*z6^7*z7+ 11*z4*z5^4*z6^7*z7- 3*z5^5*z6^7*z7+
    33*z2*z3*z4*z5*z6^8*z7- 21*z2*z3*z5^2*z6^8*z7- 21*z2*z4*z5^2*z6^8*z7-
    21*z3*z4*z5^2*z6^8*z7+ 11*z2*z5^3*z6^8*z7+ 11*z3*z5^3*z6^8*z7+
    11*z4*z5^3*z6^8*z7- 3*z5^4*z6^8*z7- 22*z2*z3*z4*z6^9*z7- 21*z2*z3*z5*z6^9*z7-
    21*z2*z4*z5*z6^9*z7- 21*z3*z4*z5*z6^9*z7+ 11*z2*z5^2*z6^9*z7+
    11*z3*z5^2*z6^9*z7+ 11*z4*z5^2*z6^9*z7- 3*z5^3*z6^9*z7+ z2*z3*z6^10*z7+
    z2*z4*z6^10*z7+ z3*z4*z6^10*z7+ 11*z2*z5*z6^10*z7+ 11*z3*z5*z6^10*z7+
    11*z4*z5*z6^10*z7- 3*z5^2*z6^10*z7+ 10*z2*z6^11*z7+ 10*z3*z6^11*z7+
    10*z4*z6^11*z7- 3*z5*z6^11*z7- 13*z6^12*z7- 2231*z2*z3*z4*z5^8+
    1121*z2*z3*z5^9+ 1121*z2*z4*z5^9+ 1121*z3*z4*z5^9- 12*z2*z5^10- 12*z3*z5^10-
    12*z4*z5^10- 1107*z5^11+ 1132*z2*z3*z4*z5^7*z6- 1110*z2*z3*z5^8*z6-
    1110*z2*z4*z5^8*z6- 1110*z3*z4*z5^8*z6+ 1109*z2*z5^9*z6+ 1109*z3*z5^9*z6+
    1109*z4*z5^9*z6- 1119*z5^10*z6+ 1132*z2*z3*z4*z5^6*z6^2- 1110*z2*z3*z5^7*z6^2-
    1110*z2*z4*z5^7*z6^2- 1110*z3*z4*z5^7*z6^2+ 1109*z2*z5^8*z6^2+
    1109*z3*z5^8*z6^2+ 1109*z4*z5^8*z6^2- 1119*z5^9*z6^2+ 1132*z2*z3*z4*z5^5*z6^3-
    1110*z2*z3*z5^6*z6^3- 1110*z2*z4*z5^6*z6^3- 1110*z3*z4*z5^6*z6^3+
    1109*z2*z5^7*z6^3+ 1109*z3*z5^7*z6^3+ 1109*z4*z5^7*z6^3- 1119*z5^8*z6^3+
    1132*z2*z3*z4*z5^4*z6^4- 1110*z2*z3*z5^5*z6^4- 1110*z2*z4*z5^5*z6^4-
    1110*z3*z4*z5^5*z6^4+ 1109*z2*z5^6*z6^4+ 1109*z3*z5^6*z6^4+ 1109*z4*z5^6*z6^4-
    1119*z5^7*z6^4+ 1132*z2*z3*z4*z5^3*z6^5- 1110*z2*z3*z5^4*z6^5-
    1110*z2*z4*z5^4*z6^5- 1110*z3*z4*z5^4*z6^5+ 1109*z2*z5^5*z6^5+
    1109*z3*z5^5*z6^5+ 1109*z4*z5^5*z6^5- 1119*z5^6*z6^5+ 1132*z2*z3*z4*z5^2*z6^6-
    1110*z2*z3*z5^3*z6^6- 1110*z2*z4*z5^3*z6^6- 1110*z3*z4*z5^3*z6^6+
    1109*z2*z5^4*z6^6+ 1109*z3*z5^4*z6^6+ 1109*z4*z5^4*z6^6- 1119*z5^5*z6^6+
    1132*z2*z3*z4*z5*z6^7- 1110*z2*z3*z5^2*z6^7- 1110*z2*z4*z5^2*z6^7-
    1110*z3*z4*z5^2*z6^7+ 1109*z2*z5^3*z6^7+ 1109*z3*z5^3*z6^7+ 1109*z4*z5^3*z6^7-
    1119*z5^4*z6^7- 2231*z2*z3*z4*z6^8- 1110*z2*z3*z5*z6^8- 1110*z2*z4*z5*z6^8-
    1110*z3*z4*z5*z6^8+ 1109*z2*z5^2*z6^8+ 1109*z3*z5^2*z6^8+ 1109*z4*z5^2*z6^8-
    1119*z5^3*z6^8+ 1121*z2*z3*z6^9+ 1121*z2*z4*z6^9+ 1121*z3*z4*z6^9+
    1109*z2*z5*z6^9+ 1109*z3*z5*z6^9+ 1109*z4*z5*z6^9- 1119*z5^2*z6^9-
    12*z2*z6^10- 12*z3*z6^10- 12*z4*z6^10- 1119*z5*z6^10- 1107*z6^11+
    3363*z2*z3*z4*z5^7*z7- 2231*z2*z3*z5^8*z7- 2231*z2*z4*z5^8*z7-
    2231*z3*z4*z5^8*z7+ 1121*z2*z5^9*z7+ 1121*z3*z5^9*z7+ 1121*z4*z5^9*z7-
    12*z5^10*z7- 1187*z2*z3*z4*z5^6*z6*z7+ 1132*z2*z3*z5^7*z6*z7+
    1132*z2*z4*z5^7*z6*z7+ 1132*z3*z4*z5^7*z6*z7- 1110*z2*z5^8*z6*z7-
    1110*z3*z5^8*z6*z7- 1110*z4*z5^8*z6*z7+ 1109*z5^9*z6*z7-
    1187*z2*z3*z4*z5^5*z6^2*z7+ 1132*z2*z3*z5^6*z6^2*z7+ 1132*z2*z4*z5^6*z6^2*z7+
    1132*z3*z4*z5^6*z6^2*z7- 1110*z2*z5^7*z6^2*z7- 1110*z3*z5^7*z6^2*z7-
    1110*z4*z5^7*z6^2*z7+ 1109*z5^8*z6^2*z7- 1187*z2*z3*z4*z5^4*z6^3*z7+
    1132*z2*z3*z5^5*z6^3*z7+ 1132*z2*z4*z5^5*z6^3*z7+ 1132*z3*z4*z5^5*z6^3*z7-
    1110*z2*z5^6*z6^3*z7- 1110*z3*z5^6*z6^3*z7- 1110*z4*z5^6*z6^3*z7+
    1109*z5^7*z6^3*z7- 1187*z2*z3*z4*z5^3*z6^4*z7+ 1132*z2*z3*z5^4*z6^4*z7+
    1132*z2*z4*z5^4*z6^4*z7+ 1132*z3*z4*z5^4*z6^4*z7- 1110*z2*z5^5*z6^4*z7-
    1110*z3*z5^5*z6^4*z7- 1110*z4*z5^5*z6^4*z7+ 1109*z5^6*z6^4*z7-
    1187*z2*z3*z4*z5^2*z6^5*z7+ 1132*z2*z3*z5^3*z6^5*z7+ 1132*z2*z4*z5^3*z6^5*z7+
    1132*z3*z4*z5^3*z6^5*z7- 1110*z2*z5^4*z6^5*z7- 1110*z3*z5^4*z6^5*z7-
    1110*z4*z5^4*z6^5*z7+ 1109*z5^5*z6^5*z7- 1187*z2*z3*z4*z5*z6^6*z7+
    1132*z2*z3*z5^2*z6^6*z7+ 1132*z2*z4*z5^2*z6^6*z7+ 1132*z3*z4*z5^2*z6^6*z7-
    1110*z2*z5^3*z6^6*z7- 1110*z3*z5^3*z6^6*z7- 1110*z4*z5^3*z6^6*z7+
    1109*z5^4*z6^6*z7+ 3363*z2*z3*z4*z6^7*z7+ 1132*z2*z3*z5*z6^7*z7+
    1132*z2*z4*z5*z6^7*z7+ 1132*z3*z4*z5*z6^7*z7- 1110*z2*z5^2*z6^7*z7-
    1110*z3*z5^2*z6^7*z7- 1110*z4*z5^2*z6^7*z7+ 1109*z5^3*z6^7*z7-
    2231*z2*z3*z6^8*z7- 2231*z2*z4*z6^8*z7- 2231*z3*z4*z6^8*z7-
    1110*z2*z5*z6^8*z7- 1110*z3*z5*z6^8*z7- 1110*z4*z5*z6^8*z7+ 1109*z5^2*z6^8*z7+
    1121*z2*z6^9*z7+ 1121*z3*z6^9*z7+ 1121*z4*z6^9*z7+ 1109*z5*z6^9*z7-
    12*z6^10*z7- 1121*z2*z3*z4*z5^6+ 3363*z2*z3*z5^7+ 3363*z2*z4*z5^7+
    3363*z3*z4*z5^7- 3374*z2*z5^8- 3374*z3*z5^8- 3374*z4*z5^8+ 2264*z5^9+
    3396*z2*z3*z4*z5^5*z6+ 2242*z2*z3*z5^6*z6+ 2242*z2*z4*z5^6*z6+
    2242*z3*z4*z5^6*z6- 11*z2*z5^7*z6- 11*z3*z5^7*z6- 11*z4*z5^7*z6- 1110*z5^8*z6+
    3396*z2*z3*z4*z5^4*z6^2+ 2242*z2*z3*z5^5*z6^2+ 2242*z2*z4*z5^5*z6^2+
    2242*z3*z4*z5^5*z6^2- 11*z2*z5^6*z6^2- 11*z3*z5^6*z6^2- 11*z4*z5^6*z6^2-
    1110*z5^7*z6^2+ 3396*z2*z3*z4*z5^3*z6^3+ 2242*z2*z3*z5^4*z6^3+
    2242*z2*z4*z5^4*z6^3+ 2242*z3*z4*z5^4*z6^3- 11*z2*z5^5*z6^3- 11*z3*z5^5*z6^3-
    11*z4*z5^5*z6^3- 1110*z5^6*z6^3+ 3396*z2*z3*z4*z5^2*z6^4+
    2242*z2*z3*z5^3*z6^4+ 2242*z2*z4*z5^3*z6^4+ 2242*z3*z4*z5^3*z6^4-
    11*z2*z5^4*z6^4- 11*z3*z5^4*z6^4- 11*z4*z5^4*z6^4- 1110*z5^5*z6^4+
    3396*z2*z3*z4*z5*z6^5+ 2242*z2*z3*z5^2*z6^5+ 2242*z2*z4*z5^2*z6^5+
    2242*z3*z4*z5^2*z6^5- 11*z2*z5^3*z6^5- 11*z3*z5^3*z6^5- 11*z4*z5^3*z6^5-
    1110*z5^4*z6^5- 1121*z2*z3*z4*z6^6+ 2242*z2*z3*z5*z6^6+ 2242*z2*z4*z5*z6^6+
    2242*z3*z4*z5*z6^6- 11*z2*z5^2*z6^6- 11*z3*z5^2*z6^6- 11*z4*z5^2*z6^6-
    1110*z5^3*z6^6+ 3363*z2*z3*z6^7+ 3363*z2*z4*z6^7+ 3363*z3*z4*z6^7-
    11*z2*z5*z6^7- 11*z3*z5*z6^7- 11*z4*z5*z6^7- 1110*z5^2*z6^7- 3374*z2*z6^8-
    3374*z3*z6^8- 3374*z4*z6^8- 1110*z5*z6^8+ 2264*z6^9- 4484*z2*z3*z4*z5^5*z7-
    1121*z2*z3*z5^6*z7- 1121*z2*z4*z5^6*z7- 1121*z3*z4*z5^6*z7+ 3363*z2*z5^7*z7+
    3363*z3*z5^7*z7+ 3363*z4*z5^7*z7- 3374*z5^8*z7+ 1154*z2*z3*z4*z5^4*z6*z7+
    3396*z2*z3*z5^5*z6*z7+ 3396*z2*z4*z5^5*z6*z7+ 3396*z3*z4*z5^5*z6*z7+
    2242*z2*z5^6*z6*z7+ 2242*z3*z5^6*z6*z7+ 2242*z4*z5^6*z6*z7- 11*z5^7*z6*z7+
    1154*z2*z3*z4*z5^3*z6^2*z7+ 3396*z2*z3*z5^4*z6^2*z7+ 3396*z2*z4*z5^4*z6^2*z7+
    3396*z3*z4*z5^4*z6^2*z7+ 2242*z2*z5^5*z6^2*z7+ 2242*z3*z5^5*z6^2*z7+
    2242*z4*z5^5*z6^2*z7- 11*z5^6*z6^2*z7+ 1154*z2*z3*z4*z5^2*z6^3*z7+
    3396*z2*z3*z5^3*z6^3*z7+ 3396*z2*z4*z5^3*z6^3*z7+ 3396*z3*z4*z5^3*z6^3*z7+
    2242*z2*z5^4*z6^3*z7+ 2242*z3*z5^4*z6^3*z7+ 2242*z4*z5^4*z6^3*z7-
    11*z5^5*z6^3*z7+ 1154*z2*z3*z4*z5*z6^4*z7+ 3396*z2*z3*z5^2*z6^4*z7+
    3396*z2*z4*z5^2*z6^4*z7+ 3396*z3*z4*z5^2*z6^4*z7+ 2242*z2*z5^3*z6^4*z7+
    2242*z3*z5^3*z6^4*z7+ 2242*z4*z5^3*z6^4*z7- 11*z5^4*z6^4*z7-
    4484*z2*z3*z4*z6^5*z7+ 3396*z2*z3*z5*z6^5*z7+ 3396*z2*z4*z5*z6^5*z7+
    3396*z3*z4*z5*z6^5*z7+ 2242*z2*z5^2*z6^5*z7+ 2242*z3*z5^2*z6^5*z7+
    2242*z4*z5^2*z6^5*z7- 11*z5^3*z6^5*z7- 1121*z2*z3*z6^6*z7- 1121*z2*z4*z6^6*z7-
    1121*z3*z4*z6^6*z7+ 2242*z2*z5*z6^6*z7+ 2242*z3*z5*z6^6*z7+
    2242*z4*z5*z6^6*z7- 11*z5^2*z6^6*z7+ 3363*z2*z6^7*z7+ 3363*z3*z6^7*z7+
    3363*z4*z6^7*z7- 11*z5*z6^7*z7- 3374*z6^8*z7+ 4495*z2*z3*z4*z5^4+
    2740*z2*z3*z5^5+ 2740*z2*z4*z5^5+ 2740*z3*z4*z5^5+ 147*z2*z5^6+ 147*z3*z5^6+
    147*z4*z5^6+ 2604*z5^7- 2751*z2*z3*z4*z5^3*z6- 1766*z2*z3*z5^4*z6-
    1766*z2*z4*z5^4*z6- 1766*z3*z4*z5^4*z6+ 2887*z2*z5^5*z6+ 2887*z3*z5^5*z6+
    2887*z4*z5^5*z6+ 2751*z5^6*z6- 2751*z2*z3*z4*z5^2*z6^2- 1766*z2*z3*z5^3*z6^2-
    1766*z2*z4*z5^3*z6^2- 1766*z3*z4*z5^3*z6^2+ 2887*z2*z5^4*z6^2+
    2887*z3*z5^4*z6^2+ 2887*z4*z5^4*z6^2+ 2751*z5^5*z6^2- 2751*z2*z3*z4*z5*z6^3-
    1766*z2*z3*z5^2*z6^3- 1766*z2*z4*z5^2*z6^3- 1766*z3*z4*z5^2*z6^3+
    2887*z2*z5^3*z6^3+ 2887*z3*z5^3*z6^3+ 2887*z4*z5^3*z6^3+ 2751*z5^4*z6^3+
    4495*z2*z3*z4*z6^4- 1766*z2*z3*z5*z6^4- 1766*z2*z4*z5*z6^4-
    1766*z3*z4*z5*z6^4+ 2887*z2*z5^2*z6^4+ 2887*z3*z5^2*z6^4+ 2887*z4*z5^2*z6^4+
    2751*z5^3*z6^4+ 2740*z2*z3*z6^5+ 2740*z2*z4*z6^5+ 2740*z3*z4*z6^5+
    2887*z2*z5*z6^5+ 2887*z3*z5*z6^5+ 2887*z4*z5*z6^5+ 2751*z5^2*z6^5+
    147*z2*z6^6+ 147*z3*z6^6+ 147*z4*z6^6+ 2751*z5*z6^6+ 2604*z6^7+
    1755*z2*z3*z4*z5^3*z7+ 4495*z2*z3*z5^4*z7+ 4495*z2*z4*z5^4*z7+
    4495*z3*z4*z5^4*z7+ 2740*z2*z5^5*z7+ 2740*z3*z5^5*z7+ 2740*z4*z5^5*z7+
    147*z5^6*z7- 2887*z2*z3*z4*z5^2*z6*z7- 2751*z2*z3*z5^3*z6*z7-
    2751*z2*z4*z5^3*z6*z7- 2751*z3*z4*z5^3*z6*z7- 1766*z2*z5^4*z6*z7-
    1766*z3*z5^4*z6*z7- 1766*z4*z5^4*z6*z7+ 2887*z5^5*z6*z7-
    2887*z2*z3*z4*z5*z6^2*z7- 2751*z2*z3*z5^2*z6^2*z7- 2751*z2*z4*z5^2*z6^2*z7-
    2751*z3*z4*z5^2*z6^2*z7- 1766*z2*z5^3*z6^2*z7- 1766*z3*z5^3*z6^2*z7-
    1766*z4*z5^3*z6^2*z7+ 2887*z5^4*z6^2*z7+ 1755*z2*z3*z4*z6^3*z7-
    2751*z2*z3*z5*z6^3*z7- 2751*z2*z4*z5*z6^3*z7- 2751*z3*z4*z5*z6^3*z7-
    1766*z2*z5^2*z6^3*z7- 1766*z3*z5^2*z6^3*z7- 1766*z4*z5^2*z6^3*z7+
    2887*z5^3*z6^3*z7+ 4495*z2*z3*z6^4*z7+ 4495*z2*z4*z6^4*z7+ 4495*z3*z4*z6^4*z7-
    1766*z2*z5*z6^4*z7- 1766*z3*z5*z6^4*z7- 1766*z4*z5*z6^4*z7+ 2887*z5^2*z6^4*z7+
    2740*z2*z6^5*z7+ 2740*z3*z6^5*z7+ 2740*z4*z6^5*z7+ 2887*z5*z6^5*z7+
    147*z6^6*z7- 2988*z2*z3*z4*z5^2+ 3588*z2*z3*z5^3+ 3588*z2*z4*z5^3+
    3588*z3*z4*z5^3+ 318*z2*z5^4+ 318*z3*z5^4+ 318*z4*z5^4+ 2037*z5^5-
    2355*z2*z3*z4*z5*z6+ 600*z2*z3*z5^2*z6+ 600*z2*z4*z5^2*z6+ 600*z3*z4*z5^2*z6+
    3906*z2*z5^3*z6+ 3906*z3*z5^3*z6+ 3906*z4*z5^3*z6+ 2355*z5^4*z6-
    2988*z2*z3*z4*z6^2+ 600*z2*z3*z5*z6^2+ 600*z2*z4*z5*z6^2+ 600*z3*z4*z5*z6^2+
    3906*z2*z5^2*z6^2+ 3906*z3*z5^2*z6^2+ 3906*z4*z5^2*z6^2+ 2355*z5^3*z6^2+
    3588*z2*z3*z6^3+ 3588*z2*z4*z6^3+ 3588*z3*z4*z6^3+ 3906*z2*z5*z6^3+
    3906*z3*z5*z6^3+ 3906*z4*z5*z6^3+ 2355*z5^2*z6^3+ 318*z2*z6^4+ 318*z3*z6^4+
    318*z4*z6^4+ 2355*z5*z6^4+ 2037*z6^5+ 633*z2*z3*z4*z5*z7- 2988*z2*z3*z5^2*z7-
    2988*z2*z4*z5^2*z7- 2988*z3*z4*z5^2*z7+ 3588*z2*z5^3*z7+ 3588*z3*z5^3*z7+
    3588*z4*z5^3*z7+ 318*z5^4*z7+ 633*z2*z3*z4*z6*z7- 2355*z2*z3*z5*z6*z7-
    2355*z2*z4*z5*z6*z7- 2355*z3*z4*z5*z6*z7+ 600*z2*z5^2*z6*z7+
    600*z3*z5^2*z6*z7+ 600*z4*z5^2*z6*z7+ 3906*z5^3*z6*z7- 2988*z2*z3*z6^2*z7-
    2988*z2*z4*z6^2*z7- 2988*z3*z4*z6^2*z7+ 600*z2*z5*z6^2*z7+ 600*z3*z5*z6^2*z7+
    600*z4*z5*z6^2*z7+ 3906*z5^2*z6^2*z7+ 3588*z2*z6^3*z7+ 3588*z3*z6^3*z7+
    3588*z4*z6^3*z7+ 3906*z5*z6^3*z7+ 318*z6^4*z7- 1068*z2*z3*z4- 2202*z2*z3*z5-
    2202*z2*z4*z5- 2202*z3*z4*z5- 1776*z2*z5^2- 1776*z3*z5^2- 1776*z4*z5^2+
    2166*z5^3- 2202*z2*z3*z6- 2202*z2*z4*z6- 2202*z3*z4*z6- 3978*z2*z5*z6-
    3978*z3*z5*z6- 3978*z4*z5*z6+ 390*z5^2*z6- 1776*z2*z6^2- 1776*z3*z6^2-
    1776*z4*z6^2+ 390*z5*z6^2+ 2166*z6^3- 1068*z2*z3*z7- 1068*z2*z4*z7-
    1068*z3*z4*z7- 2202*z2*z5*z7- 2202*z3*z5*z7- 2202*z4*z5*z7- 1776*z5^2*z7-
    2202*z2*z6*z7- 2202*z3*z6*z7- 2202*z4*z6*z7- 3978*z5*z6*z7- 1776*z6^2*z7+
    3538*z2+ 3538*z3+ 3538*z4- 1169*z5- 1169*z6+ 3538*z7, - 8*z2*z3*z4*z5^12+
    6*z2*z3*z5^13+ 6*z2*z4*z5^13+ 6*z3*z4*z5^13- 4*z2*z5^14- 4*z3*z5^14-
    4*z4*z5^14+ 2*z5^15+ 10*z2*z3*z4*z5^11*z6- 8*z2*z3*z5^12*z6- 8*z2*z4*z5^12*z6-
    8*z3*z4*z5^12*z6+ 6*z2*z5^13*z6+ 6*z3*z5^13*z6+ 6*z4*z5^13*z6- 4*z5^14*z6+
    2*z2*z3*z4*z5^11*z7- 2*z2*z3*z5^12*z7- 2*z2*z4*z5^12*z7- 2*z3*z4*z5^12*z7+
    2*z2*z5^13*z7+ 2*z3*z5^13*z7+ 2*z4*z5^13*z7- 2*z5^14*z7-
    2*z2*z3*z4*z5^10*z6*z7+ 2*z2*z3*z5^11*z6*z7+ 2*z2*z4*z5^11*z6*z7+
    2*z3*z4*z5^11*z6*z7- 2*z2*z5^12*z6*z7- 2*z3*z5^12*z6*z7- 2*z4*z5^12*z6*z7+
    2*z5^13*z6*z7+ 2*z2*z3*z4*z5^10*z7^2- 2*z2*z3*z5^11*z7^2- 2*z2*z4*z5^11*z7^2-
    2*z3*z4*z5^11*z7^2+ 2*z2*z5^12*z7^2+ 2*z3*z5^12*z7^2+ 2*z4*z5^12*z7^2-
    2*z5^13*z7^2- 2*z2*z3*z4*z5^9*z6*z7^2+ 2*z2*z3*z5^10*z6*z7^2+
    2*z2*z4*z5^10*z6*z7^2+ 2*z3*z4*z5^10*z6*z7^2- 2*z2*z5^11*z6*z7^2-
    2*z3*z5^11*z6*z7^2- 2*z4*z5^11*z6*z7^2+ 2*z5^12*z6*z7^2+ 2*z2*z3*z4*z5^9*z7^3-
    2*z2*z3*z5^10*z7^3- 2*z2*z4*z5^10*z7^3- 2*z3*z4*z5^10*z7^3+ 2*z2*z5^11*z7^3+
    2*z3*z5^11*z7^3+ 2*z4*z5^11*z7^3- 2*z5^12*z7^3- 2*z2*z3*z4*z5^8*z6*z7^3+
    2*z2*z3*z5^9*z6*z7^3+ 2*z2*z4*z5^9*z6*z7^3+ 2*z3*z4*z5^9*z6*z7^3-
    2*z2*z5^10*z6*z7^3- 2*z3*z5^10*z6*z7^3- 2*z4*z5^10*z6*z7^3+ 2*z5^11*z6*z7^3+
    2*z2*z3*z4*z5^8*z7^4- 2*z2*z3*z5^9*z7^4- 2*z2*z4*z5^9*z7^4- 2*z3*z4*z5^9*z7^4+
    2*z2*z5^10*z7^4+ 2*z3*z5^10*z7^4+ 2*z4*z5^10*z7^4- 2*z5^11*z7^4-
    2*z2*z3*z4*z5^7*z6*z7^4+ 2*z2*z3*z5^8*z6*z7^4+ 2*z2*z4*z5^8*z6*z7^4+
    2*z3*z4*z5^8*z6*z7^4- 2*z2*z5^9*z6*z7^4- 2*z3*z5^9*z6*z7^4- 2*z4*z5^9*z6*z7^4+
    2*z5^10*z6*z7^4+ 2*z2*z3*z4*z5^7*z7^5- 2*z2*z3*z5^8*z7^5- 2*z2*z4*z5^8*z7^5-
    2*z3*z4*z5^8*z7^5+ 2*z2*z5^9*z7^5+ 2*z3*z5^9*z7^5+ 2*z4*z5^9*z7^5-
    2*z5^10*z7^5- 2*z2*z3*z4*z5^6*z6*z7^5+ 2*z2*z3*z5^7*z6*z7^5+
    2*z2*z4*z5^7*z6*z7^5+ 2*z3*z4*z5^7*z6*z7^5- 2*z2*z5^8*z6*z7^5-
    2*z3*z5^8*z6*z7^5- 2*z4*z5^8*z6*z7^5+ 2*z5^9*z6*z7^5+ 2*z2*z3*z4*z5^6*z7^6-
    2*z2*z3*z5^7*z7^6- 2*z2*z4*z5^7*z7^6- 2*z3*z4*z5^7*z7^6+ 2*z2*z5^8*z7^6+
    2*z3*z5^8*z7^6+ 2*z4*z5^8*z7^6- 2*z5^9*z7^6- 2*z2*z3*z4*z5^5*z6*z7^6+
    2*z2*z3*z5^6*z6*z7^6+ 2*z2*z4*z5^6*z6*z7^6+ 2*z3*z4*z5^6*z6*z7^6-
    2*z2*z5^7*z6*z7^6- 2*z3*z5^7*z6*z7^6- 2*z4*z5^7*z6*z7^6+ 2*z5^8*z6*z7^6+
    2*z2*z3*z4*z5^5*z7^7- 2*z2*z3*z5^6*z7^7- 2*z2*z4*z5^6*z7^7- 2*z3*z4*z5^6*z7^7+
    2*z2*z5^7*z7^7+ 2*z3*z5^7*z7^7+ 2*z4*z5^7*z7^7- 2*z5^8*z7^7-
    2*z2*z3*z4*z5^4*z6*z7^7+ 2*z2*z3*z5^5*z6*z7^7+ 2*z2*z4*z5^5*z6*z7^7+
    2*z3*z4*z5^5*z6*z7^7- 2*z2*z5^6*z6*z7^7- 2*z3*z5^6*z6*z7^7- 2*z4*z5^6*z6*z7^7+
    2*z5^7*z6*z7^7+ 2*z2*z3*z4*z5^4*z7^8- 2*z2*z3*z5^5*z7^8- 2*z2*z4*z5^5*z7^8-
    2*z3*z4*z5^5*z7^8+ 2*z2*z5^6*z7^8+ 2*z3*z5^6*z7^8+ 2*z4*z5^6*z7^8-
    2*z5^7*z7^8- 2*z2*z3*z4*z5^3*z6*z7^8+ 2*z2*z3*z5^4*z6*z7^8+
    2*z2*z4*z5^4*z6*z7^8+ 2*z3*z4*z5^4*z6*z7^8- 2*z2*z5^5*z6*z7^8-
    2*z3*z5^5*z6*z7^8- 2*z4*z5^5*z6*z7^8+ 2*z5^6*z6*z7^8+ 2*z2*z3*z4*z5^3*z7^9-
    2*z2*z3*z5^4*z7^9- 2*z2*z4*z5^4*z7^9- 2*z3*z4*z5^4*z7^9+ 2*z2*z5^5*z7^9+
    2*z3*z5^5*z7^9+ 2*z4*z5^5*z7^9- 2*z5^6*z7^9- 2*z2*z3*z4*z5^2*z6*z7^9+
    2*z2*z3*z5^3*z6*z7^9+ 2*z2*z4*z5^3*z6*z7^9+ 2*z3*z4*z5^3*z6*z7^9-
    2*z2*z5^4*z6*z7^9- 2*z3*z5^4*z6*z7^9- 2*z4*z5^4*z6*z7^9+ 2*z5^5*z6*z7^9+
    2*z2*z3*z4*z5^2*z7^10- 2*z2*z3*z5^3*z7^10- 2*z2*z4*z5^3*z7^10-
    2*z3*z4*z5^3*z7^10+ 2*z2*z5^4*z7^10+ 2*z3*z5^4*z7^10+ 2*z4*z5^4*z7^10-
    2*z5^5*z7^10- 2*z2*z3*z4*z5*z6*z7^10+ 2*z2*z3*z5^2*z6*z7^10+
    2*z2*z4*z5^2*z6*z7^10+ 2*z3*z4*z5^2*z6*z7^10- 2*z2*z5^3*z6*z7^10-
    2*z3*z5^3*z6*z7^10- 2*z4*z5^3*z6*z7^10+ 2*z5^4*z6*z7^10+ 2*z2*z3*z4*z5*z7^11-
    2*z2*z3*z5^2*z7^11- 2*z2*z4*z5^2*z7^11- 2*z3*z4*z5^2*z7^11+ 2*z2*z5^3*z7^11+
    2*z3*z5^3*z7^11+ 2*z4*z5^3*z7^11- 2*z5^4*z7^11+ 10*z2*z3*z4*z6*z7^11+
    2*z2*z3*z5*z6*z7^11+ 2*z2*z4*z5*z6*z7^11+ 2*z3*z4*z5*z6*z7^11-
    2*z2*z5^2*z6*z7^11- 2*z3*z5^2*z6*z7^11- 2*z4*z5^2*z6*z7^11+ 2*z5^3*z6*z7^11-
    8*z2*z3*z4*z7^12- 2*z2*z3*z5*z7^12- 2*z2*z4*z5*z7^12- 2*z3*z4*z5*z7^12+
    2*z2*z5^2*z7^12+ 2*z3*z5^2*z7^12+ 2*z4*z5^2*z7^12- 2*z5^3*z7^12-
    8*z2*z3*z6*z7^12- 8*z2*z4*z6*z7^12- 8*z3*z4*z6*z7^12- 2*z2*z5*z6*z7^12-
    2*z3*z5*z6*z7^12- 2*z4*z5*z6*z7^12+ 2*z5^2*z6*z7^12+ 6*z2*z3*z7^13+
    6*z2*z4*z7^13+ 6*z3*z4*z7^13+ 2*z2*z5*z7^13+ 2*z3*z5*z7^13+ 2*z4*z5*z7^13-
    2*z5^2*z7^13+ 6*z2*z6*z7^13+ 6*z3*z6*z7^13+ 6*z4*z6*z7^13+ 2*z5*z6*z7^13-
    4*z2*z7^14- 4*z3*z7^14- 4*z4*z7^14- 2*z5*z7^14- 4*z6*z7^14+ 2*z7^15+
    z2*z3*z4*z5^10+ 10*z2*z3*z5^11+ 10*z2*z4*z5^11+ 10*z3*z4*z5^11- 13*z2*z5^12-
    13*z3*z5^12- 13*z4*z5^12+ 10*z5^13- 22*z2*z3*z4*z5^9*z6+ z2*z3*z5^10*z6+
    z2*z4*z5^10*z6+ z3*z4*z5^10*z6+ 10*z2*z5^11*z6+ 10*z3*z5^11*z6+
    10*z4*z5^11*z6- 13*z5^12*z6- 21*z2*z3*z4*z5^9*z7+ 11*z2*z3*z5^10*z7+
    11*z2*z4*z5^10*z7+ 11*z3*z4*z5^10*z7- 3*z2*z5^11*z7- 3*z3*z5^11*z7-
    3*z4*z5^11*z7- 3*z5^12*z7+ 33*z2*z3*z4*z5^8*z6*z7- 21*z2*z3*z5^9*z6*z7-
    21*z2*z4*z5^9*z6*z7- 21*z3*z4*z5^9*z6*z7+ 11*z2*z5^10*z6*z7+
    11*z3*z5^10*z6*z7+ 11*z4*z5^10*z6*z7- 3*z5^11*z6*z7- 21*z2*z3*z4*z5^8*z7^2+
    11*z2*z3*z5^9*z7^2+ 11*z2*z4*z5^9*z7^2+ 11*z3*z4*z5^9*z7^2- 3*z2*z5^10*z7^2-
    3*z3*z5^10*z7^2- 3*z4*z5^10*z7^2- 3*z5^11*z7^2+ 33*z2*z3*z4*z5^7*z6*z7^2-
    21*z2*z3*z5^8*z6*z7^2- 21*z2*z4*z5^8*z6*z7^2- 21*z3*z4*z5^8*z6*z7^2+
    11*z2*z5^9*z6*z7^2+ 11*z3*z5^9*z6*z7^2+ 11*z4*z5^9*z6*z7^2- 3*z5^10*z6*z7^2-
    21*z2*z3*z4*z5^7*z7^3+ 11*z2*z3*z5^8*z7^3+ 11*z2*z4*z5^8*z7^3+
    11*z3*z4*z5^8*z7^3- 3*z2*z5^9*z7^3- 3*z3*z5^9*z7^3- 3*z4*z5^9*z7^3-
    3*z5^10*z7^3+ 33*z2*z3*z4*z5^6*z6*z7^3- 21*z2*z3*z5^7*z6*z7^3-
    21*z2*z4*z5^7*z6*z7^3- 21*z3*z4*z5^7*z6*z7^3+ 11*z2*z5^8*z6*z7^3+
    11*z3*z5^8*z6*z7^3+ 11*z4*z5^8*z6*z7^3- 3*z5^9*z6*z7^3- 21*z2*z3*z4*z5^6*z7^4+
    11*z2*z3*z5^7*z7^4+ 11*z2*z4*z5^7*z7^4+ 11*z3*z4*z5^7*z7^4- 3*z2*z5^8*z7^4-
    3*z3*z5^8*z7^4- 3*z4*z5^8*z7^4- 3*z5^9*z7^4+ 33*z2*z3*z4*z5^5*z6*z7^4-
    21*z2*z3*z5^6*z6*z7^4- 21*z2*z4*z5^6*z6*z7^4- 21*z3*z4*z5^6*z6*z7^4+
    11*z2*z5^7*z6*z7^4+ 11*z3*z5^7*z6*z7^4+ 11*z4*z5^7*z6*z7^4- 3*z5^8*z6*z7^4-
    21*z2*z3*z4*z5^5*z7^5+ 11*z2*z3*z5^6*z7^5+ 11*z2*z4*z5^6*z7^5+
    11*z3*z4*z5^6*z7^5- 3*z2*z5^7*z7^5- 3*z3*z5^7*z7^5- 3*z4*z5^7*z7^5-
    3*z5^8*z7^5+ 33*z2*z3*z4*z5^4*z6*z7^5- 21*z2*z3*z5^5*z6*z7^5-
    21*z2*z4*z5^5*z6*z7^5- 21*z3*z4*z5^5*z6*z7^5+ 11*z2*z5^6*z6*z7^5+
    11*z3*z5^6*z6*z7^5+ 11*z4*z5^6*z6*z7^5- 3*z5^7*z6*z7^5- 21*z2*z3*z4*z5^4*z7^6+
    11*z2*z3*z5^5*z7^6+ 11*z2*z4*z5^5*z7^6+ 11*z3*z4*z5^5*z7^6- 3*z2*z5^6*z7^6-
    3*z3*z5^6*z7^6- 3*z4*z5^6*z7^6- 3*z5^7*z7^6+ 33*z2*z3*z4*z5^3*z6*z7^6-
    21*z2*z3*z5^4*z6*z7^6- 21*z2*z4*z5^4*z6*z7^6- 21*z3*z4*z5^4*z6*z7^6+
    11*z2*z5^5*z6*z7^6+ 11*z3*z5^5*z6*z7^6+ 11*z4*z5^5*z6*z7^6- 3*z5^6*z6*z7^6-
    21*z2*z3*z4*z5^3*z7^7+ 11*z2*z3*z5^4*z7^7+ 11*z2*z4*z5^4*z7^7+
    11*z3*z4*z5^4*z7^7- 3*z2*z5^5*z7^7- 3*z3*z5^5*z7^7- 3*z4*z5^5*z7^7-
    3*z5^6*z7^7+ 33*z2*z3*z4*z5^2*z6*z7^7- 21*z2*z3*z5^3*z6*z7^7-
    21*z2*z4*z5^3*z6*z7^7- 21*z3*z4*z5^3*z6*z7^7+ 11*z2*z5^4*z6*z7^7+
    11*z3*z5^4*z6*z7^7+ 11*z4*z5^4*z6*z7^7- 3*z5^5*z6*z7^7- 21*z2*z3*z4*z5^2*z7^8+
    11*z2*z3*z5^3*z7^8+ 11*z2*z4*z5^3*z7^8+ 11*z3*z4*z5^3*z7^8- 3*z2*z5^4*z7^8-
    3*z3*z5^4*z7^8- 3*z4*z5^4*z7^8- 3*z5^5*z7^8+ 33*z2*z3*z4*z5*z6*z7^8-
    21*z2*z3*z5^2*z6*z7^8- 21*z2*z4*z5^2*z6*z7^8- 21*z3*z4*z5^2*z6*z7^8+
    11*z2*z5^3*z6*z7^8+ 11*z3*z5^3*z6*z7^8+ 11*z4*z5^3*z6*z7^8- 3*z5^4*z6*z7^8-
    21*z2*z3*z4*z5*z7^9+ 11*z2*z3*z5^2*z7^9+ 11*z2*z4*z5^2*z7^9+
    11*z3*z4*z5^2*z7^9- 3*z2*z5^3*z7^9- 3*z3*z5^3*z7^9- 3*z4*z5^3*z7^9-
    3*z5^4*z7^9- 22*z2*z3*z4*z6*z7^9- 21*z2*z3*z5*z6*z7^9- 21*z2*z4*z5*z6*z7^9-
    21*z3*z4*z5*z6*z7^9+ 11*z2*z5^2*z6*z7^9+ 11*z3*z5^2*z6*z7^9+
    11*z4*z5^2*z6*z7^9- 3*z5^3*z6*z7^9+ z2*z3*z4*z7^10+ 11*z2*z3*z5*z7^10+
    11*z2*z4*z5*z7^10+ 11*z3*z4*z5*z7^10- 3*z2*z5^2*z7^10- 3*z3*z5^2*z7^10-
    3*z4*z5^2*z7^10- 3*z5^3*z7^10+ z2*z3*z6*z7^10+ z2*z4*z6*z7^10+ z3*z4*z6*z7^10+
    11*z2*z5*z6*z7^10+ 11*z3*z5*z6*z7^10+ 11*z4*z5*z6*z7^10- 3*z5^2*z6*z7^10+
    10*z2*z3*z7^11+ 10*z2*z4*z7^11+ 10*z3*z4*z7^11- 3*z2*z5*z7^11- 3*z3*z5*z7^11-
    3*z4*z5*z7^11- 3*z5^2*z7^11+ 10*z2*z6*z7^11+ 10*z3*z6*z7^11+ 10*z4*z6*z7^11-
    3*z5*z6*z7^11- 13*z2*z7^12- 13*z3*z7^12- 13*z4*z7^12- 3*z5*z7^12- 13*z6*z7^12+
    10*z7^13- 2231*z2*z3*z4*z5^8+ 1121*z2*z3*z5^9+ 1121*z2*z4*z5^9+
    1121*z3*z4*z5^9- 12*z2*z5^10- 12*z3*z5^10- 12*z4*z5^10- 1107*z5^11+
    3363*z2*z3*z4*z5^7*z6- 2231*z2*z3*z5^8*z6- 2231*z2*z4*z5^8*z6-
    2231*z3*z4*z5^8*z6+ 1121*z2*z5^9*z6+ 1121*z3*z5^9*z6+ 1121*z4*z5^9*z6-
    12*z5^10*z6+ 1132*z2*z3*z4*z5^7*z7- 1110*z2*z3*z5^8*z7- 1110*z2*z4*z5^8*z7-
    1110*z3*z4*z5^8*z7+ 1109*z2*z5^9*z7+ 1109*z3*z5^9*z7+ 1109*z4*z5^9*z7-
    1119*z5^10*z7- 1187*z2*z3*z4*z5^6*z6*z7+ 1132*z2*z3*z5^7*z6*z7+
    1132*z2*z4*z5^7*z6*z7+ 1132*z3*z4*z5^7*z6*z7- 1110*z2*z5^8*z6*z7-
    1110*z3*z5^8*z6*z7- 1110*z4*z5^8*z6*z7+ 1109*z5^9*z6*z7+
    1132*z2*z3*z4*z5^6*z7^2- 1110*z2*z3*z5^7*z7^2- 1110*z2*z4*z5^7*z7^2-
    1110*z3*z4*z5^7*z7^2+ 1109*z2*z5^8*z7^2+ 1109*z3*z5^8*z7^2+ 1109*z4*z5^8*z7^2-
    1119*z5^9*z7^2- 1187*z2*z3*z4*z5^5*z6*z7^2+ 1132*z2*z3*z5^6*z6*z7^2+
    1132*z2*z4*z5^6*z6*z7^2+ 1132*z3*z4*z5^6*z6*z7^2- 1110*z2*z5^7*z6*z7^2-
    1110*z3*z5^7*z6*z7^2- 1110*z4*z5^7*z6*z7^2+ 1109*z5^8*z6*z7^2+
    1132*z2*z3*z4*z5^5*z7^3- 1110*z2*z3*z5^6*z7^3- 1110*z2*z4*z5^6*z7^3-
    1110*z3*z4*z5^6*z7^3+ 1109*z2*z5^7*z7^3+ 1109*z3*z5^7*z7^3+ 1109*z4*z5^7*z7^3-
    1119*z5^8*z7^3- 1187*z2*z3*z4*z5^4*z6*z7^3+ 1132*z2*z3*z5^5*z6*z7^3+
    1132*z2*z4*z5^5*z6*z7^3+ 1132*z3*z4*z5^5*z6*z7^3- 1110*z2*z5^6*z6*z7^3-
    1110*z3*z5^6*z6*z7^3- 1110*z4*z5^6*z6*z7^3+ 1109*z5^7*z6*z7^3+
    1132*z2*z3*z4*z5^4*z7^4- 1110*z2*z3*z5^5*z7^4- 1110*z2*z4*z5^5*z7^4-
    1110*z3*z4*z5^5*z7^4+ 1109*z2*z5^6*z7^4+ 1109*z3*z5^6*z7^4+ 1109*z4*z5^6*z7^4-
    1119*z5^7*z7^4- 1187*z2*z3*z4*z5^3*z6*z7^4+ 1132*z2*z3*z5^4*z6*z7^4+
    1132*z2*z4*z5^4*z6*z7^4+ 1132*z3*z4*z5^4*z6*z7^4- 1110*z2*z5^5*z6*z7^4-
    1110*z3*z5^5*z6*z7^4- 1110*z4*z5^5*z6*z7^4+ 1109*z5^6*z6*z7^4+
    1132*z2*z3*z4*z5^3*z7^5- 1110*z2*z3*z5^4*z7^5- 1110*z2*z4*z5^4*z7^5-
    1110*z3*z4*z5^4*z7^5+ 1109*z2*z5^5*z7^5+ 1109*z3*z5^5*z7^5+ 1109*z4*z5^5*z7^5-
    1119*z5^6*z7^5- 1187*z2*z3*z4*z5^2*z6*z7^5+ 1132*z2*z3*z5^3*z6*z7^5+
    1132*z2*z4*z5^3*z6*z7^5+ 1132*z3*z4*z5^3*z6*z7^5- 1110*z2*z5^4*z6*z7^5-
    1110*z3*z5^4*z6*z7^5- 1110*z4*z5^4*z6*z7^5+ 1109*z5^5*z6*z7^5+
    1132*z2*z3*z4*z5^2*z7^6- 1110*z2*z3*z5^3*z7^6- 1110*z2*z4*z5^3*z7^6-
    1110*z3*z4*z5^3*z7^6+ 1109*z2*z5^4*z7^6+ 1109*z3*z5^4*z7^6+ 1109*z4*z5^4*z7^6-
    1119*z5^5*z7^6- 1187*z2*z3*z4*z5*z6*z7^6+ 1132*z2*z3*z5^2*z6*z7^6+
    1132*z2*z4*z5^2*z6*z7^6+ 1132*z3*z4*z5^2*z6*z7^6- 1110*z2*z5^3*z6*z7^6-
    1110*z3*z5^3*z6*z7^6- 1110*z4*z5^3*z6*z7^6+ 1109*z5^4*z6*z7^6+
    1132*z2*z3*z4*z5*z7^7- 1110*z2*z3*z5^2*z7^7- 1110*z2*z4*z5^2*z7^7-
    1110*z3*z4*z5^2*z7^7+ 1109*z2*z5^3*z7^7+ 1109*z3*z5^3*z7^7+ 1109*z4*z5^3*z7^7-
    1119*z5^4*z7^7+ 3363*z2*z3*z4*z6*z7^7+ 1132*z2*z3*z5*z6*z7^7+
    1132*z2*z4*z5*z6*z7^7+ 1132*z3*z4*z5*z6*z7^7- 1110*z2*z5^2*z6*z7^7-
    1110*z3*z5^2*z6*z7^7- 1110*z4*z5^2*z6*z7^7+ 1109*z5^3*z6*z7^7-
    2231*z2*z3*z4*z7^8- 1110*z2*z3*z5*z7^8- 1110*z2*z4*z5*z7^8-
    1110*z3*z4*z5*z7^8+ 1109*z2*z5^2*z7^8+ 1109*z3*z5^2*z7^8+ 1109*z4*z5^2*z7^8-
    1119*z5^3*z7^8- 2231*z2*z3*z6*z7^8- 2231*z2*z4*z6*z7^8- 2231*z3*z4*z6*z7^8-
    1110*z2*z5*z6*z7^8- 1110*z3*z5*z6*z7^8- 1110*z4*z5*z6*z7^8+ 1109*z5^2*z6*z7^8+
    1121*z2*z3*z7^9+ 1121*z2*z4*z7^9+ 1121*z3*z4*z7^9+ 1109*z2*z5*z7^9+
    1109*z3*z5*z7^9+ 1109*z4*z5*z7^9- 1119*z5^2*z7^9+ 1121*z2*z6*z7^9+
    1121*z3*z6*z7^9+ 1121*z4*z6*z7^9+ 1109*z5*z6*z7^9- 12*z2*z7^10- 12*z3*z7^10-
    12*z4*z7^10- 1119*z5*z7^10- 12*z6*z7^10- 1107*z7^11- 1121*z2*z3*z4*z5^6+
    3363*z2*z3*z5^7+ 3363*z2*z4*z5^7+ 3363*z3*z4*z5^7- 3374*z2*z5^8- 3374*z3*z5^8-
    3374*z4*z5^8+ 2264*z5^9- 4484*z2*z3*z4*z5^5*z6- 1121*z2*z3*z5^6*z6-
    1121*z2*z4*z5^6*z6- 1121*z3*z4*z5^6*z6+ 3363*z2*z5^7*z6+ 3363*z3*z5^7*z6+
    3363*z4*z5^7*z6- 3374*z5^8*z6+ 3396*z2*z3*z4*z5^5*z7+ 2242*z2*z3*z5^6*z7+
    2242*z2*z4*z5^6*z7+ 2242*z3*z4*z5^6*z7- 11*z2*z5^7*z7- 11*z3*z5^7*z7-
    11*z4*z5^7*z7- 1110*z5^8*z7+ 1154*z2*z3*z4*z5^4*z6*z7+ 3396*z2*z3*z5^5*z6*z7+
    3396*z2*z4*z5^5*z6*z7+ 3396*z3*z4*z5^5*z6*z7+ 2242*z2*z5^6*z6*z7+
    2242*z3*z5^6*z6*z7+ 2242*z4*z5^6*z6*z7- 11*z5^7*z6*z7+
    3396*z2*z3*z4*z5^4*z7^2+ 2242*z2*z3*z5^5*z7^2+ 2242*z2*z4*z5^5*z7^2+
    2242*z3*z4*z5^5*z7^2- 11*z2*z5^6*z7^2- 11*z3*z5^6*z7^2- 11*z4*z5^6*z7^2-
    1110*z5^7*z7^2+ 1154*z2*z3*z4*z5^3*z6*z7^2+ 3396*z2*z3*z5^4*z6*z7^2+
    3396*z2*z4*z5^4*z6*z7^2+ 3396*z3*z4*z5^4*z6*z7^2+ 2242*z2*z5^5*z6*z7^2+
    2242*z3*z5^5*z6*z7^2+ 2242*z4*z5^5*z6*z7^2- 11*z5^6*z6*z7^2+
    3396*z2*z3*z4*z5^3*z7^3+ 2242*z2*z3*z5^4*z7^3+ 2242*z2*z4*z5^4*z7^3+
    2242*z3*z4*z5^4*z7^3- 11*z2*z5^5*z7^3- 11*z3*z5^5*z7^3- 11*z4*z5^5*z7^3-
    1110*z5^6*z7^3+ 1154*z2*z3*z4*z5^2*z6*z7^3+ 3396*z2*z3*z5^3*z6*z7^3+
    3396*z2*z4*z5^3*z6*z7^3+ 3396*z3*z4*z5^3*z6*z7^3+ 2242*z2*z5^4*z6*z7^3+
    2242*z3*z5^4*z6*z7^3+ 2242*z4*z5^4*z6*z7^3- 11*z5^5*z6*z7^3+
    3396*z2*z3*z4*z5^2*z7^4+ 2242*z2*z3*z5^3*z7^4+ 2242*z2*z4*z5^3*z7^4+
    2242*z3*z4*z5^3*z7^4- 11*z2*z5^4*z7^4- 11*z3*z5^4*z7^4- 11*z4*z5^4*z7^4-
    1110*z5^5*z7^4+ 1154*z2*z3*z4*z5*z6*z7^4+ 3396*z2*z3*z5^2*z6*z7^4+
    3396*z2*z4*z5^2*z6*z7^4+ 3396*z3*z4*z5^2*z6*z7^4+ 2242*z2*z5^3*z6*z7^4+
    2242*z3*z5^3*z6*z7^4+ 2242*z4*z5^3*z6*z7^4- 11*z5^4*z6*z7^4+
    3396*z2*z3*z4*z5*z7^5+ 2242*z2*z3*z5^2*z7^5+ 2242*z2*z4*z5^2*z7^5+
    2242*z3*z4*z5^2*z7^5- 11*z2*z5^3*z7^5- 11*z3*z5^3*z7^5- 11*z4*z5^3*z7^5-
    1110*z5^4*z7^5- 4484*z2*z3*z4*z6*z7^5+ 3396*z2*z3*z5*z6*z7^5+
    3396*z2*z4*z5*z6*z7^5+ 3396*z3*z4*z5*z6*z7^5+ 2242*z2*z5^2*z6*z7^5+
    2242*z3*z5^2*z6*z7^5+ 2242*z4*z5^2*z6*z7^5- 11*z5^3*z6*z7^5-
    1121*z2*z3*z4*z7^6+ 2242*z2*z3*z5*z7^6+ 2242*z2*z4*z5*z7^6+
    2242*z3*z4*z5*z7^6- 11*z2*z5^2*z7^6- 11*z3*z5^2*z7^6- 11*z4*z5^2*z7^6-
    1110*z5^3*z7^6- 1121*z2*z3*z6*z7^6- 1121*z2*z4*z6*z7^6- 1121*z3*z4*z6*z7^6+
    2242*z2*z5*z6*z7^6+ 2242*z3*z5*z6*z7^6+ 2242*z4*z5*z6*z7^6- 11*z5^2*z6*z7^6+
    3363*z2*z3*z7^7+ 3363*z2*z4*z7^7+ 3363*z3*z4*z7^7- 11*z2*z5*z7^7-
    11*z3*z5*z7^7- 11*z4*z5*z7^7- 1110*z5^2*z7^7+ 3363*z2*z6*z7^7+
    3363*z3*z6*z7^7+ 3363*z4*z6*z7^7- 11*z5*z6*z7^7- 3374*z2*z7^8- 3374*z3*z7^8-
    3374*z4*z7^8- 1110*z5*z7^8- 3374*z6*z7^8+ 2264*z7^9+ 4495*z2*z3*z4*z5^4+
    2740*z2*z3*z5^5+ 2740*z2*z4*z5^5+ 2740*z3*z4*z5^5+ 147*z2*z5^6+ 147*z3*z5^6+
    147*z4*z5^6+ 2604*z5^7+ 1755*z2*z3*z4*z5^3*z6+ 4495*z2*z3*z5^4*z6+
    4495*z2*z4*z5^4*z6+ 4495*z3*z4*z5^4*z6+ 2740*z2*z5^5*z6+ 2740*z3*z5^5*z6+
    2740*z4*z5^5*z6+ 147*z5^6*z6- 2751*z2*z3*z4*z5^3*z7- 1766*z2*z3*z5^4*z7-
    1766*z2*z4*z5^4*z7- 1766*z3*z4*z5^4*z7+ 2887*z2*z5^5*z7+ 2887*z3*z5^5*z7+
    2887*z4*z5^5*z7+ 2751*z5^6*z7- 2887*z2*z3*z4*z5^2*z6*z7-
    2751*z2*z3*z5^3*z6*z7- 2751*z2*z4*z5^3*z6*z7- 2751*z3*z4*z5^3*z6*z7-
    1766*z2*z5^4*z6*z7- 1766*z3*z5^4*z6*z7- 1766*z4*z5^4*z6*z7+ 2887*z5^5*z6*z7-
    2751*z2*z3*z4*z5^2*z7^2- 1766*z2*z3*z5^3*z7^2- 1766*z2*z4*z5^3*z7^2-
    1766*z3*z4*z5^3*z7^2+ 2887*z2*z5^4*z7^2+ 2887*z3*z5^4*z7^2+ 2887*z4*z5^4*z7^2+
    2751*z5^5*z7^2- 2887*z2*z3*z4*z5*z6*z7^2- 2751*z2*z3*z5^2*z6*z7^2-
    2751*z2*z4*z5^2*z6*z7^2- 2751*z3*z4*z5^2*z6*z7^2- 1766*z2*z5^3*z6*z7^2-
    1766*z3*z5^3*z6*z7^2- 1766*z4*z5^3*z6*z7^2+ 2887*z5^4*z6*z7^2-
    2751*z2*z3*z4*z5*z7^3- 1766*z2*z3*z5^2*z7^3- 1766*z2*z4*z5^2*z7^3-
    1766*z3*z4*z5^2*z7^3+ 2887*z2*z5^3*z7^3+ 2887*z3*z5^3*z7^3+ 2887*z4*z5^3*z7^3+
    2751*z5^4*z7^3+ 1755*z2*z3*z4*z6*z7^3- 2751*z2*z3*z5*z6*z7^3-
    2751*z2*z4*z5*z6*z7^3- 2751*z3*z4*z5*z6*z7^3- 1766*z2*z5^2*z6*z7^3-
    1766*z3*z5^2*z6*z7^3- 1766*z4*z5^2*z6*z7^3+ 2887*z5^3*z6*z7^3+
    4495*z2*z3*z4*z7^4- 1766*z2*z3*z5*z7^4- 1766*z2*z4*z5*z7^4-
    1766*z3*z4*z5*z7^4+ 2887*z2*z5^2*z7^4+ 2887*z3*z5^2*z7^4+ 2887*z4*z5^2*z7^4+
    2751*z5^3*z7^4+ 4495*z2*z3*z6*z7^4+ 4495*z2*z4*z6*z7^4+ 4495*z3*z4*z6*z7^4-
    1766*z2*z5*z6*z7^4- 1766*z3*z5*z6*z7^4- 1766*z4*z5*z6*z7^4+ 2887*z5^2*z6*z7^4+
    2740*z2*z3*z7^5+ 2740*z2*z4*z7^5+ 2740*z3*z4*z7^5+ 2887*z2*z5*z7^5+
    2887*z3*z5*z7^5+ 2887*z4*z5*z7^5+ 2751*z5^2*z7^5+ 2740*z2*z6*z7^5+
    2740*z3*z6*z7^5+ 2740*z4*z6*z7^5+ 2887*z5*z6*z7^5+ 147*z2*z7^6+ 147*z3*z7^6+
    147*z4*z7^6+ 2751*z5*z7^6+ 147*z6*z7^6+ 2604*z7^7- 2988*z2*z3*z4*z5^2+
    3588*z2*z3*z5^3+ 3588*z2*z4*z5^3+ 3588*z3*z4*z5^3+ 318*z2*z5^4+ 318*z3*z5^4+
    318*z4*z5^4+ 2037*z5^5+ 633*z2*z3*z4*z5*z6- 2988*z2*z3*z5^2*z6-
    2988*z2*z4*z5^2*z6- 2988*z3*z4*z5^2*z6+ 3588*z2*z5^3*z6+ 3588*z3*z5^3*z6+
    3588*z4*z5^3*z6+ 318*z5^4*z6- 2355*z2*z3*z4*z5*z7+ 600*z2*z3*z5^2*z7+
    600*z2*z4*z5^2*z7+ 600*z3*z4*z5^2*z7+ 3906*z2*z5^3*z7+ 3906*z3*z5^3*z7+
    3906*z4*z5^3*z7+ 2355*z5^4*z7+ 633*z2*z3*z4*z6*z7- 2355*z2*z3*z5*z6*z7-
    2355*z2*z4*z5*z6*z7- 2355*z3*z4*z5*z6*z7+ 600*z2*z5^2*z6*z7+
    600*z3*z5^2*z6*z7+ 600*z4*z5^2*z6*z7+ 3906*z5^3*z6*z7- 2988*z2*z3*z4*z7^2+
    600*z2*z3*z5*z7^2+ 600*z2*z4*z5*z7^2+ 600*z3*z4*z5*z7^2+ 3906*z2*z5^2*z7^2+
    3906*z3*z5^2*z7^2+ 3906*z4*z5^2*z7^2+ 2355*z5^3*z7^2- 2988*z2*z3*z6*z7^2-
    2988*z2*z4*z6*z7^2- 2988*z3*z4*z6*z7^2+ 600*z2*z5*z6*z7^2+ 600*z3*z5*z6*z7^2+
    600*z4*z5*z6*z7^2+ 3906*z5^2*z6*z7^2+ 3588*z2*z3*z7^3+ 3588*z2*z4*z7^3+
    3588*z3*z4*z7^3+ 3906*z2*z5*z7^3+ 3906*z3*z5*z7^3+ 3906*z4*z5*z7^3+
    2355*z5^2*z7^3+ 3588*z2*z6*z7^3+ 3588*z3*z6*z7^3+ 3588*z4*z6*z7^3+
    3906*z5*z6*z7^3+ 318*z2*z7^4+ 318*z3*z7^4+ 318*z4*z7^4+ 2355*z5*z7^4+
    318*z6*z7^4+ 2037*z7^5- 1068*z2*z3*z4- 2202*z2*z3*z5- 2202*z2*z4*z5-
    2202*z3*z4*z5- 1776*z2*z5^2- 1776*z3*z5^2- 1776*z4*z5^2+ 2166*z5^3-
    1068*z2*z3*z6- 1068*z2*z4*z6- 1068*z3*z4*z6- 2202*z2*z5*z6- 2202*z3*z5*z6-
    2202*z4*z5*z6- 1776*z5^2*z6- 2202*z2*z3*z7- 2202*z2*z4*z7- 2202*z3*z4*z7-
    3978*z2*z5*z7- 3978*z3*z5*z7- 3978*z4*z5*z7+ 390*z5^2*z7- 2202*z2*z6*z7-
    2202*z3*z6*z7- 2202*z4*z6*z7- 3978*z5*z6*z7- 1776*z2*z7^2- 1776*z3*z7^2-
    1776*z4*z7^2+ 390*z5*z7^2- 1776*z6*z7^2+ 2166*z7^3+ 3538*z2+ 3538*z3+ 3538*z4-
    1169*z5+ 3538*z6- 1169*z7, 10*z2*z3*z4*z5*z6^11- 8*z2*z3*z4*z6^12-
    8*z2*z3*z5*z6^12- 8*z2*z4*z5*z6^12- 8*z3*z4*z5*z6^12+ 6*z2*z3*z6^13+
    6*z2*z4*z6^13+ 6*z3*z4*z6^13+ 6*z2*z5*z6^13+ 6*z3*z5*z6^13+ 6*z4*z5*z6^13-
    4*z2*z6^14- 4*z3*z6^14- 4*z4*z6^14- 4*z5*z6^14+ 2*z6^15-
    2*z2*z3*z4*z5*z6^10*z7+ 2*z2*z3*z4*z6^11*z7+ 2*z2*z3*z5*z6^11*z7+
    2*z2*z4*z5*z6^11*z7+ 2*z3*z4*z5*z6^11*z7- 2*z2*z3*z6^12*z7- 2*z2*z4*z6^12*z7-
    2*z3*z4*z6^12*z7- 2*z2*z5*z6^12*z7- 2*z3*z5*z6^12*z7- 2*z4*z5*z6^12*z7+
    2*z2*z6^13*z7+ 2*z3*z6^13*z7+ 2*z4*z6^13*z7+ 2*z5*z6^13*z7- 2*z6^14*z7-
    2*z2*z3*z4*z5*z6^9*z7^2+ 2*z2*z3*z4*z6^10*z7^2+ 2*z2*z3*z5*z6^10*z7^2+
    2*z2*z4*z5*z6^10*z7^2+ 2*z3*z4*z5*z6^10*z7^2- 2*z2*z3*z6^11*z7^2-
    2*z2*z4*z6^11*z7^2- 2*z3*z4*z6^11*z7^2- 2*z2*z5*z6^11*z7^2-
    2*z3*z5*z6^11*z7^2- 2*z4*z5*z6^11*z7^2+ 2*z2*z6^12*z7^2+ 2*z3*z6^12*z7^2+
    2*z4*z6^12*z7^2+ 2*z5*z6^12*z7^2- 2*z6^13*z7^2- 2*z2*z3*z4*z5*z6^8*z7^3+
    2*z2*z3*z4*z6^9*z7^3+ 2*z2*z3*z5*z6^9*z7^3+ 2*z2*z4*z5*z6^9*z7^3+
    2*z3*z4*z5*z6^9*z7^3- 2*z2*z3*z6^10*z7^3- 2*z2*z4*z6^10*z7^3-
    2*z3*z4*z6^10*z7^3- 2*z2*z5*z6^10*z7^3- 2*z3*z5*z6^10*z7^3-
    2*z4*z5*z6^10*z7^3+ 2*z2*z6^11*z7^3+ 2*z3*z6^11*z7^3+ 2*z4*z6^11*z7^3+
    2*z5*z6^11*z7^3- 2*z6^12*z7^3- 2*z2*z3*z4*z5*z6^7*z7^4+ 2*z2*z3*z4*z6^8*z7^4+
    2*z2*z3*z5*z6^8*z7^4+ 2*z2*z4*z5*z6^8*z7^4+ 2*z3*z4*z5*z6^8*z7^4-
    2*z2*z3*z6^9*z7^4- 2*z2*z4*z6^9*z7^4- 2*z3*z4*z6^9*z7^4- 2*z2*z5*z6^9*z7^4-
    2*z3*z5*z6^9*z7^4- 2*z4*z5*z6^9*z7^4+ 2*z2*z6^10*z7^4+ 2*z3*z6^10*z7^4+
    2*z4*z6^10*z7^4+ 2*z5*z6^10*z7^4- 2*z6^11*z7^4- 2*z2*z3*z4*z5*z6^6*z7^5+
    2*z2*z3*z4*z6^7*z7^5+ 2*z2*z3*z5*z6^7*z7^5+ 2*z2*z4*z5*z6^7*z7^5+
    2*z3*z4*z5*z6^7*z7^5- 2*z2*z3*z6^8*z7^5- 2*z2*z4*z6^8*z7^5- 2*z3*z4*z6^8*z7^5-
    2*z2*z5*z6^8*z7^5- 2*z3*z5*z6^8*z7^5- 2*z4*z5*z6^8*z7^5+ 2*z2*z6^9*z7^5+
    2*z3*z6^9*z7^5+ 2*z4*z6^9*z7^5+ 2*z5*z6^9*z7^5- 2*z6^10*z7^5-
    2*z2*z3*z4*z5*z6^5*z7^6+ 2*z2*z3*z4*z6^6*z7^6+ 2*z2*z3*z5*z6^6*z7^6+
    2*z2*z4*z5*z6^6*z7^6+ 2*z3*z4*z5*z6^6*z7^6- 2*z2*z3*z6^7*z7^6-
    2*z2*z4*z6^7*z7^6- 2*z3*z4*z6^7*z7^6- 2*z2*z5*z6^7*z7^6- 2*z3*z5*z6^7*z7^6-
    2*z4*z5*z6^7*z7^6+ 2*z2*z6^8*z7^6+ 2*z3*z6^8*z7^6+ 2*z4*z6^8*z7^6+
    2*z5*z6^8*z7^6- 2*z6^9*z7^6- 2*z2*z3*z4*z5*z6^4*z7^7+ 2*z2*z3*z4*z6^5*z7^7+
    2*z2*z3*z5*z6^5*z7^7+ 2*z2*z4*z5*z6^5*z7^7+ 2*z3*z4*z5*z6^5*z7^7-
    2*z2*z3*z6^6*z7^7- 2*z2*z4*z6^6*z7^7- 2*z3*z4*z6^6*z7^7- 2*z2*z5*z6^6*z7^7-
    2*z3*z5*z6^6*z7^7- 2*z4*z5*z6^6*z7^7+ 2*z2*z6^7*z7^7+ 2*z3*z6^7*z7^7+
    2*z4*z6^7*z7^7+ 2*z5*z6^7*z7^7- 2*z6^8*z7^7- 2*z2*z3*z4*z5*z6^3*z7^8+
    2*z2*z3*z4*z6^4*z7^8+ 2*z2*z3*z5*z6^4*z7^8+ 2*z2*z4*z5*z6^4*z7^8+
    2*z3*z4*z5*z6^4*z7^8- 2*z2*z3*z6^5*z7^8- 2*z2*z4*z6^5*z7^8- 2*z3*z4*z6^5*z7^8-
    2*z2*z5*z6^5*z7^8- 2*z3*z5*z6^5*z7^8- 2*z4*z5*z6^5*z7^8+ 2*z2*z6^6*z7^8+
    2*z3*z6^6*z7^8+ 2*z4*z6^6*z7^8+ 2*z5*z6^6*z7^8- 2*z6^7*z7^8-
    2*z2*z3*z4*z5*z6^2*z7^9+ 2*z2*z3*z4*z6^3*z7^9+ 2*z2*z3*z5*z6^3*z7^9+
    2*z2*z4*z5*z6^3*z7^9+ 2*z3*z4*z5*z6^3*z7^9- 2*z2*z3*z6^4*z7^9-
    2*z2*z4*z6^4*z7^9- 2*z3*z4*z6^4*z7^9- 2*z2*z5*z6^4*z7^9- 2*z3*z5*z6^4*z7^9-
    2*z4*z5*z6^4*z7^9+ 2*z2*z6^5*z7^9+ 2*z3*z6^5*z7^9+ 2*z4*z6^5*z7^9+
    2*z5*z6^5*z7^9- 2*z6^6*z7^9- 2*z2*z3*z4*z5*z6*z7^10+ 2*z2*z3*z4*z6^2*z7^10+
    2*z2*z3*z5*z6^2*z7^10+ 2*z2*z4*z5*z6^2*z7^10+ 2*z3*z4*z5*z6^2*z7^10-
    2*z2*z3*z6^3*z7^10- 2*z2*z4*z6^3*z7^10- 2*z3*z4*z6^3*z7^10-
    2*z2*z5*z6^3*z7^10- 2*z3*z5*z6^3*z7^10- 2*z4*z5*z6^3*z7^10+ 2*z2*z6^4*z7^10+
    2*z3*z6^4*z7^10+ 2*z4*z6^4*z7^10+ 2*z5*z6^4*z7^10- 2*z6^5*z7^10+
    10*z2*z3*z4*z5*z7^11+ 2*z2*z3*z4*z6*z7^11+ 2*z2*z3*z5*z6*z7^11+
    2*z2*z4*z5*z6*z7^11+ 2*z3*z4*z5*z6*z7^11- 2*z2*z3*z6^2*z7^11-
    2*z2*z4*z6^2*z7^11- 2*z3*z4*z6^2*z7^11- 2*z2*z5*z6^2*z7^11-
    2*z3*z5*z6^2*z7^11- 2*z4*z5*z6^2*z7^11+ 2*z2*z6^3*z7^11+ 2*z3*z6^3*z7^11+
    2*z4*z6^3*z7^11+ 2*z5*z6^3*z7^11- 2*z6^4*z7^11- 8*z2*z3*z4*z7^12-
    8*z2*z3*z5*z7^12- 8*z2*z4*z5*z7^12- 8*z3*z4*z5*z7^12- 2*z2*z3*z6*z7^12-
    2*z2*z4*z6*z7^12- 2*z3*z4*z6*z7^12- 2*z2*z5*z6*z7^12- 2*z3*z5*z6*z7^12-
    2*z4*z5*z6*z7^12+ 2*z2*z6^2*z7^12+ 2*z3*z6^2*z7^12+ 2*z4*z6^2*z7^12+
    2*z5*z6^2*z7^12- 2*z6^3*z7^12+ 6*z2*z3*z7^13+ 6*z2*z4*z7^13+ 6*z3*z4*z7^13+
    6*z2*z5*z7^13+ 6*z3*z5*z7^13+ 6*z4*z5*z7^13+ 2*z2*z6*z7^13+ 2*z3*z6*z7^13+
    2*z4*z6*z7^13+ 2*z5*z6*z7^13- 2*z6^2*z7^13- 4*z2*z7^14- 4*z3*z7^14-
    4*z4*z7^14- 4*z5*z7^14- 2*z6*z7^14+ 2*z7^15- 22*z2*z3*z4*z5*z6^9+
    z2*z3*z4*z6^10+ z2*z3*z5*z6^10+ z2*z4*z5*z6^10+ z3*z4*z5*z6^10+
    10*z2*z3*z6^11+ 10*z2*z4*z6^11+ 10*z3*z4*z6^11+ 10*z2*z5*z6^11+
    10*z3*z5*z6^11+ 10*z4*z5*z6^11- 13*z2*z6^12- 13*z3*z6^12- 13*z4*z6^12-
    13*z5*z6^12+ 10*z6^13+ 33*z2*z3*z4*z5*z6^8*z7- 21*z2*z3*z4*z6^9*z7-
    21*z2*z3*z5*z6^9*z7- 21*z2*z4*z5*z6^9*z7- 21*z3*z4*z5*z6^9*z7+
    11*z2*z3*z6^10*z7+ 11*z2*z4*z6^10*z7+ 11*z3*z4*z6^10*z7+ 11*z2*z5*z6^10*z7+
    11*z3*z5*z6^10*z7+ 11*z4*z5*z6^10*z7- 3*z2*z6^11*z7- 3*z3*z6^11*z7-
    3*z4*z6^11*z7- 3*z5*z6^11*z7- 3*z6^12*z7+ 33*z2*z3*z4*z5*z6^7*z7^2-
    21*z2*z3*z4*z6^8*z7^2- 21*z2*z3*z5*z6^8*z7^2- 21*z2*z4*z5*z6^8*z7^2-
    21*z3*z4*z5*z6^8*z7^2+ 11*z2*z3*z6^9*z7^2+ 11*z2*z4*z6^9*z7^2+
    11*z3*z4*z6^9*z7^2+ 11*z2*z5*z6^9*z7^2+ 11*z3*z5*z6^9*z7^2+
    11*z4*z5*z6^9*z7^2- 3*z2*z6^10*z7^2- 3*z3*z6^10*z7^2- 3*z4*z6^10*z7^2-
    3*z5*z6^10*z7^2- 3*z6^11*z7^2+ 33*z2*z3*z4*z5*z6^6*z7^3-
    21*z2*z3*z4*z6^7*z7^3- 21*z2*z3*z5*z6^7*z7^3- 21*z2*z4*z5*z6^7*z7^3-
    21*z3*z4*z5*z6^7*z7^3+ 11*z2*z3*z6^8*z7^3+ 11*z2*z4*z6^8*z7^3+
    11*z3*z4*z6^8*z7^3+ 11*z2*z5*z6^8*z7^3+ 11*z3*z5*z6^8*z7^3+
    11*z4*z5*z6^8*z7^3- 3*z2*z6^9*z7^3- 3*z3*z6^9*z7^3- 3*z4*z6^9*z7^3-
    3*z5*z6^9*z7^3- 3*z6^10*z7^3+ 33*z2*z3*z4*z5*z6^5*z7^4- 21*z2*z3*z4*z6^6*z7^4-
    21*z2*z3*z5*z6^6*z7^4- 21*z2*z4*z5*z6^6*z7^4- 21*z3*z4*z5*z6^6*z7^4+
    11*z2*z3*z6^7*z7^4+ 11*z2*z4*z6^7*z7^4+ 11*z3*z4*z6^7*z7^4+
    11*z2*z5*z6^7*z7^4+ 11*z3*z5*z6^7*z7^4+ 11*z4*z5*z6^7*z7^4- 3*z2*z6^8*z7^4-
    3*z3*z6^8*z7^4- 3*z4*z6^8*z7^4- 3*z5*z6^8*z7^4- 3*z6^9*z7^4+
    33*z2*z3*z4*z5*z6^4*z7^5- 21*z2*z3*z4*z6^5*z7^5- 21*z2*z3*z5*z6^5*z7^5-
    21*z2*z4*z5*z6^5*z7^5- 21*z3*z4*z5*z6^5*z7^5+ 11*z2*z3*z6^6*z7^5+
    11*z2*z4*z6^6*z7^5+ 11*z3*z4*z6^6*z7^5+ 11*z2*z5*z6^6*z7^5+
    11*z3*z5*z6^6*z7^5+ 11*z4*z5*z6^6*z7^5- 3*z2*z6^7*z7^5- 3*z3*z6^7*z7^5-
    3*z4*z6^7*z7^5- 3*z5*z6^7*z7^5- 3*z6^8*z7^5+ 33*z2*z3*z4*z5*z6^3*z7^6-
    21*z2*z3*z4*z6^4*z7^6- 21*z2*z3*z5*z6^4*z7^6- 21*z2*z4*z5*z6^4*z7^6-
    21*z3*z4*z5*z6^4*z7^6+ 11*z2*z3*z6^5*z7^6+ 11*z2*z4*z6^5*z7^6+
    11*z3*z4*z6^5*z7^6+ 11*z2*z5*z6^5*z7^6+ 11*z3*z5*z6^5*z7^6+
    11*z4*z5*z6^5*z7^6- 3*z2*z6^6*z7^6- 3*z3*z6^6*z7^6- 3*z4*z6^6*z7^6-
    3*z5*z6^6*z7^6- 3*z6^7*z7^6+ 33*z2*z3*z4*z5*z6^2*z7^7- 21*z2*z3*z4*z6^3*z7^7-
    21*z2*z3*z5*z6^3*z7^7- 21*z2*z4*z5*z6^3*z7^7- 21*z3*z4*z5*z6^3*z7^7+
    11*z2*z3*z6^4*z7^7+ 11*z2*z4*z6^4*z7^7+ 11*z3*z4*z6^4*z7^7+
    11*z2*z5*z6^4*z7^7+ 11*z3*z5*z6^4*z7^7+ 11*z4*z5*z6^4*z7^7- 3*z2*z6^5*z7^7-
    3*z3*z6^5*z7^7- 3*z4*z6^5*z7^7- 3*z5*z6^5*z7^7- 3*z6^6*z7^7+
    33*z2*z3*z4*z5*z6*z7^8- 21*z2*z3*z4*z6^2*z7^8- 21*z2*z3*z5*z6^2*z7^8-
    21*z2*z4*z5*z6^2*z7^8- 21*z3*z4*z5*z6^2*z7^8+ 11*z2*z3*z6^3*z7^8+
    11*z2*z4*z6^3*z7^8+ 11*z3*z4*z6^3*z7^8+ 11*z2*z5*z6^3*z7^8+
    11*z3*z5*z6^3*z7^8+ 11*z4*z5*z6^3*z7^8- 3*z2*z6^4*z7^8- 3*z3*z6^4*z7^8-
    3*z4*z6^4*z7^8- 3*z5*z6^4*z7^8- 3*z6^5*z7^8- 22*z2*z3*z4*z5*z7^9-
    21*z2*z3*z4*z6*z7^9- 21*z2*z3*z5*z6*z7^9- 21*z2*z4*z5*z6*z7^9-
    21*z3*z4*z5*z6*z7^9+ 11*z2*z3*z6^2*z7^9+ 11*z2*z4*z6^2*z7^9+
    11*z3*z4*z6^2*z7^9+ 11*z2*z5*z6^2*z7^9+ 11*z3*z5*z6^2*z7^9+
    11*z4*z5*z6^2*z7^9- 3*z2*z6^3*z7^9- 3*z3*z6^3*z7^9- 3*z4*z6^3*z7^9-
    3*z5*z6^3*z7^9- 3*z6^4*z7^9+ z2*z3*z4*z7^10+ z2*z3*z5*z7^10+ z2*z4*z5*z7^10+
    z3*z4*z5*z7^10+ 11*z2*z3*z6*z7^10+ 11*z2*z4*z6*z7^10+ 11*z3*z4*z6*z7^10+
    11*z2*z5*z6*z7^10+ 11*z3*z5*z6*z7^10+ 11*z4*z5*z6*z7^10- 3*z2*z6^2*z7^10-
    3*z3*z6^2*z7^10- 3*z4*z6^2*z7^10- 3*z5*z6^2*z7^10- 3*z6^3*z7^10+
    10*z2*z3*z7^11+ 10*z2*z4*z7^11+ 10*z3*z4*z7^11+ 10*z2*z5*z7^11+
    10*z3*z5*z7^11+ 10*z4*z5*z7^11- 3*z2*z6*z7^11- 3*z3*z6*z7^11- 3*z4*z6*z7^11-
    3*z5*z6*z7^11- 3*z6^2*z7^11- 13*z2*z7^12- 13*z3*z7^12- 13*z4*z7^12-
    13*z5*z7^12- 3*z6*z7^12+ 10*z7^13+ 3363*z2*z3*z4*z5*z6^7- 2231*z2*z3*z4*z6^8-
    2231*z2*z3*z5*z6^8- 2231*z2*z4*z5*z6^8- 2231*z3*z4*z5*z6^8+ 1121*z2*z3*z6^9+
    1121*z2*z4*z6^9+ 1121*z3*z4*z6^9+ 1121*z2*z5*z6^9+ 1121*z3*z5*z6^9+
    1121*z4*z5*z6^9- 12*z2*z6^10- 12*z3*z6^10- 12*z4*z6^10- 12*z5*z6^10-
    1107*z6^11- 1187*z2*z3*z4*z5*z6^6*z7+ 1132*z2*z3*z4*z6^7*z7+
    1132*z2*z3*z5*z6^7*z7+ 1132*z2*z4*z5*z6^7*z7+ 1132*z3*z4*z5*z6^7*z7-
    1110*z2*z3*z6^8*z7- 1110*z2*z4*z6^8*z7- 1110*z3*z4*z6^8*z7-
    1110*z2*z5*z6^8*z7- 1110*z3*z5*z6^8*z7- 1110*z4*z5*z6^8*z7+ 1109*z2*z6^9*z7+
    1109*z3*z6^9*z7+ 1109*z4*z6^9*z7+ 1109*z5*z6^9*z7- 1119*z6^10*z7-
    1187*z2*z3*z4*z5*z6^5*z7^2+ 1132*z2*z3*z4*z6^6*z7^2+ 1132*z2*z3*z5*z6^6*z7^2+
    1132*z2*z4*z5*z6^6*z7^2+ 1132*z3*z4*z5*z6^6*z7^2- 1110*z2*z3*z6^7*z7^2-
    1110*z2*z4*z6^7*z7^2- 1110*z3*z4*z6^7*z7^2- 1110*z2*z5*z6^7*z7^2-
    1110*z3*z5*z6^7*z7^2- 1110*z4*z5*z6^7*z7^2+ 1109*z2*z6^8*z7^2+
    1109*z3*z6^8*z7^2+ 1109*z4*z6^8*z7^2+ 1109*z5*z6^8*z7^2- 1119*z6^9*z7^2-
    1187*z2*z3*z4*z5*z6^4*z7^3+ 1132*z2*z3*z4*z6^5*z7^3+ 1132*z2*z3*z5*z6^5*z7^3+
    1132*z2*z4*z5*z6^5*z7^3+ 1132*z3*z4*z5*z6^5*z7^3- 1110*z2*z3*z6^6*z7^3-
    1110*z2*z4*z6^6*z7^3- 1110*z3*z4*z6^6*z7^3- 1110*z2*z5*z6^6*z7^3-
    1110*z3*z5*z6^6*z7^3- 1110*z4*z5*z6^6*z7^3+ 1109*z2*z6^7*z7^3+
    1109*z3*z6^7*z7^3+ 1109*z4*z6^7*z7^3+ 1109*z5*z6^7*z7^3- 1119*z6^8*z7^3-
    1187*z2*z3*z4*z5*z6^3*z7^4+ 1132*z2*z3*z4*z6^4*z7^4+ 1132*z2*z3*z5*z6^4*z7^4+
    1132*z2*z4*z5*z6^4*z7^4+ 1132*z3*z4*z5*z6^4*z7^4- 1110*z2*z3*z6^5*z7^4-
    1110*z2*z4*z6^5*z7^4- 1110*z3*z4*z6^5*z7^4- 1110*z2*z5*z6^5*z7^4-
    1110*z3*z5*z6^5*z7^4- 1110*z4*z5*z6^5*z7^4+ 1109*z2*z6^6*z7^4+
    1109*z3*z6^6*z7^4+ 1109*z4*z6^6*z7^4+ 1109*z5*z6^6*z7^4- 1119*z6^7*z7^4-
    1187*z2*z3*z4*z5*z6^2*z7^5+ 1132*z2*z3*z4*z6^3*z7^5+ 1132*z2*z3*z5*z6^3*z7^5+
    1132*z2*z4*z5*z6^3*z7^5+ 1132*z3*z4*z5*z6^3*z7^5- 1110*z2*z3*z6^4*z7^5-
    1110*z2*z4*z6^4*z7^5- 1110*z3*z4*z6^4*z7^5- 1110*z2*z5*z6^4*z7^5-
    1110*z3*z5*z6^4*z7^5- 1110*z4*z5*z6^4*z7^5+ 1109*z2*z6^5*z7^5+
    1109*z3*z6^5*z7^5+ 1109*z4*z6^5*z7^5+ 1109*z5*z6^5*z7^5- 1119*z6^6*z7^5-
    1187*z2*z3*z4*z5*z6*z7^6+ 1132*z2*z3*z4*z6^2*z7^6+ 1132*z2*z3*z5*z6^2*z7^6+
    1132*z2*z4*z5*z6^2*z7^6+ 1132*z3*z4*z5*z6^2*z7^6- 1110*z2*z3*z6^3*z7^6-
    1110*z2*z4*z6^3*z7^6- 1110*z3*z4*z6^3*z7^6- 1110*z2*z5*z6^3*z7^6-
    1110*z3*z5*z6^3*z7^6- 1110*z4*z5*z6^3*z7^6+ 1109*z2*z6^4*z7^6+
    1109*z3*z6^4*z7^6+ 1109*z4*z6^4*z7^6+ 1109*z5*z6^4*z7^6- 1119*z6^5*z7^6+
    3363*z2*z3*z4*z5*z7^7+ 1132*z2*z3*z4*z6*z7^7+ 1132*z2*z3*z5*z6*z7^7+
    1132*z2*z4*z5*z6*z7^7+ 1132*z3*z4*z5*z6*z7^7- 1110*z2*z3*z6^2*z7^7-
    1110*z2*z4*z6^2*z7^7- 1110*z3*z4*z6^2*z7^7- 1110*z2*z5*z6^2*z7^7-
    1110*z3*z5*z6^2*z7^7- 1110*z4*z5*z6^2*z7^7+ 1109*z2*z6^3*z7^7+
    1109*z3*z6^3*z7^7+ 1109*z4*z6^3*z7^7+ 1109*z5*z6^3*z7^7- 1119*z6^4*z7^7-
    2231*z2*z3*z4*z7^8- 2231*z2*z3*z5*z7^8- 2231*z2*z4*z5*z7^8-
    2231*z3*z4*z5*z7^8- 1110*z2*z3*z6*z7^8- 1110*z2*z4*z6*z7^8-
    1110*z3*z4*z6*z7^8- 1110*z2*z5*z6*z7^8- 1110*z3*z5*z6*z7^8-
    1110*z4*z5*z6*z7^8+ 1109*z2*z6^2*z7^8+ 1109*z3*z6^2*z7^8+ 1109*z4*z6^2*z7^8+
    1109*z5*z6^2*z7^8- 1119*z6^3*z7^8+ 1121*z2*z3*z7^9+ 1121*z2*z4*z7^9+
    1121*z3*z4*z7^9+ 1121*z2*z5*z7^9+ 1121*z3*z5*z7^9+ 1121*z4*z5*z7^9+
    1109*z2*z6*z7^9+ 1109*z3*z6*z7^9+ 1109*z4*z6*z7^9+ 1109*z5*z6*z7^9-
    1119*z6^2*z7^9- 12*z2*z7^10- 12*z3*z7^10- 12*z4*z7^10- 12*z5*z7^10-
    1119*z6*z7^10- 1107*z7^11- 4484*z2*z3*z4*z5*z6^5- 1121*z2*z3*z4*z6^6-
    1121*z2*z3*z5*z6^6- 1121*z2*z4*z5*z6^6- 1121*z3*z4*z5*z6^6+ 3363*z2*z3*z6^7+
    3363*z2*z4*z6^7+ 3363*z3*z4*z6^7+ 3363*z2*z5*z6^7+ 3363*z3*z5*z6^7+
    3363*z4*z5*z6^7- 3374*z2*z6^8- 3374*z3*z6^8- 3374*z4*z6^8- 3374*z5*z6^8+
    2264*z6^9+ 1154*z2*z3*z4*z5*z6^4*z7+ 3396*z2*z3*z4*z6^5*z7+
    3396*z2*z3*z5*z6^5*z7+ 3396*z2*z4*z5*z6^5*z7+ 3396*z3*z4*z5*z6^5*z7+
    2242*z2*z3*z6^6*z7+ 2242*z2*z4*z6^6*z7+ 2242*z3*z4*z6^6*z7+
    2242*z2*z5*z6^6*z7+ 2242*z3*z5*z6^6*z7+ 2242*z4*z5*z6^6*z7- 11*z2*z6^7*z7-
    11*z3*z6^7*z7- 11*z4*z6^7*z7- 11*z5*z6^7*z7- 1110*z6^8*z7+
    1154*z2*z3*z4*z5*z6^3*z7^2+ 3396*z2*z3*z4*z6^4*z7^2+ 3396*z2*z3*z5*z6^4*z7^2+
    3396*z2*z4*z5*z6^4*z7^2+ 3396*z3*z4*z5*z6^4*z7^2+ 2242*z2*z3*z6^5*z7^2+
    2242*z2*z4*z6^5*z7^2+ 2242*z3*z4*z6^5*z7^2+ 2242*z2*z5*z6^5*z7^2+
    2242*z3*z5*z6^5*z7^2+ 2242*z4*z5*z6^5*z7^2- 11*z2*z6^6*z7^2- 11*z3*z6^6*z7^2-
    11*z4*z6^6*z7^2- 11*z5*z6^6*z7^2- 1110*z6^7*z7^2+ 1154*z2*z3*z4*z5*z6^2*z7^3+
    3396*z2*z3*z4*z6^3*z7^3+ 3396*z2*z3*z5*z6^3*z7^3+ 3396*z2*z4*z5*z6^3*z7^3+
    3396*z3*z4*z5*z6^3*z7^3+ 2242*z2*z3*z6^4*z7^3+ 2242*z2*z4*z6^4*z7^3+
    2242*z3*z4*z6^4*z7^3+ 2242*z2*z5*z6^4*z7^3+ 2242*z3*z5*z6^4*z7^3+
    2242*z4*z5*z6^4*z7^3- 11*z2*z6^5*z7^3- 11*z3*z6^5*z7^3- 11*z4*z6^5*z7^3-
    11*z5*z6^5*z7^3- 1110*z6^6*z7^3+ 1154*z2*z3*z4*z5*z6*z7^4+
    3396*z2*z3*z4*z6^2*z7^4+ 3396*z2*z3*z5*z6^2*z7^4+ 3396*z2*z4*z5*z6^2*z7^4+
    3396*z3*z4*z5*z6^2*z7^4+ 2242*z2*z3*z6^3*z7^4+ 2242*z2*z4*z6^3*z7^4+
    2242*z3*z4*z6^3*z7^4+ 2242*z2*z5*z6^3*z7^4+ 2242*z3*z5*z6^3*z7^4+
    2242*z4*z5*z6^3*z7^4- 11*z2*z6^4*z7^4- 11*z3*z6^4*z7^4- 11*z4*z6^4*z7^4-
    11*z5*z6^4*z7^4- 1110*z6^5*z7^4- 4484*z2*z3*z4*z5*z7^5+ 3396*z2*z3*z4*z6*z7^5+
    3396*z2*z3*z5*z6*z7^5+ 3396*z2*z4*z5*z6*z7^5+ 3396*z3*z4*z5*z6*z7^5+
    2242*z2*z3*z6^2*z7^5+ 2242*z2*z4*z6^2*z7^5+ 2242*z3*z4*z6^2*z7^5+
    2242*z2*z5*z6^2*z7^5+ 2242*z3*z5*z6^2*z7^5+ 2242*z4*z5*z6^2*z7^5-
    11*z2*z6^3*z7^5- 11*z3*z6^3*z7^5- 11*z4*z6^3*z7^5- 11*z5*z6^3*z7^5-
    1110*z6^4*z7^5- 1121*z2*z3*z4*z7^6- 1121*z2*z3*z5*z7^6- 1121*z2*z4*z5*z7^6-
    1121*z3*z4*z5*z7^6+ 2242*z2*z3*z6*z7^6+ 2242*z2*z4*z6*z7^6+
    2242*z3*z4*z6*z7^6+ 2242*z2*z5*z6*z7^6+ 2242*z3*z5*z6*z7^6+
    2242*z4*z5*z6*z7^6- 11*z2*z6^2*z7^6- 11*z3*z6^2*z7^6- 11*z4*z6^2*z7^6-
    11*z5*z6^2*z7^6- 1110*z6^3*z7^6+ 3363*z2*z3*z7^7+ 3363*z2*z4*z7^7+
    3363*z3*z4*z7^7+ 3363*z2*z5*z7^7+ 3363*z3*z5*z7^7+ 3363*z4*z5*z7^7-
    11*z2*z6*z7^7- 11*z3*z6*z7^7- 11*z4*z6*z7^7- 11*z5*z6*z7^7- 1110*z6^2*z7^7-
    3374*z2*z7^8- 3374*z3*z7^8- 3374*z4*z7^8- 3374*z5*z7^8- 1110*z6*z7^8+
    2264*z7^9+ 1755*z2*z3*z4*z5*z6^3+ 4495*z2*z3*z4*z6^4+ 4495*z2*z3*z5*z6^4+
    4495*z2*z4*z5*z6^4+ 4495*z3*z4*z5*z6^4+ 2740*z2*z3*z6^5+ 2740*z2*z4*z6^5+
    2740*z3*z4*z6^5+ 2740*z2*z5*z6^5+ 2740*z3*z5*z6^5+ 2740*z4*z5*z6^5+
    147*z2*z6^6+ 147*z3*z6^6+ 147*z4*z6^6+ 147*z5*z6^6+ 2604*z6^7-
    2887*z2*z3*z4*z5*z6^2*z7- 2751*z2*z3*z4*z6^3*z7- 2751*z2*z3*z5*z6^3*z7-
    2751*z2*z4*z5*z6^3*z7- 2751*z3*z4*z5*z6^3*z7- 1766*z2*z3*z6^4*z7-
    1766*z2*z4*z6^4*z7- 1766*z3*z4*z6^4*z7- 1766*z2*z5*z6^4*z7-
    1766*z3*z5*z6^4*z7- 1766*z4*z5*z6^4*z7+ 2887*z2*z6^5*z7+ 2887*z3*z6^5*z7+
    2887*z4*z6^5*z7+ 2887*z5*z6^5*z7+ 2751*z6^6*z7- 2887*z2*z3*z4*z5*z6*z7^2-
    2751*z2*z3*z4*z6^2*z7^2- 2751*z2*z3*z5*z6^2*z7^2- 2751*z2*z4*z5*z6^2*z7^2-
    2751*z3*z4*z5*z6^2*z7^2- 1766*z2*z3*z6^3*z7^2- 1766*z2*z4*z6^3*z7^2-
    1766*z3*z4*z6^3*z7^2- 1766*z2*z5*z6^3*z7^2- 1766*z3*z5*z6^3*z7^2-
    1766*z4*z5*z6^3*z7^2+ 2887*z2*z6^4*z7^2+ 2887*z3*z6^4*z7^2+ 2887*z4*z6^4*z7^2+
    2887*z5*z6^4*z7^2+ 2751*z6^5*z7^2+ 1755*z2*z3*z4*z5*z7^3-
    2751*z2*z3*z4*z6*z7^3- 2751*z2*z3*z5*z6*z7^3- 2751*z2*z4*z5*z6*z7^3-
    2751*z3*z4*z5*z6*z7^3- 1766*z2*z3*z6^2*z7^3- 1766*z2*z4*z6^2*z7^3-
    1766*z3*z4*z6^2*z7^3- 1766*z2*z5*z6^2*z7^3- 1766*z3*z5*z6^2*z7^3-
    1766*z4*z5*z6^2*z7^3+ 2887*z2*z6^3*z7^3+ 2887*z3*z6^3*z7^3+ 2887*z4*z6^3*z7^3+
    2887*z5*z6^3*z7^3+ 2751*z6^4*z7^3+ 4495*z2*z3*z4*z7^4+ 4495*z2*z3*z5*z7^4+
    4495*z2*z4*z5*z7^4+ 4495*z3*z4*z5*z7^4- 1766*z2*z3*z6*z7^4-
    1766*z2*z4*z6*z7^4- 1766*z3*z4*z6*z7^4- 1766*z2*z5*z6*z7^4-
    1766*z3*z5*z6*z7^4- 1766*z4*z5*z6*z7^4+ 2887*z2*z6^2*z7^4+ 2887*z3*z6^2*z7^4+
    2887*z4*z6^2*z7^4+ 2887*z5*z6^2*z7^4+ 2751*z6^3*z7^4+ 2740*z2*z3*z7^5+
    2740*z2*z4*z7^5+ 2740*z3*z4*z7^5+ 2740*z2*z5*z7^5+ 2740*z3*z5*z7^5+
    2740*z4*z5*z7^5+ 2887*z2*z6*z7^5+ 2887*z3*z6*z7^5+ 2887*z4*z6*z7^5+
    2887*z5*z6*z7^5+ 2751*z6^2*z7^5+ 147*z2*z7^6+ 147*z3*z7^6+ 147*z4*z7^6+
    147*z5*z7^6+ 2751*z6*z7^6+ 2604*z7^7+ 633*z2*z3*z4*z5*z6- 2988*z2*z3*z4*z6^2-
    2988*z2*z3*z5*z6^2- 2988*z2*z4*z5*z6^2- 2988*z3*z4*z5*z6^2+ 3588*z2*z3*z6^3+
    3588*z2*z4*z6^3+ 3588*z3*z4*z6^3+ 3588*z2*z5*z6^3+ 3588*z3*z5*z6^3+
    3588*z4*z5*z6^3+ 318*z2*z6^4+ 318*z3*z6^4+ 318*z4*z6^4+ 318*z5*z6^4+
    2037*z6^5+ 633*z2*z3*z4*z5*z7- 2355*z2*z3*z4*z6*z7- 2355*z2*z3*z5*z6*z7-
    2355*z2*z4*z5*z6*z7- 2355*z3*z4*z5*z6*z7+ 600*z2*z3*z6^2*z7+
    600*z2*z4*z6^2*z7+ 600*z3*z4*z6^2*z7+ 600*z2*z5*z6^2*z7+ 600*z3*z5*z6^2*z7+
    600*z4*z5*z6^2*z7+ 3906*z2*z6^3*z7+ 3906*z3*z6^3*z7+ 3906*z4*z6^3*z7+
    3906*z5*z6^3*z7+ 2355*z6^4*z7- 2988*z2*z3*z4*z7^2- 2988*z2*z3*z5*z7^2-
    2988*z2*z4*z5*z7^2- 2988*z3*z4*z5*z7^2+ 600*z2*z3*z6*z7^2+ 600*z2*z4*z6*z7^2+
    600*z3*z4*z6*z7^2+ 600*z2*z5*z6*z7^2+ 600*z3*z5*z6*z7^2+ 600*z4*z5*z6*z7^2+
    3906*z2*z6^2*z7^2+ 3906*z3*z6^2*z7^2+ 3906*z4*z6^2*z7^2+ 3906*z5*z6^2*z7^2+
    2355*z6^3*z7^2+ 3588*z2*z3*z7^3+ 3588*z2*z4*z7^3+ 3588*z3*z4*z7^3+
    3588*z2*z5*z7^3+ 3588*z3*z5*z7^3+ 3588*z4*z5*z7^3+ 3906*z2*z6*z7^3+
    3906*z3*z6*z7^3+ 3906*z4*z6*z7^3+ 3906*z5*z6*z7^3+ 2355*z6^2*z7^3+
    318*z2*z7^4+ 318*z3*z7^4+ 318*z4*z7^4+ 318*z5*z7^4+ 2355*z6*z7^4+ 2037*z7^5-
    1068*z2*z3*z4- 1068*z2*z3*z5- 1068*z2*z4*z5- 1068*z3*z4*z5- 2202*z2*z3*z6-
    2202*z2*z4*z6- 2202*z3*z4*z6- 2202*z2*z5*z6- 2202*z3*z5*z6- 2202*z4*z5*z6-
    1776*z2*z6^2- 1776*z3*z6^2- 1776*z4*z6^2- 1776*z5*z6^2+ 2166*z6^3-
    2202*z2*z3*z7- 2202*z2*z4*z7- 2202*z3*z4*z7- 2202*z2*z5*z7- 2202*z3*z5*z7-
    2202*z4*z5*z7- 3978*z2*z6*z7- 3978*z3*z6*z7- 3978*z4*z6*z7- 3978*z5*z6*z7+
    390*z6^2*z7- 1776*z2*z7^2- 1776*z3*z7^2- 1776*z4*z7^2- 1776*z5*z7^2+
    390*z6*z7^2+ 2166*z7^3+ 3538*z2+ 3538*z3+ 3538*z4+ 3538*z5- 1169*z6- 1169*z7,
    z1*z2^2*z3^2*z4^2*z5^2*z6^2*z7^2- 2250*z1*z2^2*z3^2*z4^2*z5^2*z6^2-
    2250*z1*z2^2*z3^2*z4^2*z5^2*z7^2- 2250*z1*z2^2*z3^2*z4^2*z6^2*z7^2-
    2250*z1*z2^2*z3^2*z5^2*z6^2*z7^2- 2250*z1*z2^2*z4^2*z5^2*z6^2*z7^2-
    2250*z1*z3^2*z4^2*z5^2*z6^2*z7^2+ 3938*z1*z2^2*z3^2*z4^2*z5^2+
    3938*z1*z2^2*z3^2*z4^2*z6^2+ 3938*z1*z2^2*z3^2*z5^2*z6^2+
    3938*z1*z2^2*z4^2*z5^2*z6^2+ 3938*z1*z3^2*z4^2*z5^2*z6^2+
    3938*z1*z2^2*z3^2*z4^2*z7^2+ 3938*z1*z2^2*z3^2*z5^2*z7^2+
    3938*z1*z2^2*z4^2*z5^2*z7^2+ 3938*z1*z3^2*z4^2*z5^2*z7^2+
    3938*z1*z2^2*z3^2*z6^2*z7^2+ 3938*z1*z2^2*z4^2*z6^2*z7^2+
    3938*z1*z3^2*z4^2*z6^2*z7^2+ 3938*z1*z2^2*z5^2*z6^2*z7^2+
    3938*z1*z3^2*z5^2*z6^2*z7^2+ 3938*z1*z4^2*z5^2*z6^2*z7^2-
    3516*z1*z2^2*z3^2*z4^2- 3516*z1*z2^2*z3^2*z5^2- 3516*z1*z2^2*z4^2*z5^2-
    3516*z1*z3^2*z4^2*z5^2- 3516*z1*z2^2*z3^2*z6^2- 3516*z1*z2^2*z4^2*z6^2-
    3516*z1*z3^2*z4^2*z6^2- 3516*z1*z2^2*z5^2*z6^2- 3516*z1*z3^2*z5^2*z6^2-
    3516*z1*z4^2*z5^2*z6^2- 3516*z1*z2^2*z3^2*z7^2- 3516*z1*z2^2*z4^2*z7^2-
    3516*z1*z3^2*z4^2*z7^2- 3516*z1*z2^2*z5^2*z7^2- 3516*z1*z3^2*z5^2*z7^2-
    3516*z1*z4^2*z5^2*z7^2- 3516*z1*z2^2*z6^2*z7^2- 3516*z1*z3^2*z6^2*z7^2-
    3516*z1*z4^2*z6^2*z7^2- 3516*z1*z5^2*z6^2*z7^2- 879*z1*z2^2*z3^2-
    879*z1*z2^2*z4^2- 879*z1*z3^2*z4^2- 879*z1*z2^2*z5^2- 879*z1*z3^2*z5^2-
    879*z1*z4^2*z5^2- 879*z1*z2^2*z6^2- 879*z1*z3^2*z6^2- 879*z1*z4^2*z6^2-
    879*z1*z5^2*z6^2- 879*z1*z2^2*z7^2- 879*z1*z3^2*z7^2- 879*z1*z4^2*z7^2-
    879*z1*z5^2*z7^2- 879*z1*z6^2*z7^2- 2470*z1*z2^2- 2470*z1*z3^2- 2470*z1*z4^2-
    2470*z1*z5^2- 2470*z1*z6^2- 2470*z1*z7^2+ 3883*z1- 1, - z2- z3- z4- z5- z6-
    z7+ z8, - z2*z3- z2*z4- z3*z4- z2*z5- z3*z5- z4*z5- z2*z6- z3*z6- z4*z6-
    z5*z6- z2*z7- z3*z7- z4*z7- z5*z7- z6*z7+ z9, - z2*z3*z4- z2*z3*z5- z2*z4*z5-
    z3*z4*z5- z2*z3*z6- z2*z4*z6- z3*z4*z6- z2*z5*z6- z3*z5*z6- z4*z5*z6-
    z2*z3*z7- z2*z4*z7- z3*z4*z7- z2*z5*z7- z3*z5*z7- z4*z5*z7- z2*z6*z7-
    z3*z6*z7- z4*z6*z7- z5*z6*z7+ z10, - z2*z3*z4*z5- z2*z3*z4*z6- z2*z3*z5*z6-
    z2*z4*z5*z6- z3*z4*z5*z6- z2*z3*z4*z7- z2*z3*z5*z7- z2*z4*z5*z7- z3*z4*z5*z7-
    z2*z3*z6*z7- z2*z4*z6*z7- z3*z4*z6*z7- z2*z5*z6*z7- z3*z5*z6*z7- z4*z5*z6*z7+
    z11, - z2*z3*z4*z5*z6- z2*z3*z4*z5*z7- z2*z3*z4*z6*z7- z2*z3*z5*z6*z7-
    z2*z4*z5*z6*z7- z3*z4*z5*z6*z7+ z12, - z2*z3*z4*z5*z6*z7+ z13
    )
  R, id
end
