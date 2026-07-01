class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        from sage.symbolic.integration.integral import indefinite_integral
        var("u")
        
        
        
        
        
        
        p1 = randrange(1,3)*2+1
        p2 = randrange(2,4)

        trigs1 = [sin(x), cos(x)]
        shuffle(trigs1)

        f1(x) = trigs1[0]^p1*trigs1[1]^p2
        
        bounds = [0,pi/6, pi/4, pi/3, pi/2]
        shuffle(bounds)
        
        a = min([bounds[0], bounds[1]])
        b = max([bounds[0], bounds[1]])

        F1(x) = integral(f1(x), x)
        Int1 = integral(f1(x), x, a, b)

        tasks = []
        tasks +=[{
            "definite": True,
            "fx": f1(x),
            "a": a,
            "b": b,
            "Int": Int1,
            "Fx": F1(x),
        }
        ]


        p3 = randrange(1,4)*2
        p4 = 2

        trigs2 = [sin(x), cos(x)]
        shuffle(trigs2)
        f2(x) = trigs2[0]^p3*trigs2[1]^p4
        F2(x) = integral(f2(x),x)

        tasks +=[{
            "indefinite": True,
            "fx": f2(x),
            "Fx": F2(x),
        }
        ]

        Ps = [ [randrange(1,4), 2*randrange(1,3) ], [2*randrange(1,3)+1, randrange(1,3)] ]
        P = choice(Ps)

        f3(x) = tan(x)^P[0]*sec(x)^P[1]

        bounds = [pi/6, pi/4, pi/3]
        shuffle(bounds)

        c = min([bounds[0], bounds[1]])
        d = max([bounds[0], bounds[1]])

        F3(x) = integral(f3(x), x) 
        Int3 = (F3(d).simplify() - F3(c).simplify()).simplify()

        tasks +=[{
            "definite": True,
            "fx": f3(x),
            "a": c,
            "b": d,
            "Int": Int3,
            "Fx": F3(x),
        }
        ]



        shuffle(tasks)            
                    
                    
        return {"tasks": tasks}
        
        
    
      
        
        
            
           
