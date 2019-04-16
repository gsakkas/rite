LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))
let rec getList =
  fun a ->
    fun b ->
      match a with
      | [] -> [] in
getList [] l
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
  fun acc ->
    fun v ->
      if v = 0
      then acc
      else helper ((v mod 10) :: acc)
                  (v / 10) in
helper [] h
let rec helper =
  fun i ->
    fun acc ->
      fun l ->
        if i > 0
        then helper i (bigAdd acc l) l
        else acc in
helper i [] l
