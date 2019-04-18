IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (CaseG (fromList [(LitPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))
if i < 1
then []
else (match i with
      | 1 -> l
      | _ -> bigAdd l
                    (mulByDigit (i - 1) l))
