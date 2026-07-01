class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        from sage.symbolic.integration.integral import indefinite_integral
        var("u a b theta")
        
        
        
        
        
        
        C = [0,1,2,3]
        shuffle(C)
        
        d1(x) = (x+choice([-1,1])*C[0])
        D = [x+choice([-1,1])*C[1], (x+choice([-1,1])*randrange(0,3))^2 + +randrange(1,4)^2]
        j = randrange(0,2)

        d2(x) = D[j]

        shuffle(C)

        N1 = randrange(1,4)*choice([-1,1])
        N2 = randrange(1,4)*choice([-1,1])

        C2 = [0,1,2]
        shuffle(C2)

        if j == 0:
            N3 = randrange(1,4)*choice([-1,1])
            poly = randrange(1,6)*x*choice([-1,1]) + randrange(1,6)*choice([-1,1])
        else:
            N3 = C2[0]*choice([-1,1])*x + C2[1]*choice([-1,1])
            poly = 0

        
        shuffle(C2)    
        denom = (d1(x)^2*d2(x)).factor()
        num = (denom*poly+(N1*d1(x)*d2(x) + N2*d2(x)+N3*d1(x)^2 )).expand()    

        f(x) = num/denom

        F(x) = integral(f(x), x)


        shuffle(C)

        j = randrange(0,5)

        if j == 0:
            U(x) = choice([sin(x), cos(x), tan(x), sec(x), e^x, ln(x), arcsin(x), arctan(x)])
            f2(x) = randrange(1,6)* U(x).diff(x)*U(x)^choice([3,4])/( (U(x) +C[0]*choice([-1,1]))*(U(x) +C[1]*choice([-1,1]) ) ).expand()
        if j == 1:
            U(x) = x^(1/randrange(2,6)) 
            f2(x) = randrange(1,6)/( (U(x) +C[0]*choice([-1,1]))*(U(x) +C[1]*choice([-1,1]) ) ).expand()   

        if j == 2:
            U(x) = sqrt( randrange(1,4)^2*x + randrange(1,4)^2  )
            f2(x) = randrange(1,6)*  U(x)/x^(choice([1,2]))   
        
        if j == 3:
            U(x) = sqrt( randrange(1,4)^2 + randrange(1,4)*x^(1/2)  )
            f2(x) = randrange(1,6)* (U(x)/x^choice([1,2])) 
        
        if j == 4:
            m = randrange(2,5)
            U(x) = x^(1/m)
            f2(x) = randrange(1,6)/(U(x)^(randrange(2,m+1)) - U(x))   

        F2(x) = integral(f2(x),x)            
                    
        return {
            "num": num,
            "denom": denom,
            "poly": poly,
            "PF": (num/denom).partial_fraction(),
            "Fx": F(x),
            "f2x": f2(x),
            "F2x": F2(x),
            "U": U(x),

            
        }
        
        
    
      
        
        
            
           
