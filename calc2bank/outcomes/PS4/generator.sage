class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        tasks = []
        
        # 1/(1-x)^2 - 1, ln(1+x), arctan(x), 
        selection = randrange(0,3)

        coeff = 1
        alt = choice([-1,1])
        P = randrange(1,3)
        outside = choice([-1,0,1])
        K = randrange(2,6)


        Input = 1/randrange(2,4)*choice([-1,1])
        
        k0 = 1
        k1 = 1

        if selection == 0:
            if outside != -1:
                f(x) = 1/(1-x)^2
                a(x, n) = (n+1)*x^n
                A(x, n) = (n+1)*x^(P*n+outside)*(coeff)^n
                if alt == -1:
                    A(x, n) = A(x,n)*(-1)^n
                k1 = 0
            else:    
                f(x) = 1/(1-x)^2 -1
                a(x, n) = (n+1)*x^n
                A(x, n) = (n+1)*x^(P*n+outside)*(coeff)^n
                if alt == -1:
                    A(x, n) = A(x,n)*(-1)^n
                k1 = 1 
        if selection == 1:
            f(x) = K*ln(1+x)
            a(x, n) = K*(-1)^(n-1)*x^n/n
            A(x, n) = K*(-1)^(n-1)*x^(P*n+outside)*(coeff)^n/n
            if alt == -1:
                A(x, n) = -1*K*x^(P*n+outside)*(coeff)^n/n
        
        if selection == 2:
            f(x) = K*1/(1-x)
            a(x, n) = K*x^n
            A(x, n) = K*x^(P*n+outside)*coeff^n
            if alt == -1:
                A(x, n) = -1*A(x,n)
            k0 = 0    
            k1 = 0   
            
            
        F(x) = K*(x^outside)*f(alt*coeff*x^P)
        if outside == -1 :
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



