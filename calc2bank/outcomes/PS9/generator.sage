class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        tasks = []
        
        # 1/(1-x)^2 - 1, ln(1+x), arctan(x), e^x, sin(x), cos(x)
        for j in range(2):
            selection = randrange(0,6)

            coeff = choice([randrange(2,6), 1/randrange(2,6)])
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
                    k0 = 0
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
                k1=0
                k0=0
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
            if selection == 4:
                k1=0
                k0=0
                f(x) = sin(x)
                a(x, n) = (-1)^(n)*x^(2*n+1)/factorial(2*n+1)
                A(x, n) = (-1)^(n)*x^(P*2*n+P+outside)*(coeff)^(2*n+1)/factorial(2*n+1)
                if alt == -1:
                    A(x, n) = -1*A(x,n)
            if selection == 5:
                k1=0
                k0=0
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
            if outside == -1 and selection !=2 and selection!=4:
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



