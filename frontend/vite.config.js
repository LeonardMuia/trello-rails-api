import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'


export default defineConfig({
  plugins: [react()],
  proxy: {
    '/api': {
         target: 'http://localhost:3000/api/trello/', /*  Doesn't work...needs to debug */
         changeOrigin: true,
         secure: false,      
         ws: true,
     }
}
})
