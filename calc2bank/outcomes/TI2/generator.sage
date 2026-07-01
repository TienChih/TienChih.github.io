class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        from sage.symbolic.integration.integral import indefinite_integral
        var("u")
        
        
        
        
        
        
        functions = [e^x, sin(x), cos(x)]
        shuffle(functions)

        f1(x) = functions[0]
        f2(x) = functions[1]

        c1 = randrange(2,6)
        k1 = Rational(randrange(2,6)^choice([-1,1])  )
        if f1(x) == e^x:
            a1 = Rational(randrange(-2,3)/c1)
            b1 = Rational((a1+randrange(1,6))/c1)
        else:
            a1 = (choice([-1,1,0])*pi/choice([2,3,4,6,1]))/c1
            b1 = (2*pi + pi/choice([3,4,6]))/c1    
        
        
        f(x) = k1*f1(c1*x)*x^choice([2,3])
        Int1 = integral(f(x),x,a1,b1)

        k2 = Rational(randrange(2,6)^choice([-1,1]))
        c2 = randrange(1,4)
        scenario = randrange(0,2)

        if scenario == 0:
            m = randrange(2,4)
            g(x) = k2*f2(c2*x^(1/m))
            U = c2*x^(1/m)
            dx = m*u^(m-1)/(c2^m)
        if scenario == 1:
            m = randrange(1,3)
            if f2(x) == sin(x):
                fI(x) = arcsin(x)
            if f2(x) == cos(x):
                fI(x) = arccos(x)
            if f2(x) == e^x:
                fI(x) = ln(x)        
            
            g(x) = k2*(fI(c2*x))^m
            U = fI(c2*x)
            dx = f2(u).diff(u)/c2

        if scenario == 2:
            h(x) = choice([e^x, ln(x), sin(x), cos(x), tan(x), (x^(choice([-1,1])*randrange(2,4)))^choice([-1,1]) ])
            hp(x) = h(x).diff(x)
            m = randrange(1,3)
            g(x) = k2*f2(c2*h(x))*hp(x)*(h(x))^m
            U = c2*h(x)
            dx = 1/(c2*h(x).diff(x))
        
                    
        Int2 = integral(g(x),x)          
                    
                    
                    
        return {
            "fx": f(x),
            "a1": a1,
            "b1": b1,
            "Int1": Int1,
            "gx": g(x),
            "Int2": Int2,
            "U": U,
            "dx": dx,
            
        }
        
        
    
      
        
        
            
           
