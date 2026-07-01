class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        
        
        scenarios = ["top", "bottom", ]
        shuffle(scenarios)
        
        
        
        
        
        tasks = []
        
        if scenarios[0] == "top":
            power = randrange(3,6)
            rootpower = randrange(1, 2*power-2)
            c1 = randrange(2,6)
            c2 = randrange(2,6)
            c3 = randrange(2,6)
            c4 = randrange(2,6)
            
            top(n) = sqrt(c1*n^rootpower+c2)
            bottom(n) = c3*n^power+c4
            simptop(n) = sqrt( (c1+c2)*n^rootpower)
            simpbottom(n) = c3*n^power
            simpcoeff = sqrt(c1+c2)/c3
            P = power - rootpower/2
            tasks+=[{
                "k0":randrange(1,5),
                "top": top(n),
                "bottom": bottom(n),
                "simptop": simptop(n),
                "simpbottom": simpbottom(n),
                "simpcoeff": simpcoeff,
                "P": P,
                "converges":True,
            }
            ]
        if scenarios[0] == "bottom":
            power = randrange(3,6)
            rootpower = randrange(2*power+3, 2*power+6)
            c1 = randrange(2,6)
            c2 = randrange(2,6)
            c3 = randrange(2,6)
            c4 = randrange(2,6)
            
            top(n) = c1*n^power+c2
            bottom(n) = sqrt(c3*n^rootpower+c4)
            simptop(n) =  (c1+c2)*n^power
            simpbottom(n) = sqrt(c3*n^rootpower)
            simpcoeff = (c1+c2)/sqrt(c3)
            P = rootpower/2 - power
            tasks+=[{
                "k0":randrange(1,5),
                "top": top(n),
                "bottom": bottom(n),
                "simptop": simptop(n),
                "simpbottom": simpbottom(n),
                "simpcoeff": simpcoeff,
                "P": P,
                "converges":True,
            }
            ]
        
        if scenarios[1] == "top":
            power = randrange(3,6)
            rootpower = 2*power - randrange(1, 3)
            c1 = randrange(2,6)
            c2 = randrange(2,6)
            c3 = randrange(2,6)
            c4 = randrange(2,6)
            
            top(n) = sqrt(c1*n^rootpower+c2)
            bottom(n) = c3*n^power+c4
            simptop(n) = sqrt( (c1)*n^rootpower)
            simpbottom(n) = (c3+c4)*n^power
            simpcoeff = sqrt(c1)/(c3+c4)
            P = power - rootpower/2
            tasks+=[{
                "k0":randrange(1,5),
                "top": top(n),
                "bottom": bottom(n),
                "simptop": simptop(n),
                "simpbottom": simpbottom(n),
                "simpcoeff": simpcoeff,
                "P": P,
                "diverges":True,
            }
            ]
        if scenarios[1] == "bottom":
            power = randrange(3,6)
            rootpower = 2*power + randrange(1,3)
            c1 = randrange(2,6)
            c2 = randrange(2,6)
            c3 = randrange(2,6)
            c4 = randrange(2,6)
            
            top(n) = c1*n^power+c2
            bottom(n) = sqrt(c3*n^rootpower+c4)
            simptop(n) =  (c1)*n^power
            simpbottom(n) = sqrt((c3+c4)*n^rootpower)
            simpcoeff = (c1)/sqrt(c3+c4)
            P = rootpower/2 - power
            tasks+=[{
                "k0":randrange(1,5),
                "top": top(n),
                "bottom": bottom(n),
                "simptop": simptop(n),
                "simpbottom": simpbottom(n),
                "simpcoeff": simpcoeff,
                "P": P,
                "diverges":True,
            }
            ]

        shuffle(tasks)

        

        return {"tasks": tasks}
