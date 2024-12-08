(*
///////////////////////////////
LISTS MANAGEMENT
///////////////////////////////
*)

(*print list for debug purpose*)
let print_data_from_list data =
	let rec print_list lst =
		if lst = [] then ()
		else
			let (login,pwd) = List.hd lst in
			print_endline("Login: "^ login ^ ",Password:" ^ pwd);
			print_list(List.tl lst)
		in
		print_list data;;

(*print list created from reading file, for debug purpose*)
let print_data_from_file file =
	let data = Tools.read_data_from_file file in
	print_data_from_list data;;

(*create two list using file names then concatenate them into a new one *)
let concatenate_files file1 file2 =
	let list1 = Tools.read_data_from_file file1 in
	let list2 = Tools.read_data_from_file file2 in
	let list3 = list1@list2 in
	list3;;

(*create a new list from combining two lists*)
let concatenate_lists lst1 lst2 =
	let list3 = lst1@lst2 in
	list3;;

(* 
///////////////////////////
DUPLICATES MANAGEMENT
//////////////////////////
*)

(*Eliminate duplicates from two lists*)
let remove_duplicates lst =
  let rec aux seen = function
    | [] -> List.rev seen
    | x :: xs ->
      if List.mem x seen then
        aux seen xs
      else
        aux (x :: seen) xs
  in
  aux [] lst;;

(*Create a list containing the duplicates from another list*)
let find_duplicates lst =
  let count_occurrences lst =
    let rec aux count = function
      | [] -> count
      | x :: xs ->
          let current_count = try Hashtbl.find count x with Not_found -> 0 in
          Hashtbl.replace count x (current_count + 1);
          aux count xs
    in
    let count = Hashtbl.create (List.length lst) in
    aux count lst
  in
  let count = count_occurrences lst in
  Hashtbl.fold (fun key value acc ->
    if value > 1 then key :: acc else acc
  ) count []
  

(*print duplicates in a list, for debug purposes*)
let print_duplicates lst =
  let count_occurrences lst =
    let rec aux count = function
      | [] -> count
      | x :: xs ->
          let current_count = try Hashtbl.find count x with Not_found -> 0 in
          Hashtbl.replace count x (current_count + 1);
          aux count xs
    in
    let count = Hashtbl.create (List.length lst) in
    aux count lst
  in
  let count = count_occurrences lst in
  Hashtbl.iter (fun key value ->
    if value > 1 then
      Printf.printf "Duplicate: (%s, %s)\n" (fst key) (snd key)
  ) count;;

(* 
////////////////////////////
TRIPLES EXTRACTION
////////////////////////////
*)

(*extract clear password from depensetout using login + hashed password present from both depensetout and another applications
Meant to work with a list of duplicates login + hashed password
*)
let extract_clear_password lst_hash lst_clear =
  List.fold_left (fun acc (first1, second1) ->
    List.fold_left (fun acc' (first2, second2) ->
      if first1 = first2 then
        (first1, second2) :: acc'
      else
        acc'
    ) acc lst_clear
  ) [] lst_hash

(*create a triplet list. application / login / password* where s is the full name of the application and lst is a list of login + hashed password*)
let create_triples s lst =
  List.map (fun (first, second) -> (s, first, second)) lst;;

(*print triples for debug purposes*)
let print_triples lst =
  List.iter (fun (first, second, third) -> 
    Printf.printf "(%s, %s, %s)\n" first second third) lst;;
    
let write_to_file filename data =
  (* Open the file for writing *)
  let out_channel = open_out filename in
  
  (* Iterate over the list and write each tuple to the file *)
  List.iter (fun (str1, str2, str3) ->
    Printf.fprintf out_channel "%s, %s, %s\n" str1 str2 str3
  ) data;

  (* Close the file after writing *)
  close_out out_channel;;

(*
/////////////////////////
OTHERS
/////////////////////////
*)

(*Create a list with hashed password. Better used after fusing and removing duplicates*)
let hash_every_password lst =
  List.map (fun (first, second) -> (first, Tools.hash_password(second))) lst;;
