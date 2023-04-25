if !has('python3')
    echo "[-] vim seems not to be compiled with python3 support"
    finish
endif

if exists('g:vve_loaded')
    finish
endif

let s:vve_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import sys, vim, os
vve_root_dir = vim.eval('s:vve_root_dir')
py_root_dir = os.path.normpath(os.path.join(vve_root_dir, '..', 'python'))
sys.path.insert(0, py_root_dir)
EOF

" encoding functions
vnoremap <leader>ce :<c-u>ChangeEncoding 
vnoremap <leader>ea :<c-u>call vve#encode#VisualEncodeAscii(visualmode())<CR>
vnoremap <leader>eb :<c-u>call vve#encode#VisualEncodeBinary(visualmode())<CR>
vnoremap <leader>eB :<c-u>call vve#encode#VisualEncodeBase64(visualmode())<CR>
vnoremap <leader>ee :<c-u>call vve#encode#VisualEncodeHtml(visualmode())<CR>
vnoremap <leader>eE :<c-u>call vve#encode#VisualEncodeHtmlFull(visualmode())<CR>
vnoremap <leader>eh :<c-u>call vve#encode#VisualEncodeHex(visualmode())<CR>
vnoremap <leader>eH :<c-u>call vve#encode#VisualEncodeHexString(visualmode())<CR>
vnoremap <leader>ej :<c-u>call vve#encode#VisualEncodeJSON(visualmode())<CR>
vnoremap <leader>eJ :<c-u>call vve#encode#VisualEncodeJSONFull(visualmode())<CR>
vnoremap <leader>eu :<c-u>call vve#encode#VisualEncodeURL(visualmode())<CR>
vnoremap <leader>eU :<c-u>call vve#encode#VisualEncodeURLFull(visualmode())<CR>
vnoremap <leader>ex :<c-u>call vve#encode#VisualEncodeXml(visualmode())<CR>
vnoremap <leader>eX :<c-u>call vve#encode#VisualEncodeXmlFull(visualmode())<CR>

vnoremap <leader>da :<c-u>call vve#encode#VisualDecodeAscii(visualmode())<CR>
vnoremap <leader>db :<c-u>call vve#encode#VisualDecodeBinary(visualmode())<CR>
vnoremap <leader>dB :<c-u>call vve#encode#VisualDecodeBase64(visualmode())<CR>
vnoremap <leader>dh :<c-u>call vve#encode#VisualDecodeHex(visualmode())<CR>
vnoremap <leader>dH :<c-u>call vve#encode#VisualDecodeHexString(visualmode())<CR>
vnoremap <leader>du :<c-u>call vve#encode#VisualDecodeURL(visualmode())<CR>
vnoremap <leader>dU :<c-u>call vve#encode#VisualDecodeURLFull(visualmode())<CR>
vnoremap <leader>de :<c-u>call vve#encode#VisualDecodeHtml(visualmode())<CR>
vnoremap <leader>dE :<c-u>call vve#encode#VisualDecodeHtmlFull(visualmode())<CR>
vnoremap <leader>dj :<c-u>call vve#encode#VisualDecodeJSON(visualmode())<CR>
vnoremap <leader>dJ :<c-u>call vve#encode#VisualDecodeJSON(visualmode())<CR>
vnoremap <leader>dx :<c-u>call vve#encode#VisualDecodeXml(visualmode())<CR>
vnoremap <leader>dX :<c-u>call vve#encode#VisualDecodeHtmlFull(visualmode())<CR>

