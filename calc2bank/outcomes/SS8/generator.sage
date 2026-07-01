class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        
        

        scenarios = ["root", "ratio" ] # ["ratio", "root"]
        shuffle(scenarios)

        tasks = []

        #Ratio
        distractions = [ randrange(1,6)*(n+randrange(1,4))^randrange(1,4), 
        randrange(1,6)*n^randrange(1,4)+randrange(1,4), 
        ln(randrange(1,6)*n^randrange(1,4)+randrange(1,6)),
        arctan(randrange(1,3)*n+randrange(1,6))
        ]

        shuffle(distractions)

        number = randrange(1,3)

        a(n)=1
        for i in range(number):
            a(n) = a(n)*(distractions[i])^choice([-1,1]) 
        
            
        A = randrange(2,6)
        B = randrange(A+1, A+6)
        C = randrange(1,3)

        Ratios = [ A^n, (Rational(B/A))^n, factorial(n)/B^n, n^(C*n)/(factorial(n))^C, n^n/B^n, n^(C*n)/factorial(C*n) ]
        shuffle(Ratios)
        
        if scenarios[0] == "ratio":
            a(n) = a(n)* (Ratios[0])^(-1)
            converges = True
            diverges = False
        else:
            a(n) = a(n)* (Ratios[0])
            diverges = True
            converges = False

        combine = (a(n+1)/a(n))
        power = choice([-1,1])
        a(n) = a(n) * power^n      

        ar(n) = 1/a(n)
        

        Lim = limit(combine, n, oo)

        tasks+=[{
            "an": a(n).simplify(),
            "anp1": a(n+1).simplify(),
            "ar": ar(n).simplify(),
            "combine": combine,
            "converges":converges,
            "diverges":diverges,
            "limit": Lim,
            "ratio": True,
        }
        ]
        
        C = randrange(1,6)
        p = randrange(1,3)
        asymps = [ (C*n^p+randrange(1,6))/(C*n^p+randrange(1,6)), 
        ln(C*n^p+randrange(1,6))/ln(C*n^p+randrange(1,6)),
        ]

        interiors = [arctan(n^randrange(1,4)), arccos(1/n^randrange(1,4)), (1+randrange(1,5)/n)^(randrange(1,5)*n) ]
        
        if scenarios[0] == "root":
            a(n) = choice(asymps)*(choice(interiors))^(-1)
            converges = True
            diverges = False
        if scenarios[1] == "root":
            a(n) = choice(asymps)*(choice(interiors))
            converges = False
            diverges = True


        
        absa(n) = a(n)
        a(n) = (absa(n)*choice([-1,1])^n )^n    

        Lim = limit(absa(n), n, oo)

        tasks+=[{
            "an": a(n).simplify(),
            "absan": absa(n).simplify(),
            "combine": combine,
            "converges":converges,
            "diverges":diverges,
            "limit": Lim,
            "root": True,
            "scenarios":scenarios,
        }
        ]
        
        shuffle(tasks)

        

        return {"tasks": tasks}



