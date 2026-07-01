class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        
        theta = var('t', latex_name=r"\theta")
        r=var("r")
        x=var("x")
        y=var("y")

        Trig = [sin(x), cos(x)]

        trig(x) = choice(Trig)

        scenario = randrange(0,2)

        if scenario == 0:
            c = randrange(1,6)*choice([-1,1])
            sign = choice([-1,1])
            M = 2*c*sign

            if trig(x) == sin(x) and sign == 1:
                a1 = pi/6
                b1 = 5*pi/6
                a2 = 5*pi/6
                b2 = pi/6+2*pi
            if trig(x) == sin(x) and sign == -1:
                a1 = 7*pi/6
                b1 = 11*pi/6
                a2 = -1*pi/6
                b2 = 7*pi/6   

            if trig(x) == cos(x) and sign == 1:
                a1 = pi/3
                b1 = 5*pi/3
                a2 = 5*pi/3
                b2 = pi/3+2*pi 
            if trig(x) == cos(x) and sign == -1:
                a1 = 2*pi/3
                b1 = 4*pi/3
                a2 = 4*pi/3
                b2 = 2*pi/3+2*pi   

            return {
                "single": True,
                "f": M*trig(t)-c ,
                "fs": 1/2*(M*trig(t)-c)^2, 
                "a1": a1,
                "b1": b1,
                "a2": a2,
                "b2": b2,
                "scenario": scenario,
            }
        if scenario == 1:
            R = randrange(4,10)
            c = randrange(1,floor(R/2))
            sign = choice([-1,1])
            M = 2*c*sign
            sides = ["inside", "outside"]
            shuffle(sides)

            if trig(x) == sin(x) and sign == 1 and sides[0] == "inside":
                a = -pi/6
                b = 7*pi/6
            if trig(x) == sin(x) and sign == 1 and sides[0] == "outside":
                a = 7*pi/6
                b = 9*pi/6

            if trig(x) == sin(x) and sign == -1 and sides[0] == "outside":
                a = pi/6
                b = 5*pi/6
            if trig(x) == sin(x) and sign == -1 and sides[0] == "inside":
                a = 5*pi/6
                b = 13*pi/6

            if trig(x) == cos(x) and sign == 1 and sides[0] == "inside":
                a = -2*pi/3
                b = 2*pi/3
            if trig(x) == cos(x) and sign == 1 and sides[0] == "outside":
                a = 2*pi/3
                b = 4*pi/3

            if trig(x) == cos(x) and sign == -1 and sides[0] == "outside":
                a = -pi/3
                b = pi/3
            if trig(x) == cos(x) and sign == -1 and sides[0] == "inside":
                a = pi/3
                b = 5*pi/3   

            fs =  1/2*(M*trig(t)+c+R)^2 - R^2/2

            if sides[0] == "outside":
                fs =  -1*fs         

            return {
                "double": True,
                "f": M*trig(t)+c+R ,
                "fs": fs, 
                "a": a,
                "b": b,
                "R": R,
                "first": sides[0],
                "second": sides[1],
                "scenario": scenario,
            }
        
        
        
        

        

    @provide_data
    def graphics(data):
        if data["scenario"] == 0:
            return {
                "plot": polar_plot(data["f"], (t, 0, 2*pi), color='blue')
            }
        if data["scenario"] == 1:
            return {
                "plot2": polar_plot(data["f"], (t, 0, 2*pi), color='blue') 
                + polar_plot(data["R"], (t, 0, 2*pi), color='green')
            }    
