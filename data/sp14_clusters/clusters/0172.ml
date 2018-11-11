CaseG VarG [(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG])]
match randNum3 with
| 1 -> buildSine (buildOp1 (build (rand , depth - 1)))
| 2 -> buildCosine (buildOp1 (build (rand , depth - 1)))
