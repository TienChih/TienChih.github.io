class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        from sage.symbolic.integration.integral import indefinite_integral
        var("u a b theta p")
        
        
        
        
        
        #scenario = 1# randrange(0,2)


        tasks = []
        
        for scenario in range(2):
            #to infinity

            radposition = ["top", "bottom"]
            shuffle(radposition)


            boundfuncs = [sin(randrange(1,6)*x)^(2*randrange(1,3)), 
                cos(randrange(1,6)*x)^(2*randrange(1,3)),
                arctan(randrange(1,6)*x) ]
            N = [0,1,2]
            shuffle(N)
            if N[0] == 0 or N[0] == 1:
                up1 = 1
            if N[0] == 2:
                up1 = pi/2 
            if N[1] == 0 or N[1] == 1:
                up2 = 1
            if N[1] == 2:
                up2 = pi/2      


            if scenario == 0:
                if radposition[0] == "top":
                    p1 = randrange(3, 7)
                    q1 = randrange(1, p1)
                    p2 = randrange(p1+3, p1+6)/2
                    q2 = randrange(1, p2*2)/2
                if radposition[0] == "bottom":
                    p1 = randrange(2, 14)/2
                    q1 = randrange(1, p1*2)/2
                    p2 = randrange(p1*2+3, p1*2+6)
                    q2 = randrange(1, p2)
            if scenario == 1:
                if radposition[0] == "top":
                    p1 = randrange(3, 7)
                    q1 = randrange(1, p1)
                    p2 = randrange(p1+1, p1+3)/2
                    q2 = randrange(1, p2*2)/2
                if radposition[0] == "bottom":
                    p1 = randrange(2, 14)/2
                    q1 = randrange(1, p1*2)/2
                    p2 = randrange(p1*2+1, p1*2+3)
                    q2 = randrange(1, p2)         
            k1 = randrange(2,6)
            k2 = randrange(2,6)
            bf1 = boundfuncs[N[0]]
            bf2 = boundfuncs[N[1]]
            cp1 = randrange(1,6)
            cq1 = randrange(1,6)
            cbf1 = randrange(1,6)
            cp2 = randrange(1,6)
            cq2 = randrange(1,6)
            cbf2 = randrange(1,6)

            if radposition[0] == "top":
                fx = sqrt(cp1*x^p1 + cq1*x^q1+k1+cbf1*bf1)/(cp2*x^p2 + cq2*x^q2+k2+cbf2*bf2)
            if radposition[0] == "bottom":
                fx = (cp1*x^p1 + cq1*x^q1+k1+cbf1*bf1)/sqrt(cp2*x^p2 + cq2*x^q2+k2+cbf2*bf2)    
            
            
            if scenario == 0:
                limittype = "converges"
                if radposition[0] == "top":
                    simp = sqrt( (cp1+cq1+k1+cbf1*up1)*x^p1 )/(cp2*x^p2)
                    P = p2-p1/2
                if radposition[0] == "bottom":
                    simp =  (cp1+cq1+k1+cbf1*up1)*x^p1 /sqrt((cp2*x^p2))    
                    P = p2/2-p1
            if scenario == 1:
                limittype = "diverges"
                if radposition[0] == "top":
                    simp = sqrt( (cp1*x^p1))/((cp2+cq2+k2+cbf2*up2)*x^p2 )
                    P = p2-p1/2
                if radposition[0] == "bottom":
                    simp =   (cp1*x^p1)/sqrt((cp2+cq2+k2+cbf2*up2)*x^p2 )
                    P = p2/2-p1


            
            #cp1*x^p1 + cq1*x^q1+k1+cbf1*bf1
                
            start = randrange(2,6)        

            tasks +=[{
                "infinite": True,
                radposition[0]: True,
                limittype: True,
                "fx": fx,
                "simp": simp,
                "P": P,
                "t11": cp1*x^p1,
                "t12": cq1*x^p1,
                "t13": k1*x^p1,
                "t14": cbf1*up1*x^p1,
                "t21": cp2*x^p2,
                "t22": cq2*x^p2,
                "t23": k2*x^p2,
                "t24": cbf2*up2*x^p2,
                "T11": cp1*x^p1,
                "T12": cq1*x^q1,
                "T13": k1,
                "T14": cbf1*up1*bf1,
                "T21": cp2*x^p2,
                "T22": cq2*x^q2,
                "T23": k2,
                "T24": cbf2*up2*bf2,
                "N0": N[0],
                "N1": N[1],
                "start":start,
            }
            ]

        #to finite

        

        

        

        

        shuffle(tasks)   
        
        
        
            
            
        return {"tasks": tasks}
        
        
    
      
        
        
            
           
