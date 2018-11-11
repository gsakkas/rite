LetG Rec [LamG EmptyG] (AppG [EmptyG,EmptyG])
let rec aux =
  fun acc ->
    fun n ->
      if n <= 0
      then acc
      else aux (List.append [x] acc)
               (n - 1) in
aux [] n
let rec integers =
  fun a ->
    fun b ->
      if a = 0
      then b
      else integers (a / 10)
                    ((a mod 10) :: b) in
integers n []
let rec integers =
  fun a ->
    fun b ->
      if a = 0
      then b
      else integers (a / 10)
                    ((a mod 10) :: b) in
integers n []
let rec getList =
  fun a ->
    fun b ->
      match a with
      | [] -> [] in
getList [] l
let rec helper =
  fun acc ->
    fun v ->
      if v = 0
      then acc
      else helper ((v mod 10) :: acc)
                  (v / 10) in
helper [] h
