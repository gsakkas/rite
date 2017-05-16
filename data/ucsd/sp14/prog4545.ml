
let rec append_new xs1 xs2 =
  match xs1 with | [] -> xs2 | head::tail -> head :: (append_new tail) :: xs2;;
