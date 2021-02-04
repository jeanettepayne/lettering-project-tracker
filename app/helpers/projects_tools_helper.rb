module ProjectsToolsHelper

    def toggle_favorite(pt)
        if pt.favorite
            # Show the ★ and link to "unfavorite" it
            link_to raw("<i class='fa fa-star favorite'></i>"), favorite_path(pt), method: :delete
        else
            # Show the ☆ and link to "favorite" it
            link_to raw("<i class='far fa-star'></i>"), favorites_path(id: pt.id), method: :post
        end
    end
end
