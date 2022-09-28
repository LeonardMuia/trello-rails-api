import { useState, useEffect } from "react"
import axios from "axios"
import AddCard from "./AddCard"
import Card from "./Card"

export default(props) => {

    const CardsUrl = "http://localhost:3000/api/trello/cards"

    const [card, setCards] = useState([])

    function getCards() {
        return axios.get(CardsUrl).then(response => response.data)
      }

    useEffect(() => {
        let mounted = true
        getCards().then(items => {
          if(mounted){
            setCards(items)
          }
        })

        return () => (mounted = false)

    }, [])

    function renderCard(data) {
        return (
            <Card key={data.id} name={data.name} />
        )
    }

    const cards = card.map( (data) => (
            props.idList === data.list ? renderCard(data) : false
        )
    )

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
                            <AddCard idList={props.idList} />
                        </form>
                        {cards}
                    </div>
                </div>
            </div>     
        </div>   

    )
}