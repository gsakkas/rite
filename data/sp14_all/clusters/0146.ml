CaseG VarG [(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(WildPatG,Nothing,IteG EmptyG EmptyG EmptyG)]
match recurse with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildSpecial1 (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildSpecial2 (build (rand , depth - 1) , build (rand , depth - 1))
| _ -> if recurse > 2
       then buildCosine (build (rand , depth - 1))
       else buildSine (build (rand , depth - 1))
