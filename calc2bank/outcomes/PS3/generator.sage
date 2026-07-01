class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        tasks = []
        
        # 1/(1-x)^2 - 1, ln(1+x), arctan(x), 
        selection = randrange(0,4)

        coeff = choice([randrange(1,4), 1/randrange(1,4)])
        alt = choice([-1,1])
        P = randrange(2,5)
        outside = choice([-1,2,3])
        
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
            f(x) = ln(1+x)
            a(x, n) = (-1)^(n-1)*x^n/n
            A(x, n) = (-1)^(n-1)*x^(P*n+outside)*(coeff)^n/n
            if alt == -1:
                A(x, n) = -1*x^(P*n+outside)*(coeff)^n/n
        if selection == 2:
            f(x) = arctan(x)
            a(x, n) = (-1)^n*x^(2*n+1)/(2*n+1)
            A(x, n) = (-1)^n*x^(P*2*n+P+outside)*(coeff)^(2*n+1)/(2*n+1)
            if alt == -1:
                A(x, n) = -1*A(x,n)
            k0 = 0    
            k1 = 0 

        if selection == 3:
            f(x) = 1/(1-x)
            a(x, n) = x^n
            A(x, n) = x^(P*n+outside)*coeff^n
            if alt == -1:
                A(x, n) = -1*A(x,n)
            k0 = 0    
            k1 = 0         

        F(x) = (x^outside)*f(alt*coeff*x^P)
        if outside == -1 and selection !=2:
            k0 = 0
            A(x,n) = A(x,n+1)
        
        k2 = k0 + randrange(1,4)
        
        FF(x) = F(x)

        for i in range(k2-k0):
            FF(x) = FF(x) - A(x, k0+i)


        tasks+=[{
            "fx": f(x),
            "ax": a(x,n),
            "Fx": F(x).simplify(),
            "Ax": A(x,n).simplify(),
            "k0": k0, 
            "k1": k1,
            "k2": k2,
            "FFx": FF(x),            
        }
        ]
        
        shuffle(tasks)

        

        return {"tasks": tasks}



