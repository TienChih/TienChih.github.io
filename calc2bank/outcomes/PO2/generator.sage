class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        
        theta = var('t', latex_name=r"\theta")
        r=var("r")
        x=var("x")
        y=var("y")

        Trig = [sin(x), cos(x)]

        trig(x) = choice(Trig)

        power = choice([1,2])
        C = randrange(2,6)
        f = randrange(2,6)*trig(C*t)^power

        a = 0
        if power == 1 and C%2 == 1:
            b = pi
        else:
            b = 2*pi    
        
        
        
        df=diff(f, t)
        
        
        
        

        return {
            "f": f,
            "df": df, 
            "a": a,
            "b": b,
        }

    @provide_data
    def graphics(data):
        return {
            "plot": polar_plot(data["f"], (t, 0, data["b"]), color='blue')
        }
