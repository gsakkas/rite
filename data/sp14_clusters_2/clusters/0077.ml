LetG Rec (fromList [LamG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))
let rec digits =
  fun n ->
    fun digitList ->
      if n = 0
      then digitList
      else digits (n / 10)
                  ((n mod 10) :: digitList) in
match n with
| 0 -> [0]
| _ -> digits n []
let rec digits =
  fun n ->
    fun digitList ->
      if n = 0
      then digitList
      else digits (n / 10)
                  ((n mod 10) :: digitList) in
match n with
| 0 -> [0]
| _ -> digits n []
let rec digits =
  fun n ->
    fun digitList ->
      if n = 0
      then digitList
      else digits (n / 10)
                  ((n mod 10) :: digitList) in
match n with
| 0 -> [0]
| _ -> digits n []
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
