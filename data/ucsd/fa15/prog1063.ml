
let rec helperR list rr = match rr with | h::t -> (helperR t) :: h;;
