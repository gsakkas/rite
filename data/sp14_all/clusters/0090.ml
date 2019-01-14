LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))
let rec aux =
  fun acc ->
    fun n ->
      if n <= 0
      then acc
      else aux (List.append [x] acc)
               (n - 1) in
aux [] n
let rec cloneHelper =
  fun (x , n , acc) ->
    if n < 0
    then acc
    else cloneHelper (x , n - 1 , x :: acc) in
cloneHelper (x , n , [])
let rec cloneHelper =
  fun (x , n , acc) ->
    if n < 0
    then acc
    else cloneHelper (x , n - 1 , x :: acc) in
cloneHelper (x , n , [])
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
  fun x ->
    fun l ->
      fun acc ->
        match x with
        | [] -> l
        | h :: t -> helper t l
                           (h :: acc) in
helper x l []
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
let rec helper =
  fun (f , b) ->
    (let b' = f b in
     if b' = b
     then b'
     else helper (f , b')) in
helper (f , b)
let rec helper =
  fun (f , b) ->
    (let b' = f b in
     if b' = b
     then b'
     else helper (f , b')) in
helper (f , b)
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
let rec helper =
  fun i ->
    fun acc ->
      fun l ->
        if i > 0
        then helper i (bigAdd acc l) l
        else acc in
helper i [] l
