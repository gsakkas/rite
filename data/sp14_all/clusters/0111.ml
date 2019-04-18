LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (CaseG (fromList [(LitPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))
let rec loop =
  fun n ->
    fun x ->
      if n = 0
      then x
      else loop (n / 10)
                ((n mod 10) :: x) in
match n with
| 0 -> [0]
| _ -> loop n []
let rec loop =
  fun n ->
    fun acc ->
      if n = 0
      then acc
      else loop (n / 10)
                ((n mod 10) :: acc) in
match n with
| 0 -> [0]
| _ -> loop n []
let rec loop =
  fun n ->
    fun a ->
      if n = 0
      then a
      else loop (n / 10)
                ((n mod 10) :: a) in
match n with
| 0 -> [0]
| _ -> loop n []
