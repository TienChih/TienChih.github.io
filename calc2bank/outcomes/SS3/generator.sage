class Generator(BaseGenerator):
    def data(self):
        var('k n i j')

        given = choice(["case1", "case2"])

        if given == "case1":
            ratiogiven = True
            geogiven = False
            notratiogiven = False
            notgeogiven = True

        if given == "case2":
            ratiogiven = False
            geogiven = True
            notratiogiven = True
            notgeogiven = False    
        
        numerator = randrange(1,6)
        denominator = numerator + randrange(1,4)
        ratio = Rational(numerator/denominator*choice([-1,1]))
        k1 = randrange(5)
        coefficient = randrange(2,6)
        summand1(k) = coefficient*ratio^k
        closedform1(n) = coefficient*(ratio^k1 - ratio^(n+1))/(1-ratio)
        limit1 = coefficient*ratio^k1/(1-ratio)

        tasks=[{
            "k0": k1,
            "summandk": summand1(k),
            "summandn": summand1(n),
            "closedformn": closedform1(n),
            "closedformnm1": closedform1(n-1),
            "limit": limit1,
            "given": geogiven,
            "notgiven": notgeogiven,
        }
        ]

        a = randrange(1,6)
        b = randrange(1,6)
        c = randrange(2,4)

        f(k) = a/(k+b)
        g(k) = a/(k+b+c)

        summand2(k) = f(k)-g(k)
        k2 = randrange(0,5)

        
        
        cf = 0
        
        for i in range(c):
            cf += f(k2+i)
        for i in range(c):
            cf += -1*g(n-i)    
        
        closedform2(n) = cf    
        limit2 = sum(f(k2+j), j, 0, c-1)
        
        tasks +=[{
            "k0": k2,
            "summandk": summand2(k).factor(),
            "summandn": summand2(n).factor(),
            "closedformn": closedform2(n).simplify(),
            "closedformnm1": closedform2(n-1).simplify(),
            "limit": limit2,
            "notgiven": notratiogiven,
            "given": ratiogiven,
        }
        ]

        shuffle(tasks)

        

        return {"tasks": tasks}
