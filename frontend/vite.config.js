import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'


export default defineConfig({
  plugins: [react()],
  proxy: {
    '/api': {
         target: 'https://localhost:3000/api/trello',
         changeOrigin: true,
         secure: false,      
         ws: true,
     }
}
})
