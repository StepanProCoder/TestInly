//
//  CoreDataManager.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//
import CoreData

public class CoreDataManager {
    public static let shared = CoreDataManager()
    private static let modelName = "FavoritesModel"

    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Core Data Load Error: \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    public func saveContext() -> Error? {
        do {
            try context.save()
        } catch {
            return error
        }
        return nil
    }

    public func saveFavorite(news: News) -> Error? {
        _ = FavoriteNews.from(news: news, context: context)
        return saveContext()
    }

    public func deleteFavorite(news: News) -> Error? {
        let fetchRequest: NSFetchRequest<FavoriteNews> = FavoriteNews.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "url == %@", news.url)

        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                context.delete(object)
            }
            return saveContext()
        } catch {
            return error
        }
    }

    public func isFavorite(news: News) -> Bool {
        let fetchRequest: NSFetchRequest<FavoriteNews> = FavoriteNews.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "url == %@", news.url)

        do {
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch {
            return false
        }
    }

    public func fetchFavorites() -> ([FavoriteNews]?, Error?) {
        let fetchRequest: NSFetchRequest<FavoriteNews> = FavoriteNews.fetchRequest()

        do {
            let results = try context.fetch(fetchRequest)
            return (results, nil)
        } catch {
            return (nil, error)
        }
    }
}
