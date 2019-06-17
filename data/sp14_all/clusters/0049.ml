LetG Rec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])
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
let rec helper =
  fun x ->
    fun l ->
      fun acc ->
        match x with
        | [] -> l
        | h :: t -> helper t l
                           (h :: acc) in
helper x l []
let rec helper =
  fun (f , b) ->
    (let b' = f b in
     if b' = b
     then b'
     else helper (f , b')) in
helper (f , b)
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
let rec helper =
  fun i ->
    fun acc ->
      fun l ->
        if i > 0
        then helper i (bigAdd acc l) l
        else acc in
helper i [] l
