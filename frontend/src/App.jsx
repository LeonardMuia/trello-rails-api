import { useState, useEffect } from "react"
import axios from "axios"
import TopBar from "./components/TopBar"
import List from "./components/List"
import Loading from "./components/Loading"
import './App.css'

function App() {

    const ListsUrl = "http://localhost:3000/api/trello/lists";

    const [list, setLists] = useState([])

    async function getLists() {
      const response = await axios.get(ListsUrl)
      return response.data
    }

    function saveToLocalStorage() {
      getLists().then(items => {
        localStorage.setItem("lists", JSON.stringify(items) )
      }) 
    }

    useEffect(() => {
        let mounted = true
        
        saveToLocalStorage()

        const items = localStorage.getItem("lists")

        if(mounted){
          setLists(JSON.parse(items))
        }

        return () => (mounted = false)

    },[])



    const lists = list.map((data) => {
      return (
        <List key={data.id} name={data.name} idList={data.id} />
      )
    })

    return (
      <>
        <TopBar />
        
        <div className="container main-content">
          <section className="section">
                <div className="row">
                  { !list.length ? <Loading/> : [...lists] }
                </div>
            </section>
        </div>
      </>
    )
}

export default App