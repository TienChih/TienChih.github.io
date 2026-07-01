class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        tasks = []
        
        a = randrange(-9,10)
        distractions = [ sqrt(randrange(1,6)*n+randrange(1,6)), 
         ln(randrange(1,6)*n+randrange(2,6)), 
         randrange(1,6)*n^randrange(1,6)+randrange(1,6),
         randrange(1,6)^n,
         factorial(n),   
         (sin(pi*n/choice([1,2,3,4,6]))^randrange(1,6)),
         (cos(pi*n/choice([1,2,3,4,6]))^randrange(1,6)),
        ]
        

        In = 0
        c1 = 0
        while(In == c1):
            c1  = randrange(0,7)
            In = randrange(0,5)

        C(n) = distractions[c1]/distractions[In]
        A(n,x) = C(n)*(x-a)^n

        m = randrange(4,7)
        Tm(x) = 0
        for i in range(m+1):
            Tm(x) = A(i,x) + Tm(x)
        
        M = randrange(10,20)


           

        tasks+=[{
            "Cn": C(n),
            "An": A(n,x),
            "m": m,
            "Tm": Tm(x),
            "CM": C(M), 
            "M": M,    
            "a": a,    
                    
        }
        ]
        
        shuffle(tasks)

        

        return {"tasks": tasks}



