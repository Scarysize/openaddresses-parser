open Core
open Sys
open Printf
open Parser

let file_writer output =
  let out = open_out output in
  (output_string out, (fun () -> close_out out));;

let file_exists filename =
  match Sys.file_exists filename with
  | true -> filename
  | false -> eprintf "'%s' does not exist.\n" filename;
    exit 1;;

let valid_file =
  Command.Spec.Arg_type.create file_exists;;

let spec =
  Command.Spec.(
    empty
    +> anon ("filename" %: valid_file)
    +> flag "-o" (required file) ~doc:"the output file"
  )

let execute_command input output () =
  let (write_line, finish) = file_writer output in
  Parser.parse input (write_line);
  finish ();;

let command =
  Command.basic
    ~summary: "Parse latitude and longitude values from an openaddresses CSV file."
    spec
    execute_command;;

let () =
  Command.run ~version:"0.0.0" ~build_info:"foo" command;;
