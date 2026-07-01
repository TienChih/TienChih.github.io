class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        tasks = []
        
        # e^x, sin(x), cos(x)
        selection = randrange(0,3)

        coeff = 1
        alt = choice([-1,1])
        P = randrange(1,3)
        outside = choice([-1,0,1])
        K = randrange(2,6)


        Input = 1/randrange(2,4)*choice([-1,1])
        
        
        
        k0 = 0
        k1 = 0

        if selection == 0:
            if outside != -1:
                f(x) = e^x
                a(x, n) = x^n/factorial(n)
                A(x, n) = x^(P*n+outside)*(coeff)^n/factorial(n)
                if alt == -1:
                    A(x, n) = A(x,n)*(-1)^n
            else:
                k0 = 1
                k1 = 1
                f(x) = e^x -1
                a(x, n) = x^n/factorial(n)
                A(x, n) = x^(P*n+outside)*(coeff)^n/factorial(n)
                if alt == -1:
                    A(x, n) = A(x,n)*(-1)^n        
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
        F(x) = (x^outside)*f(alt*coeff*x^P)
        if outside == -1 and selection !=1:
            k0 = 0
            A(x,n) = A(x,n+1)
        T = [0,0,0,0,0]
        for i in range(5):
            T[i] = A(Input, k0+i)
            
        Limit = F(Input) 

        tasks+=[{
            "fx": f(x),
            "ax": a(x,n),
            "Fx": F(x).simplify(),
            "Ax": A(x,n).simplify(),
            "k0": k0, 
            "k1": k1,    
            "Input": Input,
            "Limit": Limit,
            "T0": T[0],
            "T1": T[1],
            "T2": T[2],
            "T3": T[3],
            "T4": T[4],        
        }
        ]
        
        shuffle(tasks)

        

        return {"tasks": tasks}



