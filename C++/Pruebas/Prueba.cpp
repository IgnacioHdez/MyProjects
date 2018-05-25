#include<windows.h>
#include "resource.h"
const char g_szClassName[] = "myWindowClass";
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow){return DialogBox(hInstance, MAKEINTRESOURCE(IDD_SIMPLECONTROL), NULL, SimpleProc);}
BOOL CALLBACK SimpleProc(HWND hWndDlg, UINT Message, WPARAM wParam, LPARAM lParam){switch(Message){case WM_INITDIALOG:return TRUE;case WM_COMMAND:switch ( LOWORD (wParam) ) {case ID_HELLO:MessageBox(NULL,"Hey", "Hallo!", MB_OK)break; case ID_FILE_EXIT:EndDialog(hWndDlg, 0);break;}break;case WM_CLOSE:EndDialog(hWndDlg, 0); break; default: return FALSE;}return TRUE;}
