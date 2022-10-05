import { useState, useEffect } from "react"
import axios from "axios"
import AddCard from "./AddCard"
import Card from "./Card"
import EmptyList from "./EmptyList"

export default(props) => {

    const CardsUrl = "http://localhost:3000/api/trello/cards"

    const [card, setCards] = useState([])

    async function getCards() {
        const response = await axios.get(CardsUrl)
        return response.data
    }

    function saveCardsToLocalStorage() {
        getCards().then(items => {
          localStorage.setItem("cards", JSON.stringify(items) )
        }) 
    }

    useEffect(() => {

        let mounted = true

        saveCardsToLocalStorage()

        const items = localStorage.getItem("cards")

        if(mounted){
            setCards(JSON.parse(items))
        }

        return () => (mounted = false)

    },[])

    const cards = card.map( (data) => (
            props.idList === data.idList ? renderCard(data) : false
        )
    )

    function renderCard(data) {
        return (
            <Card key={data.id} name={data.name} />
        )
    }

    function addCard(listId, title) {
        setCards({
            ...prev,
            "idList": listId,
            "name": title
        })
    }
    
    function renderEmpty() {
        return (
            <EmptyList/>
        )
    }

    const openForm = function (event, id) {
        const form = document.getElementById(`${id}`); 
        if(form) {
            form.style.display = "block";
        }
    }

    return (
 
        <div className="col-md-4">
            <div className="card">
                <div className="card-body">
                    <div className="card--top">
                        <h3 className="card--title">{props.name}</h3>
                        <div className="card--btn" onClick={event => openForm(event, props.idList)}>+ Add</div>
                    </div>
                    <div className="card--items">
                        <form style={{display:"none"}} id={props.idList} className="card--form">
                            <AddCard idList={props.idList} handler={event=> addCard(event, listId, title )}/>
                        </form>
                        {cards}
                    </div>
                </div>
            </div>     
        </div>   

    )
}