import { useState, useEffect } from "react"
import axios from "axios"
import TopBar from "./components/TopBar"
import List from "./components/List"
import EmptyPage from "./components/EmptyPage"
import './App.css'

function App() {


    const ListsUrl = "http://localhost:3000/api/trello/lists";

    const [list, setLists] = useState([])

    function getLists() {
      return axios.get(ListsUrl).then(response => response.data)
    }

    useEffect(() => {
        let mounted = true
        getLists().then(items => {
          if(mounted){
            setLists(items)
          }
        })

        return () => (mounted = false)

    }, [])

    const lists = list.map((data) => {
      return (
        <List key={data.id} name={data.name} idList={data.listId} />
      )
    })

    return (
      <>
        <TopBar />
        
        <div className="container main-content">
          <section className="section">
                <div className="row">
                  { list === "undefined" ? <EmptyPage/> : [...lists] }
                </div>
            </section>
        </div>
      </>
    )
}

export default App