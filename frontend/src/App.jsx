import { useState, useEffect } from "react"
import axios from "axios"
import axiosETAGCache from "axios-etag-cache"
import TopBar from "./components/TopBar"
import List from "./components/List"
import Loading from "./components/Loading"
import './App.css'

function App() {


    const ListsUrl = "http://localhost:3000/api/trello/lists";

    const axiosWithETAG = axiosETAGCache(axios)

    const [list, setLists] = useState([])

    function getLists() {
      return axiosWithETAG.get(ListsUrl).then(response => response.data)
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