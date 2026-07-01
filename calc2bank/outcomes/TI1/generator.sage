class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        from sage.symbolic.integration.integral import indefinite_integral
        var("c t a b k x y z")
        
        
        u1 = choice([sin(x^randrange(2,5)), sin(1/x), cos(x^randrange(2,5)), cos(1/x), sin(e^x), cos(e^x), sin(sqrt(x)), cos(sqrt(x)), e^(x^randrange(2,5)), e^(1/x), e^(sin(x)), e^(cos(x)), sin(ln(x)), cos(ln(x))])
        v1 = r"\text{We may use substitution.  Let }u="
        f1(x) = choice([x, sqrt(x), 1/x, sin(x), cos(x), e^x])
        Fu1(x) = randrange(2,5)*f1(u1)
        fu1(x) = Fu1(x).diff(x)
        
        
                    
        v2 = r"\text{We may use substitution with some replacement.  Let }u="
        scenario = randrange(0,2)
        
        if scenario == 0:
            u2 = choice([-1,1])*(x - randrange(1,6))
            fu2(x) = randrange(2,5)*choice([x*sqrt(u2), x/sqrt(u2)])
        if scenario == 1:
            u2 = choice([-1,1])*(x^2 - randrange(1,6))
            n = randrange(1,3)*2+1        
            fu2(x) = randrange(2,5)*choice([x^n*(sqrt(u2)), x^n/sqrt(u2)])            
            
        Fu2(x)= indefinite_integral(fu2(x),x)    
                    
        u3 = r"\text{Substitution is not neccesary}"
        v3 = " "            
        fu3(x) = choice( [(x^randrange(2,4)+randrange(2,4))^2/choice([x, sqrt(x)]), (e^(randrange(2,4)*x)+randrange(2,4))^2/e^x]  )            
        Fu3(x)= indefinite_integral(fu3(x),x)
                    
        U = [u1, u2, u3]
        V = [v1, v2, v3]
        f = [fu1(x), fu2(x), fu3(x)]
        F = [Fu1(x), Fu2(x), Fu3(x)]
        
        N = [0,1,2]
        shuffle(N)            
                    
                    
                    
        return {
            "f0": f[N[0]],
            "F0": F[N[0]],
            "u0": U[N[0]],
            "v0": V[N[0]],
            "f1": f[N[1]],
            "F1": F[N[1]],
            "u1": U[N[1]],
            "v1": V[N[1]],
            "f2": f[N[2]],
            "F2": F[N[2]],
            "u2": U[N[2]],
            "v2": V[N[2]],
            
        }
        
        
    
      
        
        
            
           
