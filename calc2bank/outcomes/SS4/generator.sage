class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        
        
        scenarios = ["p", "exp", "ln", ]
        
        dummy = True

        while(dummy):
            shuffle(scenarios)
            dummy = scenarios[1]=="exp"
        
        
        
        
        tasks = []
        
        if scenarios[0] == "p":
            power = randrange(3,6)
            roots = [1,2,3,4,5]
            shuffle(roots)
            functions = [randrange(1,5)/( ( (n+roots[0])*(n+roots[1]) ).expand() ), 
            randrange(1,5)/( ( (n+roots[0])^2+randrange(1,6) ).expand() ), 
            randrange(2,6)*sqrt(n+randrange(2,6)^2)/n^2, 
            randrange(2,6)*sqrt(randrange(2,6)^2* n+1)/n^2,]
            a(n) = choice(functions)
            k1 = randrange(2,6)
            converges = True
            F(x) = indefinite_integral(a(x),x)
            tasks+=[{
                "k0":k1,
                "summand": a(n),
                "integrand": a(x),
                "integral": F(x),
                "limit": integral(a(x),x, k1, oo),
                "up": F(c),
                "down": F(k1),
                "converges":True,
            }
            ]
        if scenarios[0] == "exp":
            power = randrange(1,4)
            power2 = 1/randrange(1,3)
            functions = [randrange(1,5)*(n^(power-1) )*(n^power)^randrange(1,3)*e^(-1*randrange(1,5)*n^power) , 
            randrange(1,5)/(e^n+randrange(1,6)),
            randrange(2,6)*(e^(1/n^power2))*((1/n^2)*(1/n^power2)^randrange(1,3))]
            a(n) = choice(functions)
            k1 = randrange(1,6)
            converges = True
            F(x) = integral(a(x),x, algorithm="sympy").expand()
                    
            tasks+=[{
                "k0":k1,
                "summand": a(n),
                "integrand": a(x),
                "integral": F(x),
                "limit": limit(F(x),x,oo)-F(k1),
                "up": F(c),
                "down": F(k1),
                "converges":True,
            }
            ]    

        if scenarios[0] == "ln":
            power = randrange(2,4)
            functions = [randrange(2,5)*ln(n)/(n)^power , 
            randrange(2,5)*ln(n)^(-1*power)/n ]
            a(n) = choice(functions)
            k1 = randrange(2,6)
            converges = True
            F(x) = integral(a(x),x, algorithm="sympy").expand()
                    
            tasks+=[{
                "k0":k1,
                "summand": a(n),
                "integrand": a(x),
                "integral": F(x),
                "limit": limit(F(x),x,oo)-F(k1),
                "up": F(c),
                "down": F(k1),
                "converges":True,
            }
            ]    
           
        #Diverges

        if scenarios[1] == "p":
            power = randrange(3,6)
            roots = [1,2,3,4,5]
            shuffle(roots)
            functions2 = [randrange(1,5)/( ( (sqrt(n)+roots[0])*(sqrt(n)+roots[1]) ).expand() ), 
            randrange(1,5)/( ( (sqrt(n)+roots[0])^2+randrange(1,6) ).expand() ), 
            randrange(2,6)*sqrt(n+randrange(2,6)^2)/n, 
            randrange(2,6)*sqrt(randrange(2,6)^2*n+1)/n,]
            a2(n) = choice(functions2)
            k2 = randrange(2,6)
            F2(x) = indefinite_integral(a2(x),x)
            tasks+=[{
                "k0":k2,
                "summand": a2(n),
                "integrand": a2(x),
                "integral": F2(x),
                "up": F2(c),
                "down": F2(k2),
                "diverges":True,
            }
            ]

        if scenarios[1] == "ln":
            power = 1/randrange(2,4)
            functions = [randrange(2,5)*ln(n)/(n)^power , 
            randrange(2,5)*ln(n)^(-1*power)/n ]
            a(n) = choice(functions)
            k1 = randrange(3,6)
            diverges = True
            F(x) = integral(a(x),x).expand()
                    
            tasks+=[{
                "k0":k1,
                "summand": a(n),
                "integrand": a(x),
                "integral": F(x),
                "up": F(c),
                "down": F(k1),
                "diverges":True,
            }
            ]   
        
        
        

        shuffle(tasks)

        

        return {"tasks": tasks}
