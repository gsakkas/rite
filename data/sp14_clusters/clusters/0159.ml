LamG (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)])
fun sl ->
  match sl with
  | [] -> ""
  | h :: t -> (let f =
                 fun a ->
                   fun x -> a ^ (sep ^ x) in
               let base = h in
               let l = t in
               List.fold_left f base l)
fun y ->
  match y with
  | [] -> [x]
  | h :: t -> h :: (append x t)
fun xs ->
  match xs with
  | [] -> 0
  | xs -> List.hd xs + sumList (List.tl xs)
fun n ->
  match n with
  | 0 -> []
  | n -> if n < 0
         then []
         else (n mod 10) :: (digitsOfInt (n / 10))
fun n ->
  match n with
  | 0 -> []
  | n -> if n < 0
         then []
         else (n mod 10) :: (digitsOfInt (n / 10))
fun n ->
  match n with
  | 0 -> []
  | n -> if n < 0
         then []
         else (n mod 10) :: (digitsOfInt (n / 10))
fun l ->
  match l with
  | [] -> []
  | h :: t -> if h = 0
              then removeZero t
              else l
fun acc ->
  match x with
  | [] -> l
  | h :: t -> helper t l
                     (h :: acc)
fun acc ->
  match x with
  | [] -> l
  | h :: t -> helper t l
                     (h :: acc)
fun acc ->
  match x with
  | [] -> l
  | h :: t -> helper t l
                     (h :: acc)
fun b ->
  match b with
  | [] -> [a]
  | hd :: tl -> [a + hd]
fun b ->
  match b with
  | [] -> [a]
  | hd :: tl -> [a + hd]
fun b ->
  match b with
  | [] -> [a]
  | hd :: tl -> [a + hd]
fun b ->
  match b with
  | [] -> [a]
  | hd :: tl -> [a + hd]
fun (x , y) ->
  match x with
  | [] -> y
  | h :: t -> reverse (t , h :: y)
fun l ->
  match l with
  | [] -> []
  | h :: t -> reverse (l , [])
fun n ->
  match l with
  | [] -> [n]
  | h :: t -> h :: (myAppend t
                             n)
fun n ->
  match n with
  | 0 -> []
  | _ -> myAppend (getDigits (n / 10))
                  (n mod 10)
fun l ->
  match l with
  | [] -> []
  | h :: t -> t
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
fun l ->
  match l with
  | [] -> []
  | hd :: tl -> helper (hd :: xs)
                       l
fun list ->
  match list with
  | [] -> 0
  | head :: tail -> head
fun list ->
  match list with
  | [] -> 0
  | head :: tail -> head
fun list ->
  match list with
  | [] -> 0
  | head :: tail -> head
fun list ->
  match list with
  | [] -> 0
  | head :: tail -> head
fun l ->
  match l with
  | [] -> "[]"
  | x :: xs -> (let g =
                  fun a ->
                    fun x -> a ^ ("; " ^ f x) in
                let base = "[" ^ f x in
                List.fold_left g base
                               xs ^ "]")
fun l ->
  match l with
  | [] -> "[]"
  | x :: xs -> (let g =
                  fun a ->
                    fun x -> a ^ ("; " ^ f x) in
                let base = "[" ^ f x in
                List.fold_left g base
                               xs ^ "]")
fun l ->
  match l with
  | [] -> "[]"
  | x :: xs -> (let g =
                  fun a ->
                    fun x -> a ^ ("; " ^ f x) in
                let base = "[" ^ f x in
                List.fold_left g base
                               xs ^ "]")
fun l ->
  match l with
  | [] -> "[]"
  | x :: xs -> (let g =
                  fun a ->
                    fun x -> a ^ ("; " ^ f x) in
                let base = "[" ^ f x in
                List.fold_left g base
                               xs ^ "]")
fun dest ->
  match l with
  | [] -> []
  | h :: t -> listReverse2 t
                           (h :: dest)
