# SWAT

Simple Way (image) Annotation Tool

SWAT is a port of [sxat](https://github.com/HimadriChakra12/sxat) that can read whatever image (jpeg, png or TIFF) from stdin and render it in its window. basic tools to modify the image
are provided, e.g. pencils/erarser, text, ... On exit SXAT will dump the edited version of the image to
stdout as a PNG file.

### basic usage

```
swat (-f/p/r/m) /path/to/some/image.png > annotated-image.png
```

- fullscreen mode (-f)
- tools(pencil, rectangle, marker respectively) modes (-p/-r/-m)

### keybinds

note that "exit" only works in "normal mode".

| tool/mode   | key  |
| ----        | ---  |
| normal      | n    |
| eraser      | e    |
| marker      | m    |
| pencil      | p    |
| rectangle   | r    |
| exit        | q    |

#### pencil tool

| action            | key |
| --                | --  |
| decrease pen size | [   |
| increase pen size | ]   |
| change color      | c   |

#### eraser tool

| action               | key |
| --                   | --  |
| decrease eraser size | [   |
| increase eraser size | ]   |

#### marker tool

| action                | key |
| --                    | --  |
| decrease marker size  | [   |
| increase marker size  | ]   |
| decrease number       | ;   |
| increase number       | '   |
| reset number to 1     | .   |
| change marker alpha   | a   |
| change marker color   | c   |
| toggle auto-increment | i   |

#### rectangle tool

| action                        | key |
| --                            | --  |
| decrease border thickness     | [   |
| increase border thickness     | ]   |
| fill                          | f   |
| change marker alpha           | a   |
| change marker color           | c   |
