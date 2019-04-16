CaseG (AppG (fromList [EmptyG])) (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
match rand (1 , 7) with
| 1 -> buildX ()
| 2 -> buildY ()
| 3 -> buildSine (if depth = 0
                  then buildX ()
                  else build (rand , depth - 1))
| 4 -> buildCosine (if depth = 0
                    then buildY ()
                    else build (rand , depth - 1))
| 5 -> buildAverage (if depth = 0
                     then buildX ()
                     else build (rand , depth - 1) , if depth = 0
                                                     then buildY ()
                                                     else build (rand , depth - 1))
| 6 -> buildTimes (if depth = 0
                   then buildX ()
                   else build (rand , depth - 1) , if depth = 0
                                                   then buildY ()
                                                   else build (rand , depth - 1))
| 7 -> buildThresh (if depth = 0
                    then buildX ()
                    else build (rand , depth - 1) , if depth = 0
                                                    then buildY ()
                                                    else build (rand , depth - 1) , if depth = 0
                                                                                    then buildX ()
                                                                                    else build (rand , depth - 1) , if depth = 0
                                                                                                                    then buildY ()
                                                                                                                    else build (rand , depth - 1))
