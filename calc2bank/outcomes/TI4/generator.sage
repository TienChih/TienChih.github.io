class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        from sage.symbolic.integration.integral import indefinite_integral
        var("u a b theta")
        
        
        
        
        
        
        Rads = [sqrt( a^2+b^2*x^2 ), sqrt( a^2-b^2*x^2 ), sqrt( -a^2+b^2*x^2 )]
        shuffle(Rads)


        r1(x,a,b) = Rads[0]
        r2(x,a,b) = Rads[1]

        coeff = [1,2,3,4,5]
        shuffle(coeff)
        a1=coeff[0]
        b1=coeff[1]
        a2=coeff[2]
        b2=coeff[3]
        tasks = []

        for i in range (2):
            if i == 1 and Rads[i] == sqrt( a^2+b^2*x^2 ):
                r1(x,a,b) = Rads[2]
            else:    
                r1(x,a,b) = Rads[i]
            a1 = coeff[2*i]
            b1 = coeff[2*i+1]
            if r1(x,a,b) == sqrt( a^2+b^2*x^2 ):
                sub1(theta) = a1/b1*tan(theta)
                dx1 = (a1/b1*tan(theta)).diff(theta)
                R1 = a1*sec(theta)
            if r1(x,a,b) == sqrt( a^2-b^2*x^2 ):
                sub1(theta) = a1/b1*sin(theta)
                dx1 = (a1/b1*sin(theta)).diff(theta)
                R1 = a1*cos(theta)
            if r1(x,a,b) == sqrt( -a^2+b^2*x^2 ):
                sub1(theta) = a1/b1*sec(theta)
                dx1 = (a1/b1*sec(theta)).diff(theta)   
                R1 = a1*tan(theta) 
            
            scenario = randrange(0,3)

            if scenario == 0:
                P = choice([0,2])
                f1(x) = x^P*r1(x,a1,b1)
                ft1(theta) = sub1(theta)^P*R1*dx1
            if scenario == 1:
                P = choice([0,2])
                f1(x) = x^P/r1(x,a1,b1)
                ft1(theta) = (sub1(theta)^P/R1)*dx1    
            if scenario == 2:
                P = choice([1,2])
                f1(x) = r1(x,a1,b1)/x^P
                ft1(theta) = R1*dx1/sub1(theta)^P    
            
            Ft1(theta) = integral(ft1(theta), theta)    
            F1(x) = integral(f1(x),x)
                        
            bounds = [pi/6, pi/4, pi/3]
            shuffle(bounds)
            
            low = min([bounds[0], bounds[1]])
            high = max([bounds[0], bounds[1]])

            lowx = sub1(low)
            highx = sub1(high)

            Int1 = integral(ft1(theta), theta, low, high)
            
            if i == 0:
               inttype = "definite"
            else:
               inttype = "indefinite"    

            
            tasks +=[{
                inttype: True,
                "fx": f1(x),
                "sub": sub1(theta),
                "ft": ft1(theta),
                "lowx": lowx,
                "highx": highx,
                "lowt": low,
                "hight": high,
                "Int": Int1,
                "Fx": F1(x),
                "Ft": Ft1(theta),
            }
            ]



        shuffle(tasks)            
                    
                    
        return {"tasks": tasks}
        
        
    
      
        
        
            
           
