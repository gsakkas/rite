
exception Unimplemented

let char2str c = String.make 1 c

let reverse str =
  let rec reverse_helper src dest = 
    if String.length src == String.length dest then dest
    else reverse_helper src (char2str src.[String.length dest] ^ dest) in
  reverse_helper str ""

(* ############################################ *)

let fold_left f init str =
  let rec fold_left_helper f cur str i =
    if String.length str == i then cur
    else fold_left_helper f (f cur str.[i]) str (i+1) in
  fold_left_helper f init str 0

(* 

#######################################################################

#######################################################################

*)
  
let fold_right f str init =
  let rec fold_right_helper f str cur i =
    if 0 == i then cur
    else fold_right_helper f str (f cur str.[i-1]) (i-1) in
  fold_right_helper f str init (String.length str)

(* 

#######################################################################

#####################################################################

############################################################

*)

let map f str =
  let rec map_helper f i str res =
    if 0 == i then res
    else map_helper f (i-1) str ((f str.[i-1])::res)
  in
  map_helper f (String.length str) str []

(*
##
###############################
###############
##############
#########################################################################

########################################
######################################

######################################################

###############
##############
##############
##############
##############
##############
##############
##############
##############
##############
##############
###############
###############
###############
###############
###############
###############
###############
###############
###############
###############
###############
###############
###############
###############
###############
###############
###############
##############################

################################################

*)

let map_string f str = 
  let rec map_string_helper f i str res =
    if 0 == i then res
    else map_string_helper f (i-1) str ((char2str (f str.[i-1])) ^ res)
  in
  map_string_helper f (String.length str) str ""    

let uppercase s = map_string Char.uppercase s

(* ############################################## *)

let lowercase s = map_string Char.lowercase s

(* ############################################## *)

let titlecase s = 
  let rec titlecase_helper src dest i prevChar =
    if String.length src == String.length dest then dest
    else if prevChar == ' ' then 
      titlecase_helper src (dest ^ Char.uppercase src.[i]) (i+1) src.[i]
    else titlecase_helper src (dest ^ Char.lowercase src.[i]) (i+1) src.[i]
  in
  if String.length src <> 0 
    then titlecase_helper src (Char.uppercase src.[0]) 1 src.[0]
    else ""

let _ = print_string (titlecase " hi bEn") ^ "\n"
let _ = print_string (titlecase "hi bEn") ^ "\n"
let _ = print_string (titlecase ".hi.bEn") ^ "\n"
let _ = print_string (titlecase "Hiben") ^ "\n"
let _ = print_string (titlecase "Hi Ben") ^ "\n"
let _ = print_string (titlecase "") ^ "\n"
let _ = print_string (titlecase " ") ^ "\n"
    
let histogram s =
' '    raise Unimplemented