vnoremap <leader>Eb :<c-u>call vve#encode#VisualEncodeBinaryFromAscii(visualmode())<CR>
vnoremap <leader>EB :<c-u>call vve#encode#VisualEncodeBase64FromAscii(visualmode())<CR>
vnoremap <leader>Eh :<c-u>call vve#encode#VisualEncodeHexFromAscii(visualmode())<CR>
vnoremap <leader>EH :<c-u>call vve#encode#VisualEncodeHexStringFromAscii(visualmode())<CR>
vnoremap <leader>Ee :<c-u>call vve#encode#VisualEncodeHtmlFullFromAscii(visualmode())<CR>
vnoremap <leader>EE :<c-u>call vve#encode#VisualEncodeHtmlFullFromAscii(visualmode())<CR>
vnoremap <leader>Eu :<c-u>call vve#encode#VisualEncodeURLFromAscii(visualmode())<CR>
vnoremap <leader>EU :<c-u>call vve#encode#VisualEncodeURLFullFromAscii(visualmode())<CR>
vnoremap <leader>Ex :<c-u>call vve#encode#VisualEncodeXmlFullFromAscii(visualmode())<CR>
vnoremap <leader>EX :<c-u>call vve#encode#VisualEncodeXmlFullFromAscii(visualmode())<CR>

vnoremap <leader>Db :<c-u>call vve#encode#VisualDecodeBinaryToAscii(visualmode())<CR>
vnoremap <leader>DB :<c-u>call vve#encode#VisualDecodeBase64ToAscii(visualmode())<CR>
vnoremap <leader>Dh :<c-u>call vve#encode#VisualDecodeHexToAscii(visualmode())<CR>
vnoremap <leader>DH :<c-u>call vve#encode#VisualDecodeHexStringToAscii(visualmode())<CR>
vnoremap <leader>Du :<c-u>call vve#encode#VisualDecodeURLToAscii(visualmode())<CR>
vnoremap <leader>DU :<c-u>call vve#encode#VisualDecodeURLFullToAscii(visualmode())<CR>
vnoremap <leader>De :<c-u>call vve#encode#VisualDecodeHtmlFullToAscii(visualmode())<CR>
vnoremap <leader>DE :<c-u>call vve#encode#VisualDecodeHtmlFullToAscii(visualmode())<CR>
vnoremap <leader>Dx :<c-u>call vve#encode#VisualDecodeXmlFullToAscii(visualmode())<CR>
vnoremap <leader>DX :<c-u>call vve#encode#VisualDecodeXmlFullToAscii(visualmode())<CR>

" number conversion and inplace arithmetic

vnoremap <leader>th :<c-u>call vve#numbers#VisualToHex(visualmode())<CR>
vnoremap <leader>tH :<c-u>call vve#numbers#VisualToHexString(visualmode())<CR>
vnoremap <leader>tb :<c-u>call vve#numbers#VisualToBin(visualmode())<CR>
vnoremap <leader>to :<c-u>call vve#numbers#VisualToOct(visualmode())<CR>
vnoremap <leader>td :<c-u>call vve#numbers#VisualToDec(visualmode())<CR>
vnoremap <leader>ma :<c-u>call vve#numbers#VisualInPlaceAdd(visualmode())<CR>
vnoremap <leader>ms :<c-u>call vve#numbers#VisualInPlaceSub(visualmode())<CR>
vnoremap <leader>mm :<c-u>call vve#numbers#VisualInPlaceMul(visualmode())<CR>
vnoremap <leader>md :<c-u>call vve#numbers#VisualInPlaceDiv(visualmode())<CR>

" other util functions

vnoremap <leader>se :<c-u>call vve#strings#VisualSwapEndian(visualmode())<CR>
vnoremap <leader>sc :<c-u>call vve#strings#VisualLength(visualmode())<CR>
vnoremap <leader>sC :<c-u>call vve#strings#VisualLengthHexString(visualmode())<CR>
vnoremap <leader>su :<c-u>call vve#strings#VisualUpper(visualmode())<CR>
vnoremap <leader>sl :<c-u>call vve#strings#VisualLower(visualmode())<CR>
vnoremap <leader>sn :<c-u>call vve#strings#VisualLineLength(visualmode())<CR>
vnoremap <leader>fc :<c-u>call vve#strings#VisualCamelCase(visualmode())<CR>
vnoremap <leader>fs :<c-u>call vve#strings#VisualSnakeCase(visualmode())<CR>
vnoremap <leader>fm :<c-u>call vve#strings#VisualMarkdownAnchor(visualmode())<CR>
vnoremap <leader>fM :<c-u>call vve#strings#VisualMarkdownAnchorReference(visualmode())<CR>

let g:vve_loaded = 1
