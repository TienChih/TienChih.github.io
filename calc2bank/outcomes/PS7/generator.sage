class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        tasks = []
        
        # e^x, sin(x), cos(x)
        selection = randrange(0,3)

        coeff = 1
        P = randrange(1,3)
        outside = choice([-1,0,1])
        N = [2,3,5,7,11]
        shuffle(N)
        Input = choice([-1,1])*N[0]/N[1]
        C = randrange(1,6)*choice([-1,1])
        
        
        
        k0 = 0
        k = [0,0,0,0,0]
        factvalue = [0,0,0,0,0]
        num = [0,0,0,0,0]


        if selection == 0:
            a(x, n) = x^n/factorial(n)
            A(x, n) = C* x^(P*n+outside)/factorial(n)
            f(x) = e^x

            k[0] = k0
            for i in range(4):
                k[i+1] = k[i]+1
            for i in range(5):
                factvalue[i] = k[i]
                num[i] = (C*  Input^(k[i]*P+outside)) 
        
        if selection == 1:
            a(x, n) = (-1)^n*x^(2*n+1)/factorial(2*n+1)
            A(x, n) = (-1)^n* C* x^(2*P*n+P+outside)/factorial(2*n+1)
            f(x) = sin(x)

            k[0] = k0
            for i in range(4):
                k[i+1] = k[i]+1
            for i in range(5):
                factvalue[i] = 2*k[i]+1
                num[i] = C* Input^(2*P*k[i]+P+outside) *(-1)^k[i]
        
        if selection == 2:
            Fact = True
            a(x, n) = (-1)^n*x^(2*n)/factorial(2*n)
            A(x, n) = (-1)^n* C* x^(2*P*n+outside)/factorial(2*n)
            f(x) = cos(x)

            k[0] = k0
            for i in range(4):
                k[i+1] = k[i]+1
            for i in range(5):
                factvalue[i] = 2*k[i]
                num[i] = C* Input^(2*P*k[i]+outside) *(-1)^k[i]

                       
        
        F(x) = C*(x^outside)*f(x^P)  
        Limit = F(Input) 

        tasks+=[{
            "fx": f(x),
            "ax": a(x,n),
            "Fx": F(x).simplify(),
            "Ax": A(x,n).simplify(),
            "k0": k0, 
            "Input": Input,
            "Limit": Limit,
            "num0": num[0].numerator().factor(),
            "num1": num[1].numerator().factor(),
            "num2": num[2].numerator().factor(),       
            "num3": num[3].numerator().factor(),
            "num4": num[4].numerator().factor(),
            "dem0": num[0].denominator().factor(),
            "dem1": num[1].denominator().factor(),
            "dem2": num[2].denominator().factor(),       
            "dem3": num[3].denominator().factor(),
            "dem4": num[4].denominator().factor(),
            "fv0": factvalue[0],
            "fv1": factvalue[1],
            "fv2": factvalue[2],       
            "fv3": factvalue[3],
            "fv4": factvalue[4],
        }
        ]
        
        shuffle(tasks)

        

        return {"tasks": tasks}
        
        
        '''        
        if selection == 1:
            f(x) = sin(x)
            a(x, n) = (-1)^(n)*x^(2*n+1)/factorial(2*n+1)
            A(x, n) = (-1)^(n)*x^(P*2*n+P+outside)*(coeff)^(2*n+1)/factorial(2*n+1)
            if alt == -1:
                A(x, n) = -1*A(x,n)
        if selection == 2:
            if outside != -1:
                f(x) = cos(x)
                a(x, n) = (-1)^(n)*x^(2*n)/factorial(2*n)
                A(x, n) = (-1)^(n)*x^(P*2*n+outside)*(coeff)^(2*n)/factorial(2*n)
                if alt == -1:
                    A(x, n) = -1*A(x,n)
            else:    
                f(x) = cos(x) -1
                a(x, n) = (-1)^(n)*x^(2*n)/factorial(2*n)
                A(x, n) = (-1)^(n)*x^(P*2*n+outside)*(coeff)^(2*n)/factorial(2*n)
                if alt == -1:
                    A(x, n) = -1*A(x,n)
                k0 = 1    
                k1 = 1
        '''        
            
        



