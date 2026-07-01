class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        
        

        scenarios = ["fraction", "trans"]
        rootposition = ["top", "bottom", ]
        shuffle(scenarios)
        shuffle(rootposition)

        distractions = [randrange(1,4)*sin(n)^randrange(1,5), randrange(1,4)*cos(n)^randrange(1,5), randrange(1,4)*arctan(n), randrange(1,4)*ln(n)  ]
        shuffle(distractions)
        
        
        
        
        
        tasks = []
        if scenarios[0] == "fraction":
            if rootposition[0] == "top":
                power = randrange(3,6)
                rootpower = randrange(3, 2*power-2)
                c1 = randrange(2,6)
                c2 = randrange(2,6)
                c3 = randrange(2,6)
                c4 = randrange(2,6)

                topsmallpower = n^randrange(1, rootpower)*choice([-1,1])*randrange(1,4)
                
                bottomdistract = choice([distractions[0]*choice([-1,1]), n^randrange(1, power)*choice([-1,1])*randrange(1,4), randrange(1,4)*choice([-1,1])])
                
                top(n) = sqrt(c1*n^rootpower+distractions[1]+topsmallpower)
                bottom(n) = c3*n^power+bottomdistract

                topsquare(n) = top(n)^2
                bottomsquare(n) = bottom(n)^2

                P = power - rootpower/2
                tasks+=[{
                    "k0":randrange(5,10),
                    "top": top(n),
                    "bottom": bottom(n),
                    "topsquare": topsquare(n),
                    "bottomsquare": bottomsquare(n).expand(),
                    "simpcoeff": sqrt(c1)/c3,
                    "P": P,
                    "converges":True,
                    "Psquare": 2*P,
                    "final": (n^(2*P)*topsquare(n)).expand(),
                    "fraction": True,
                }
                ]
            if rootposition[0] == "bottom":
                power = randrange(3,6)
                rootpower = randrange(2*power+3, 2*power+6)
                c1 = randrange(2,6)
                c2 = randrange(2,6)
                c3 = randrange(2,6)
                c4 = randrange(2,6)

                smallpower = n^randrange(1, rootpower)*choice([-1,1])*randrange(1,4)
                
                bottomdistract = choice([distractions[0]*choice([-1,1]), n^randrange(1, power)*choice([-1,1])*randrange(1,4), randrange(1,4)*choice([-1,1])])
                
                top(n) = c1*n^power+distractions[1]
                bottom(n) = sqrt(c3*n^rootpower+bottomdistract+smallpower)

                topsquare(n) = top(n)^2
                bottomsquare(n) = bottom(n)^2

                P = rootpower/2 - power
                tasks+=[{
                    "k0":randrange(5,10),
                    "top": top(n),
                    "bottom": bottom(n),
                    "topsquare": topsquare(n).expand(),
                    "bottomsquare": bottomsquare(n).expand(),
                    "simpcoeff": c1/sqrt(c3),
                    "P": P,
                    "converges":True,
                    "Psquare": 2*P,
                    "final": (n^(2*P)*topsquare(n)).expand(),
                    "fraction": True,
                }
                ]
      
        if scenarios[0] == "trans":
            C = randrange(2,6)
            funcs = [sin(C*n), arcsin(C*n), tan(C*n), arctan(C*n), randrange(2,6)^(C*n)-1, 1-cos(C*sqrt(n)) , ln(1+C*n)]        
            shuffle(funcs)
            P = randrange(3,6)/2
            f(n) = funcs[0]
            F(n) = f(1/n^P)
            Fd = F(n).diff(n)
            Pd = (1/n^P).diff(n)
            tasks+=[{
                    "k0":randrange(1,5),
                    "Fn": F(n),
                    "Fd": Fd,
                    "P": P,
                    "Pd": Pd,
                    "converges":True,
                    "limit": limit(F(n)*n^P, n, oo),
                    "trans": True,
                }
                ]

        if scenarios[1] == "fraction":
            if rootposition[0] == "top":
                power = randrange(3,6)
                rootpower = 2*power -randrange(1,3)
                c1 = randrange(2,6)
                c2 = randrange(2,6)
                c3 = randrange(2,6)
                c4 = randrange(2,6)

                topsmallpower = n^randrange(1, rootpower)*choice([-1,1])*randrange(1,4)
                
                bottomdistract = choice([distractions[0]*choice([-1,1]), n^randrange(1, power)*choice([-1,1])*randrange(1,4), randrange(1,4)*choice([-1,1])])
                
                top(n) = sqrt(c1*n^rootpower+distractions[1]+topsmallpower)
                bottom(n) = c3*n^power+bottomdistract

                topsquare(n) = top(n)^2
                bottomsquare(n) = bottom(n)^2

                P = power - rootpower/2
                tasks+=[{
                    "k0":randrange(5,10),
                    "top": top(n),
                    "bottom": bottom(n),
                    "topsquare": topsquare(n),
                    "bottomsquare": bottomsquare(n).expand(),
                    "simpcoeff": sqrt(c1)/c3,
                    "P": P,
                    "converges":True,
                    "Psquare": 2*P,
                    "final": (n^(2*P)*topsquare(n)).expand(),
                    "fraction": True,
                }
                ]
            if rootposition[0] == "bottom":
                power = randrange(3,6)
                rootpower = 2*power + randrange(1,3)
                c1 = randrange(2,6)
                c2 = randrange(2,6)
                c3 = randrange(2,6)
                c4 = randrange(2,6)

                smallpower = n^randrange(1, rootpower)*choice([-1,1])*randrange(1,4)
                
                bottomdistract = choice([distractions[0]*choice([-1,1]), n^randrange(1, power)*choice([-1,1])*randrange(1,4), randrange(1,4)*choice([-1,1])])
                
                top(n) = c1*n^power+distractions[1]
                bottom(n) = sqrt(c3*n^rootpower+bottomdistract+smallpower)

                topsquare(n) = top(n)^2
                bottomsquare(n) = bottom(n)^2

                P = rootpower/2 - power
                tasks+=[{
                    "k0":randrange(5,10),
                    "top": top(n),
                    "bottom": bottom(n),
                    "topsquare": topsquare(n).expand(),
                    "bottomsquare": bottomsquare(n).expand(),
                    "simpcoeff": c1/sqrt(c3),
                    "P": P,
                    "diverges":True,
                    "Psquare": 2*P,
                    "final": (n^(2*P)*topsquare(n)).expand(),
                    "fraction": True,
                }
                ]
        
        if scenarios[1] == "trans":
            C = randrange(2,6)
            funcs = [sin(C*n), arcsin(C*n), tan(C*n), arctan(C*n), randrange(2,6)^(C*n)-1, 1-cos(C*sqrt(n)) , ln(1+C*n)]        
            shuffle(funcs)
            P = randrange(1,2)/2
            f(n) = funcs[0]
            F(n) = f(1/n^P)
            Fd = F(n).diff(n)
            Pd = (1/n^P).diff(n)
            tasks+=[{
                    "k0":randrange(1,5),
                    "Fn": F(n),
                    "Fd": Fd,
                    "P": P,
                    "Pd": Pd,
                    "diverges":True,
                    "limit": limit(F(n)*n^P, n, oo),
                    "trans": True,
                }
                ]

        # BAD
        if rootposition[1] == "top":
            power = randrange(3,6)
            rootpower = 2*power
            c1 = randrange(2,6)
            c2 = randrange(2,6)
            c3 = randrange(2,6)
            c4 = randrange(2,6)

            topsmallpower = n^randrange(1, rootpower)*choice([-1,1])*randrange(1,4)
            
            bottomdistract = choice([distractions[0]*choice([-1,1]), n^randrange(1, power)*choice([-1,1])*randrange(1,4), randrange(1,4)*choice([-1,1])])
            
            top(n) = sqrt(c1*n^rootpower+distractions[1]+topsmallpower)
            bottom(n) = c3*n^power+bottomdistract

            topsquare(n) = top(n)^2
            bottomsquare(n) = bottom(n)^2

            P = power - rootpower/2
            tasks+=[{
                "k0":randrange(5,10),
                "top": top(n),
                "bottom": bottom(n),
                "topsquare": topsquare(n),
                "bottomsquare": bottomsquare(n).expand(),
                "simpcoeff": sqrt(c1)/c3,
                "P": P,
                "bad":True,
                "Psquare": 2*P,
                "final": (n^(2*P)*topsquare(n)).expand(),
                "fraction": True,
            }
            ]
        if rootposition[1] == "bottom":
            power = randrange(3,6)
            rootpower = 2*power
            c1 = randrange(2,6)
            c2 = randrange(2,6)
            c3 = randrange(2,6)
            c4 = randrange(2,6)

            smallpower = n^randrange(1, rootpower)*choice([-1,1])*randrange(1,4)
            
            bottomdistract = choice([distractions[0]*choice([-1,1]), n^randrange(1, power)*choice([-1,1])*randrange(1,4), randrange(1,4)*choice([-1,1])])
            
            top(n) = c1*n^power+distractions[1]
            bottom(n) = sqrt(c3*n^rootpower+bottomdistract+smallpower)

            topsquare(n) = top(n)^2
            bottomsquare(n) = bottom(n)^2

            P = rootpower/2 - power
            tasks+=[{
                "k0":randrange(5,10),
                "top": top(n),
                "bottom": bottom(n),
                "topsquare": topsquare(n).expand(),
                "bottomsquare": bottomsquare(n).expand(),
                "simpcoeff": c1/sqrt(c3),
                "P": P,
                "bad":True,
                "Psquare": 2*P,
                "final": (n^(2*P)*topsquare(n)).expand(),
                "fraction": True,
            }
            ]
        shuffle(tasks)

        

        return {"tasks": tasks}



