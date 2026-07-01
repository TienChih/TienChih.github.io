class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        
        

    

        tasks = []

        #Finite

        a = randrange(-5,6)

        Powers = [1/3, 1/2, 1,2,3,4,5]

        shuffle(Powers)

        distract = choice([
            (randrange(1,6)*n^Powers[0] + randrange(1,6))/(randrange(1,6)*n^Powers[1]),
            (randrange(1,6)*n^Powers[0])/(randrange(1,6)*n^Powers[1]+randrange(1,6)),
            (randrange(1,6)*(n +randrange(1,6) )^Powers[0])/(randrange(1,6)*n^Powers[1]),
            (randrange(1,6)*n^Powers[0])/(randrange(1,6)*(n+randrange(1,6))^Powers[1]),
        ])

        Bases = [2,3,4,5,6]
        shuffle(Bases)



        actual = choice([
            Bases[0]^n/(Bases[1]^n+randrange(1,6)),
            (Bases[0]^n)/(Bases[1]^n+randrange(1,6))
        ])

        
        sgn = choice([-1,1])

        Ca(n) = distract*sgn^n*actual

        a = randrange(-5,6)

        R = Bases[1]/Bases[0]

        if Powers[0] > Powers[1]:
            Rtext = "diverges"
            Rsymbol = r"\Big)"
            Ltext = "diverges"
            Lsymbol = r"\Big("
        elif sgn == 1 and Powers[1]-Powers[0] <= 1:
            Rtext = "diverges"
            Rsymbol = r"\Big)"
            Ltext = "converges"
            Lsymbol = r"\Big["    
        elif sgn == -1 and Powers[1]-Powers[0] <= 1:
            Rtext = "converges"
            Rsymbol = r"\Big]"
            Ltext = "diverges"
            Lsymbol = r"\Big("
        if Powers[1]-Powers[0] > 1:
            Rtext = "converges"
            Rsymbol = r"\Big]"
            Ltext = "converges"
            Lsymbol = r"\Big["                
        

        Ratio = Ca(n+1)/Ca(n)*(x-a)


        Rbound = a + R
        Lbound = a - R

          
        
        summand(n,x) = Ca(n)*(x-a)^n
        

        tasks+=[{
            "summand": summand(n,x),
            "Bnp1": summand(n+1,x).simplify(),
            "Bnr": (1/summand(n,x)).simplify(),
            "Ratio":Ratio.simplify(),
            "aRatio":abs((Ca(n+1)/Ca(n)).simplify()),
            "R":R,
            "Rtest": summand(n,a+R),
            "Rtext": Rtext,
            "Ltest": summand(n,a-R),
            "Ltext": Ltext,
            "Rpoint": a+R,
            "Lpoint": a-R,
            "finite": True,
            "a":a,
            "start":randrange(1,6),
            "Rsymbol":Rsymbol,
            "Lsymbol":Lsymbol,
            "xma":x - a,
            "distract":distract,
        }
        ]



        #Infinite

        a = randrange(-5,6)

        Powers = [1/3, 1/2, 1,2,3,4,5]

        shuffle(Powers)

        distract = choice([
            (randrange(1,6)*n^Powers[0] + randrange(1,6))/(randrange(1,6)*n^Powers[1]),
            (randrange(1,6)*n^Powers[0])/(randrange(1,6)*n^Powers[1]+randrange(1,6)),
            (randrange(1,6)*(n +randrange(1,6) )^Powers[0])/(randrange(1,6)*n^Powers[1]),
            (randrange(1,6)*n^Powers[0])/(randrange(1,6)*(n+randrange(1,6))^Powers[1]),
        ])




        actual = choice([
            1/(factorial(n*randrange(1,3))   ),
            1/(factorial(n)^randrange(1,3)  ),
            1/(n^(n*randrange(1,3))  ),
            1/( (randrange(1,3)*n)^n  ),
        ])

        
        sgn = choice([-1,1])

        Ca(n) = distract*sgn^n*actual

        a = randrange(-5,6)


        Ratio = (Ca(n+1)/Ca(n))*(x-a)
          
        
        summand(n,x) = Ca(n)*(x-a)^n
        

        tasks+=[{
            "summand": summand(n,x),
            "Bnp1": summand(n+1,x).simplify(),
            "Bnr": (1/summand(n,x)).simplify(),
            "Ratio":Ratio.simplify(),
            "aRatio":abs((Ca(n+1)/Ca(n)).simplify()),
            "infinite": True,
            "a":a,
            "start":randrange(1,6),
            "xma":x - a,
        }
        ]
        
        shuffle(tasks)

        

        return {"tasks": tasks}



