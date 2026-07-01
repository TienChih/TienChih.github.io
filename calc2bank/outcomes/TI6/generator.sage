class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        from sage.symbolic.integration.integral import indefinite_integral
        var("u a b theta p")
        
        
        
        
        
        
        Rads = [sqrt( a^2+b^2*x^p ), sqrt( a^2-b^2*x^p ), sqrt( -a^2+b^2*x^p )]
        shuffle(Rads)

        P1 = [1,2, randrange(1,2)]
        shuffle(P1)
        P2 = [1,2, randrange(1,2)]
        shuffle(P2)
        S1 = [1,-1,choice([-1,1])]
        shuffle(S1)
        S2 = [1,-1,choice([-1,1])]
        shuffle(S2)

        tasks=[]


        for i in range (3):
            if Rads[i] == sqrt( a^p+b^p*x^p ) and S1[i] == 1 and P1[i]==2:
                s2 = -1
            else:    
                s2 = S2[i]
            coeff = [1,2,3,4,5] 
            shuffle(coeff)   
            a1 = coeff[0]
            b1 = coeff[1]
            r1(x,a,b,p) = Rads[i]
            
            s1 = S1[i]
            p1 = P1[i]
            p2 = P2[i]

            f(x) = randrange(2,6)*(r1(x,a1,b1,p1)^s1)*x^(s2*p2)

            
            F(x) = integral(f(x),x)
                        
            

            
            tasks +=[{
                "fx": f(x),
                "Fx": F(x),
            }
            ]



        shuffle(tasks)   
        
        
        scenario = randrange(0,8)

        f2(x) = choice([sin(x), cos(x), e^x])

        if scenario == 0:
            k2 = Rational(randrange(2,6)^choice([-1,1]))
            c2 = randrange(1,4)
            m = randrange(2,4)
            g(x) = k2*f2(c2*x^(1/m))
        if scenario == 1:
            m = randrange(1,3)
            k2 = Rational(randrange(2,6)^choice([-1,1]))
            c2 = randrange(1,4)
            fI(x) = choice([arcsin(x), arccos(x), ln(x)])     
            
            g(x) = k2*(fI(c2*x))^m

        if scenario == 2:
            k2 = Rational(randrange(2,6)^choice([-1,1]))
            c2 = randrange(1,4)
            h(x) = choice([e^x, ln(x), sin(x), cos(x), tan(x), (x^(choice([-1,1])*randrange(2,4)))^choice([-1,1]) ])
            hp(x) = h(x).diff(x)
            m = randrange(1,3)
            g(x) = k2*f2(c2*h(x))*hp(x)*(h(x))^m
  
        
        
        if scenario == 3:
            m = randrange(2,5)
            U(x) = x^(1/m)
            g(x) = randrange(1,6)/(U(x)^(randrange(2,m+1)) - U(x))  
            
        if scenario == 4:
            U(x) = x^(1/randrange(2,6)) 
            g(x) = randrange(1,6)/( (U(x) +randrange(1,6)*choice([-1,1]))*(U(x) +randrange(1,6)*choice([-1,1]) ) ).expand()      
        
        if scenario == 5:
            U(x) = sqrt( randrange(1,4)^2 + randrange(1,4)*x^(1/2)  )
            g(x) = randrange(1,6)* (U(x)/x^choice([1,2]))  
            
        if scenario == 6:
            U(x) = randrange(1,6)*x^(1/randrange(2,5))
            g(x) = randrange(1,6)* arctan(U(x))  

        if scenario == 7:
            U(x) = randrange(1,6)*x^(-1/randrange(1,5))
            g(x) = randrange(1,6)* arctan(U(x))    
            
        g2(x) = choice([g(x),g(x), randrange(1,6)* arctan(randrange(1,6)*x^(1/randrange(2,5))),randrange(1,6)* arctan(randrange(1,6)*x^(-1/randrange(1,5)))  ])    

        G(x) = integral(g2(x),x)    
                    
        tasks +=[{
                "fx": g2(x),
                "Fx": G(x),
            }
            ]
            
            
        return {"tasks": tasks}
        
        
    
      
        
        
            
           
