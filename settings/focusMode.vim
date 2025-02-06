" 專注模式測試
" 定義專注模式開關
let g:focus_mode = 0

function! ToggleFocusMode()
    if g:focus_mode == 0
	" 保存當前的窗口佈局
	let g:stored_layout = winsaveview()
	" 關閉所有窗口，只保留當前編輯緩衝區
	silent! execute 'only'

	let g:focus_mode = 1
	echo "Entered Focus Mode"
    else
	" 恢復之前的窗口佈局
	try
	    call winrestview(g:stored_layout)
		execute 'Fern -drawer . -stay'
		execute 'TagbarOpen'
	catch
	    " 如果窗口佈局無法恢復，顯示錯誤
	    echo "Failed to restore layout"
	endtry

	let g:focus_mode = 0
	echo "Exited Focus Mode"
    endif
endfunction

" 綁定命令快
command! FocusModeToggle call ToggleFocusMode()

" 綁定快捷鍵
nnoremap <F2> :FocusModeToggle<CR>

